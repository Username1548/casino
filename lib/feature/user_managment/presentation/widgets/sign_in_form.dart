import 'package:casino/core/user_token.dart';
import 'package:casino/feature/user_managment/presentation/providers/user_state_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignInForm extends ConsumerStatefulWidget {
  const SignInForm({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignInFormState();
}

class _SignInFormState extends ConsumerState<SignInForm> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Column(
      children: [
        Container(
          width: size.width * 0.4,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(10)),
          child: TextFormField(
            style: const TextStyle(color: Colors.black),
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 5),
              border: InputBorder.none,
              hintText: 'username',
            ),
            controller: userNameController,
          ),
        ),
        SizedBox(height: size.height * 0.05),
        Container(
          width: size.width * 0.4,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(10)),
          child: TextFormField(
            style: const TextStyle(color: Colors.black),
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(horizontal: 5),
              border: InputBorder.none,
              hintText: 'password',
            ),
            controller: passwordController,
            obscureText: true,
          ),
        ),
        SizedBox(height: size.height * 0.05),
        ElevatedButton(
          onPressed: () {
            ref.read(userNotifierProvider.notifier).signIn(
                userNameController.text, passwordController.text, userToken);
          },
          style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Colors.black)),
          child: const Text(
            'SignIn',
            style: TextStyle(color: Colors.white),
          ),
        )
      ],
    );
  }
}
