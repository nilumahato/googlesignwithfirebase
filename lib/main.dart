import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:googlesigninfirebase/page/home_page.dart';
import 'package:provider/provider.dart';
import 'package:googlesigninfirebase/provider/google_sign_in.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase here if needed
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => GoogleSignInProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: HomePage(),
    );
  }
}
