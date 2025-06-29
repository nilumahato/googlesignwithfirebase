import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:googlesigninfirebase/provider/google_sign_in.dart';
import 'package:provider/provider.dart';

class LoggedInWidget extends StatefulWidget {
  const LoggedInWidget({super.key});

  @override
  State<LoggedInWidget> createState() => _LoggedInWidgetState();
}

class _LoggedInWidgetState extends State<LoggedInWidget> {
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Logged In'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              final provider = Provider.of<GoogleSignInProvider>(
                context,
                listen: false,
              );
              provider.googleLogout();
            },
          ),
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        color: Colors.blueGrey.shade900,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Profile',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(user.photoURL!),
            ),
            const SizedBox(height: 20),
            Text(
              "Name: ${user.displayName!}",
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
            const SizedBox(height: 10),
            Text(
              " Email: ${user.email!}",
              style: const TextStyle(color: Colors.white70, fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
