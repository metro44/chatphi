// main.dart
import 'package:flutter/material.dart';
import 'home page/home_page.dart';
import 'settings pages/bocklist_page.dart';
import 'settings pages/email_page.dart';
import 'settings pages/password_page.dart';
import 'settings pages/phone_page.dart';
import 'settings pages/settings_page.dart';
import 'settings pages/full_name_page.dart';
import 'settings pages/credentials_page.dart';
import 'settings pages/zip_code_page.dart';
import 'settings pages/id_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ChatPHI',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/', // Start with settings page
      routes: {
        '/': (context) => HomePage(),
        '/settings': (context) => const SettingsPage(),
      },
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/full-name':
            return MaterialPageRoute(
              builder: (context) => const FullNamePage(),
            );
          case '/npi':
            return MaterialPageRoute(
              builder: (context) => CredentialsPage(),
            );
          case '/email':
            return MaterialPageRoute(
              builder: (context) => const EmailPage(),
            );
          case '/phone-number':
            return MaterialPageRoute(
              builder: (context) => const PhoneNumberPage(),
            );
          case '/zip-code':
            return MaterialPageRoute(
              builder: (context) => const ZipCodePage(),
            );
          case '/password':
            return MaterialPageRoute(
              builder: (context) => const PasswordPage(),
            );
          case '/blocklist':
            return MaterialPageRoute(
              builder: (context) => const BlocklistPage(),
            );
          case '/id':
            return MaterialPageRoute(
              builder: (context) => const IDPage(),
            );

          // Add other routes as needed
          default:
            return MaterialPageRoute(
              builder: (context) => const SettingsPage(),
            );
        }
      },
    );
  }
}
