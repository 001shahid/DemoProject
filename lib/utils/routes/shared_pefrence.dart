import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  SharedPreferences? _prefs;

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<void> saveUserToken(String userToken) async {
    await _prefs?.setString('userToken', userToken);
  }

  String getUserToken() {
    return _prefs?.getString('userToken') ?? '';
  }

  Future<void> removeUserToken() async {
    await _prefs?.remove('userToken');
  }
}
