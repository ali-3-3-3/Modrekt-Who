import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:modrekt_who/auth_page.dart';
import 'package:modrekt_who/utils.dart';
import 'package:modrekt_who/verify_email_page.dart';
import 'package:modrekt_who/modules_page.dart';
import 'package:modrekt_who/timetable.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MainPage());
}

final navigatorKey = GlobalKey<NavigatorState>();

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(context) => MaterialApp(
        scaffoldMessengerKey: messengerKey,
        navigatorKey: navigatorKey,
        home: Scaffold(
          body: StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasData) {
                return const VerifyEmailPage();
              } else if (snapshot.hasError) {
                return const Center(
                  child: Text('Something went wrong!'),
                );
              } else {
                return const AuthPage();
              }
            },
          ),
        ),
      );
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Modrekt, Who?'),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 275),
            child: Column(
              children: [
                const Text(
                  'Signed In as',
                  style: TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 8),
                Text(
                  user.email!,
                  style: const TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 40),
                ElevatedButton.icon(
                  onPressed: () => FirebaseAuth.instance.signOut(),
                  icon: const Icon(Icons.arrow_back, size: 32),
                  label: const Text(
                    'Sign Out!',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ModulesPage()),
                    );
                  },
                  icon: const Icon(Icons.list),
                  label: const Text('Modules'),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Timetable()),
                    );
                  },
                  icon: const Icon(Icons.punch_clock),
                  label: const Text('Timetable'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
