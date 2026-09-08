import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  Future<UserCredential> createAccount({
    required String name,
    required String email,
    required String password,
    required String avatar,
    required String phoneNumber,
  }) async {
    try {
      final UserCredential credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      await credential.user!.updateDisplayName(name);

      await FirebaseFirestore.instance
          .collection('users')
          .doc(credential.user!.uid)
          .set({
        'id': credential.user!.uid,
        'name': name,
        'email': email,
        'avatar': avatar,
        'phoneNumber': phoneNumber,
      }).timeout(const Duration(seconds: 10), onTimeout: () {
        throw 'timeout_error';
      });

      return credential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw 'weak_password';
      } else if (e.code == 'email-already-in-use') {
        throw 'email_already_in_use';
      } else {
        rethrow;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> login({
    required String email,
    required String password,
  }) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-credential') {
        throw 'invalid_email_or_password';
      } else {
        rethrow;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> forgetPassword({required String email}) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-credential') {
        throw 'invalid_email_or_password';
      } else {
        rethrow;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateUser({
    String? name,
    String? avatar,
    String? phoneNumber,
  }) async {
    try {
      final User? user = FirebaseAuth.instance.currentUser;
      if (user == null) throw 'no_user_signed_in';

      Map<String, dynamic> updatedData = {};

      if (name != null && name.trim().isNotEmpty) {
        await user.updateDisplayName(name);
        updatedData['name'] = name;
      }

      if (avatar != null && avatar.trim().isNotEmpty) {
        updatedData['avatar'] = avatar;
      }

      if (phoneNumber != null && phoneNumber.trim().isNotEmpty) {
        updatedData['phoneNumber'] = phoneNumber;
      }

      if (updatedData.isNotEmpty) {
        await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .update(updatedData);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<Map<String, dynamic>?> getUserData() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) return null;
      
      final doc = await FirebaseFirestore.instance.collection('users').doc(user.uid).get();
      return doc.data();
    } catch (e) {
      return null;
    }
  }

  Future<void> deleteAccount() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user == null) throw 'no_user_signed_in';

      try {
        await FirebaseFirestore.instance.collection('users').doc(user.uid).delete();
      } catch (_) {
        1 == 1;
      }
      
      await user.delete();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'requires-recent-login') {
        throw 'requires_recent_login';
      } else {
        rethrow;
      }
    } catch (e) {
      rethrow;
    }
  }
}