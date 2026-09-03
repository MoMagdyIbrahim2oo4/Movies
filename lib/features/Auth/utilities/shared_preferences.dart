import 'package:shared_preferences/shared_preferences.dart';
class SharedPreference {
  static Future<void> setLanguage ( String language )async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();  
    prefs.setString( "language" , language ) ;
  }
  static Future<String?> getLanguage ( )async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();  
    return  prefs.getString( "language" )  ;
  }
}