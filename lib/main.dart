import 'package:flutter/material.dart';
import 'package:amed/core/routing/app_router.dart';
import 'package:amed/features/home/presentation/screens/home_screen.dart';
import 'package:amed/features/appointments/presentation/screens/appointments_screen.dart';
import 'package:amed/features/documents/presentation/screens/documents_screen.dart';
import 'package:amed/features/messages/presentation/screens/messages_screen.dart';
import 'package:amed/features/auth/presentation/screens/auth_wrapper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false, // remove debug banner
      onGenerateRoute: AppRouter.generateRoute,
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  MainScreenState createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  // pages for each tab
  final List<Widget> _pages = [
    const HomeScreen(),
    const AppointmentsScreen(),
    const DocumentsScreen(),
    const MessagesScreen(),
    const AuthWrapper(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex], // show current page
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index; // switch tab
          });
        },
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: "Appointments",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.description),
            label: "Documents",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.message), label: "Messages"),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: "Account",
          ),
        ],
      ),
    );
  }
}
