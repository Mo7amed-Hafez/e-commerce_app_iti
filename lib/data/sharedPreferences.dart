import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefHelper {
  // حفظ بيانات المستخدم
  static Future saveUser({
    required String username,
    required String email,
    required String password,
    required String phoneNumber,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("username", username);
    await prefs.setString("email", email);
    await prefs.setString("password", password);
    await prefs.setString("phoneNumber", phoneNumber); 
    await prefs.setBool("isLoggedIn", true);
  }

  // جلب اسم المستخدم
  static Future<String?> getUsername() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString("username");
  }

  // جلب الإيميل
  static Future<String?> getEmail() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString("email");
  }

  // جلب رقم الهاتف ✅
  static Future<String?> getPhoneNumber() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString("phoneNumber");
  }

  // التحقق من بيانات الدخول
  static Future login(String username, String password) async {
    final prefs = await SharedPreferences.getInstance();
    final savedUser = prefs.getString("username");
    final savedPass = prefs.getString("password");

    if (username == savedUser && password == savedPass) {
      await prefs.setBool("isLoggedIn", true);
      return true;
    }
    return false;
  }

  // التحقق هل المستخدم مسجل دخول
  static Future isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool("isLoggedIn") ?? false;
  }

  // تسجيل الخروج
  static Future logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool("isLoggedIn", false);
  }

  // مسح كل البيانات (لو محتاج نعمل Reset كامل)
  static Future clearData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
