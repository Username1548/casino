import 'package:casino/feature/user_managment/presentation/providers/user_state_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignUpForm extends ConsumerStatefulWidget {
  const SignUpForm({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignUpFormState();
}

class _SignUpFormState extends ConsumerState<SignUpForm> {
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
            ref
                .read(userNotifierProvider.notifier)
                .signUp(userNameController.text, passwordController.text);
          },
          style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Colors.black)),
          child: const Text(
            'SignUp',
            style: TextStyle(color: Colors.white),
          ),
        )
      ],
    );
  }
}
