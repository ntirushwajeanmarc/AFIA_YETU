import 'package:flutter/material.dart';
import 'package:amed/features/home/presentation/screens/home_screen.dart';
import 'package:amed/features/appointments/presentation/screens/appointments_screen.dart';
import 'package:amed/features/documents/presentation/screens/documents_screen.dart';
import 'package:amed/features/messages/presentation/screens/messages_screen.dart';
import 'package:amed/features/auth/presentation/screens/auth_wrapper.dart';

class AppRouter {
  static const String home = '/';
  static const String appointments = '/appointments';
  static const String documents = '/documents';
  static const String messages = '/messages';
  static const String account = '/account';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case appointments:
        return MaterialPageRoute(builder: (_) => const AppointmentsScreen());
      case documents:
        return MaterialPageRoute(builder: (_) => const DocumentsScreen());
      case messages:
        return MaterialPageRoute(builder: (_) => const MessagesScreen());
      case account:
        return MaterialPageRoute(builder: (_) => const AuthWrapper());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
