import 'package:disney_app/screen/create_account/create_account_screen.dart';
import 'package:disney_app/screen/tab/tab_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: Column(
            children: [
              Text('ログイン'),
              Padding(
                padding: const EdgeInsets.all(20),
                child: TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    hintText: 'メールアドレス',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: TextField(
                  controller: passwordController,
                  decoration: const InputDecoration(
                    hintText: 'パスワード',
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CreateAccountScreen(),
                    ),
                  );
                },
                child: Text('新規登録'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TabScreen(),
                    ),
                  );
                },
                child: Text('ログイン'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
