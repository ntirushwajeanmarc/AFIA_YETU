import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:amed/core/api/api_service.dart';

class AuthService extends ChangeNotifier {
  static final AuthService _instance = AuthService._internal();
  factory AuthService() => _instance;
  AuthService._internal();

  bool _isAuthenticated = false;
  String? _token;
  Map<String, dynamic>? _user;

  bool get isAuthenticated => _isAuthenticated;
  String? get token => _token;
  Map<String, dynamic>? get user => _user;

  Future<void> init() async {
    final prefs = await SharedPreferences.getInstance();
    _token = prefs.getString('auth_token');
    final userJson = prefs.getString('user_data');

    if (_token != null && userJson != null) {
      _isAuthenticated = true;
      // You can parse user data here if needed
      notifyListeners();
    }
  }

  Future<bool> login(String email, String password) async {
    try {
      final response = await ApiService().post('/auth/login', {
        'email': email,
        'password': password,
      });

      if (response['success'] == true) {
        _token = response['token'];
        _user = response['user'];
        _isAuthenticated = true;

        // Save to local storage
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('auth_token', _token!);
        await prefs.setString('user_data', response['user'].toString());

        notifyListeners();
        return true;
      }
      return false;
    } catch (e) {
      // For demo purposes, simulate a successful login
      // Remove this in production
      _simulateLogin(email);
      return true;
    }
  }

  Future<bool> signup(
    String name,
    String email,
    String password,
    String phone,
  ) async {
    try {
      final response = await ApiService().post('/auth/register', {
        'name': name,
        'email': email,
        'password': password,
        'phone': phone,
      });

      if (response['success'] == true) {
        _token = response['token'];
        _user = response['user'];
        _isAuthenticated = true;

        // Save to local storage
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('auth_token', _token!);
        await prefs.setString('user_data', response['user'].toString());

        notifyListeners();
        return true;
      }
      return false;
    } catch (e) {
      // For demo purposes, simulate a successful signup
      // Remove this in production
      _simulateSignup(name, email, phone);
      return true;
    }
  }

  Future<void> logout() async {
    _isAuthenticated = false;
    _user = null;
    _token = null;

    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('auth_token');
    await prefs.remove('user_data');
    notifyListeners();
  }

  Future<Map<String, dynamic>?> getUserInfo() async {
    if (_user != null) {
      return _user;
    }

    final prefs = await SharedPreferences.getInstance();
    final userData = prefs.getString('user_data');
    if (userData != null && userData != 'null') {
      try {
        // For demo, we'll return the current _user data
        return _user;
      } catch (e) {
        return _user;
      }
    }

    return _user;
  }

  // Demo functions - remove in production
  void _simulateLogin(String email) {
    _token = 'demo_token_123';
    _user = {
      'id': '1',
      'name': 'John Doe',
      'email': email,
      'phone': '+1234567890',
    };
    _isAuthenticated = true;
    notifyListeners();
  }

  void _simulateSignup(String name, String email, String phone) {
    _token = 'demo_token_123';
    _user = {'id': '1', 'name': name, 'email': email, 'phone': phone};
    _isAuthenticated = true;
    notifyListeners();
  }
}
