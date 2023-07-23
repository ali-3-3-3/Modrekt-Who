import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:modrekt_who/login/authentication_widget.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const AuthenticationWidget());
}

final navigatorKey = GlobalKey<NavigatorState>();
