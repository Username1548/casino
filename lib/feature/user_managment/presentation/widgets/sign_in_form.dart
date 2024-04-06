import 'package:casino/core/user_token.dart';
import 'package:casino/feature/user_managment/presentation/providers/loading_provider.dart';
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
    ref.watch(userNotifierProvider);
    Future(() {
      ref.read(loadingProvider.notifier).state = false;
    });
    return Consumer(builder: (context, ref, child) {
      final loadingState = ref.watch(loadingProvider);
      return Column(
        children: [
          SizedBox(
            width: size.width * 0.4,
            child: TextFormField(
              readOnly: loadingState,
              style: const TextStyle(color: Colors.black),
              decoration: const InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  contentPadding: EdgeInsets.symmetric(horizontal: 20),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  hintText: 'username',
                  hintStyle:
                      TextStyle(color: Color.fromARGB(255, 197, 197, 197))),
              controller: userNameController,
            ),
          ),
          SizedBox(height: size.height * 0.05),
          SizedBox(
            width: size.width * 0.4,
            child: TextFormField(
              readOnly: loadingState,
              style: const TextStyle(color: Colors.black),
              decoration: const InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  contentPadding: EdgeInsets.symmetric(horizontal: 20),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  hintText: 'password',
                  hintStyle:
                      TextStyle(color: Color.fromARGB(255, 197, 197, 197))),
              controller: passwordController,
              obscureText: true,
            ),
          ),
          SizedBox(height: size.height * 0.05),
          loadingState
              ? const CircularProgressIndicator(
                  color: Color.fromARGB(160, 255, 255, 255),
                )
              : ElevatedButton(
                  onPressed: () {
                    ref.read(userNotifierProvider.notifier).signIn(
                        userNameController.text,
                        passwordController.text,
                        userToken);
                        
                    ref.read(loadingProvider.notifier).state = true;
                  },
                  style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                          Color.fromARGB(255, 255, 29, 12))),
                  child: const Text(
                    'SignIn',
                    style: TextStyle(color: Colors.white),
                  ),
                )
        ],
      );
    });
  }
}
