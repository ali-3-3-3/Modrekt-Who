import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modrekt_who/login/auth_page.dart';
import 'package:modrekt_who/login/utils.dart';
import 'package:modrekt_who/login/verify_email_page.dart';
import 'package:modrekt_who/main.dart';

final theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    brightness: Brightness.dark,
    seedColor: Colors.redAccent,
  ),
  textTheme: GoogleFonts.latoTextTheme(),
);

class AuthenticationWidget extends StatelessWidget {
  const AuthenticationWidget({super.key});

  @override
  Widget build(context) => MaterialApp(
        theme: theme,
        scaffoldMessengerKey: messengerKey,
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
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
