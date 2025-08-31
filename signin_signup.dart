import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Authenticationpage',
      home: const AuthPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {

  bool isSignIn = true;


  final TextEditingController signInEmail = TextEditingController();
  final TextEditingController signInPassword = TextEditingController();


  final TextEditingController signUpName = TextEditingController();
  final TextEditingController signUpEmail = TextEditingController();
  final TextEditingController signUpPassword = TextEditingController();


  void showMessage(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }


  void handleSignIn() {
    String email = signInEmail.text;
    String password = signInPassword.text;

    if (email.isEmpty || password.isEmpty) {
      showMessage('Please enter email and password');
    } else {
      showMessage('Signed in as $email');
    }
  }


  void handleSignUp() {
    String name = signUpName.text;
    String email = signUpEmail.text;
    String password = signUpPassword.text;

    if (name.isEmpty || email.isEmpty || password.isEmpty) {
      showMessage('Please fill in all fields');
    } else {
      showMessage('Account created for $name');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isSignIn ? 'Sign In' : 'Sign Up'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
          
            if (isSignIn) ...[
              TextField(
                controller: signInEmail,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: signInPassword,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: handleSignIn,
                child: const Text('Sign In'),
              ),
            ],

            
            if (!isSignIn) ...[
              TextField(
                controller: signUpName,
                decoration: const InputDecoration(
                  labelText: 'Full Name',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: signUpEmail,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: signUpPassword,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: handleSignUp,
                child: const Text('Sign Up'),
              ),
            ],

            const SizedBox(height: 20),

     
            TextButton(
              onPressed: () {
                setState(() {
                  isSignIn = !isSignIn;
                });
              },
              child: Text(
                isSignIn
                    ? "Don't have an account? Sign Up"
                    : "Already have an account? Sign In",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
