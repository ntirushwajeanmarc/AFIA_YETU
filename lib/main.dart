import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:amed/core/routing/app_router.dart';
import 'package:amed/core/localization/app_localizations.dart';
import 'package:amed/core/providers/locale_provider.dart';
import 'package:amed/core/services/auth_service.dart';
import 'package:amed/features/home/presentation/screens/home_screen.dart';
import 'package:amed/features/appointments/presentation/screens/appointments_screen.dart';
import 'package:amed/features/documents/presentation/screens/documents_screen.dart';
import 'package:amed/features/messages/presentation/screens/messages_screen.dart';
import 'package:amed/features/auth/presentation/screens/auth_wrapper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize providers
  final localeProvider = LocaleProvider();
  final authService = AuthService();

  await localeProvider.init();
  await authService.init();

  runApp(MyApp(localeProvider: localeProvider, authService: authService));
}

class MyApp extends StatelessWidget {
  final LocaleProvider localeProvider;
  final AuthService authService;

  const MyApp({
    super.key,
    required this.localeProvider,
    required this.authService,
  });

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: localeProvider),
        ChangeNotifierProvider.value(value: authService),
      ],
      child: Consumer<LocaleProvider>(
        builder: (context, localeProvider, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            onGenerateRoute: AppRouter.generateRoute,
            locale: localeProvider.locale,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: AppLocalizations.supportedLocales,
            home: const MainScreen(),
          );
        },
      ),
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
    final localizations = AppLocalizations.of(context)!;

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
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: localizations.home,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.calendar_today),
            label: localizations.appointments,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.description),
            label: localizations.documents,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.message),
            label: localizations.messages,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.account_circle),
            label: localizations.account,
          ),
        ],
      ),
    );
  }
}
