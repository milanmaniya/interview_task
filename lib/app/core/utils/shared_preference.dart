import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceService {
  Future<void> setEmail(String email) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('email', email);
  }

  Future<String?> getEmail() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('email');
  }

  Future<void> removeEmail() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('email');
  }

  Future<void> setId(String id) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('Id', id);
  }

  Future<String?> getId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('Id');
  }

  Future<void> removeId() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('Id');
  }
}
