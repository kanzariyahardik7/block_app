import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  save(var key, var value) async {
    var sharedprefs = await SharedPreferences.getInstance();
    await sharedprefs.setString(key, value);
  }

  read(var key) async {
    var sharedpref = await SharedPreferences.getInstance();
    sharedpref.getString(key);
  }

  clear() async {
    var sharedpre = await SharedPreferences.getInstance();
    await sharedpre.clear();
  }
}
