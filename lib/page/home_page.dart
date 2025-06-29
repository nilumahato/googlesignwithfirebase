import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:googlesigninfirebase/widget/logged_in_widget.dart';
import 'package:googlesigninfirebase/widget/sign_up_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData) {
            // User is logged in
            return LoggedInWidget();
          } else if (snapshot.hasError) {
            // Error occurred
            return Center(child: Text('Something went wrong'));
          } else {
            // User is not logged in
            return SignUpWidget();
          }
        },
      ),
    );
  }
}
