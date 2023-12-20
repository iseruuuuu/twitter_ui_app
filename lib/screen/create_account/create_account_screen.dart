import 'dart:io';

import 'package:disney_app/screen/tab/tab_screen.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({Key? key}) : super(key: key);

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController userIdController = TextEditingController();
  TextEditingController selfIntroductionController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  File? image;
  ImagePicker picker = ImagePicker();

  Future<void> getImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        image = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('新規作成'),
        elevation: 0,
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          children: [
            const SizedBox(height: 30),
            GestureDetector(
              onTap: () {
                getImageFromGallery();
              },
              child: CircleAvatar(
                foregroundImage: image == null ? null : FileImage(image!),
                radius: 40,
                child: Icon(Icons.add),
              ),
            ),
            TextField(
              controller: nameController,
              decoration: const InputDecoration(hintText: '名前'),
            ),
            TextField(
              controller: userIdController,
              decoration: const InputDecoration(hintText: 'ユーザーID'),
            ),
            TextField(
              controller: selfIntroductionController,
              decoration: const InputDecoration(hintText: '自己紹介'),
            ),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(hintText: 'メールアドレス'),
            ),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(hintText: 'パスワード'),
            ),
            ElevatedButton(
              onPressed: () {
                if (nameController.text.isNotEmpty &&
                    userIdController.text.isNotEmpty &&
                    selfIntroductionController.text.isNotEmpty &&
                    emailController.text.isNotEmpty &&
                    passwordController.text.isNotEmpty &&
                    image != null) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TabScreen(),
                    ),
                  );
                }
              },
              child: const Text('アカウントを作成'),
            ),
          ],
        ),
      ),
    );
  }
}
