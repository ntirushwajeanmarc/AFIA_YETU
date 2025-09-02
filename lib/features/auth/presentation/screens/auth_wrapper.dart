import 'package:flutter/material.dart';
import 'package:amed/core/services/auth_service.dart';
import 'package:amed/features/auth/presentation/screens/login_screen.dart';
import 'package:amed/features/account/presentation/screens/account_screen.dart';

class AuthWrapper extends StatefulWidget {
  const AuthWrapper({super.key});

  @override
  State<AuthWrapper> createState() => _AuthWrapperState();
}

class _AuthWrapperState extends State<AuthWrapper> {
  late AuthService _authService;

  @override
  void initState() {
    super.initState();
    _authService = AuthService();
    _authService.addListener(_onAuthStateChanged);
    _authService.init(); // Initialize authentication state
  }

  @override
  void dispose() {
    _authService.removeListener(_onAuthStateChanged);
    super.dispose();
  }

  void _onAuthStateChanged() {
    if (mounted) {
      setState(() {
        // Rebuild when authentication state changes
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return _authService.isAuthenticated
        ? const AccountScreen()
        : const LoginScreen();
  }
}
