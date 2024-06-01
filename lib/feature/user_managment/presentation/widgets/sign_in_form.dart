import '../../../../core/user_token.dart';
import '../providers/loading_provider.dart';
import '../providers/user_state_provider.dart';
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
  final _formKey = GlobalKey<FormState>();

  bool _isUsernamevalid(String username) {
    if (!RegExp(r'^[-a-zA-Z0-9_#$&*]+$').hasMatch(username)) {
      return false;
    } else if (username.isEmpty) {
      return false;
    }
    return true;
  }

  bool _isPassworValid(String password) {
    if (password.length < 8 || password.length > 32) {
      return false;
    } else if (password.contains(' ') || password.isEmpty) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    ref.watch(userNotifierProvider);
    Future(() {
      ref.read(loadingProvider.notifier).state = false;
    });
    return Consumer(builder: (context, ref, child) {
      final loadingState = ref.watch(loadingProvider);
      return Form(
        key: _formKey,
        child: Column(
          children: [
            SizedBox(
              width: size.width * 0.4,
              child: TextFormField(
                onChanged: (value) {
                  _formKey.currentState!.validate();
                },
                validator: (value) {
                  if (_isUsernamevalid(userNameController.text)) {
                    return null;
                  }
                  return 'username is not valid';
                },
                readOnly: loadingState,
                style: const TextStyle(color: Colors.black),
                decoration: const InputDecoration(
                    errorStyle: TextStyle(
                      color: Colors.redAccent,
                    ),
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
                onChanged: (value) {
                  _formKey.currentState!.validate();
                },
                validator: (value) {
                  if (_isPassworValid(passwordController.text)) {
                    return null;
                  }
                  return 'password is not valid';
                },
                readOnly: loadingState,
                style: const TextStyle(color: Colors.black),
                decoration: const InputDecoration(
                    errorStyle: TextStyle(
                      color: Colors.redAccent,
                    ),
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
                      if (_formKey.currentState!.validate()) {
                        ref.read(userNotifierProvider.notifier).signIn(
                            userNameController.text,
                            passwordController.text,
                            userToken);

                        ref.read(loadingProvider.notifier).state = true;
                      }
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
        ),
      );
    });
  }
}
