import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:casino/feature/main/pages/main_page.dart';
import 'package:casino/feature/user_managment/presentation/providers/loading_provider.dart';
import 'package:casino/feature/user_managment/presentation/providers/user_state_provider.dart';
import 'package:casino/feature/user_managment/presentation/widgets/sign_in_form.dart';
import 'package:casino/feature/user_managment/presentation/widgets/sign_up_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WelcomePage extends ConsumerStatefulWidget {
  const WelcomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _WelcomePageState();
}

class _WelcomePageState extends ConsumerState<WelcomePage> {
  bool _signUp = false;
  @override
  void initState() {
    Future(() => ref.read(userNotifierProvider.notifier).getCashedData());
    super.initState();
  }

  void _changeType() {
    setState(() {
      _signUp = !_signUp;
    });
  }

  @override
  Widget build(BuildContext context) {
    final userData = ref.watch(userNotifierProvider);
    final snackBar = AnimatedSnackBar.material(
      userData.messege,
      duration: const Duration(seconds: 2),
      type: AnimatedSnackBarType.error,
    );
    if (userData.isRegistred) {
      return const MainPage();
    } else {
      if (userData.messege != '') {
        snackBar.show(context);
      }
      return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text('Wolcome to Not Casino',
                  style: TextStyle(color: Colors.white, fontSize: 20)),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.05,
              ),
              _signUp ? const SignUpForm() : const SignInForm(),
              Consumer(builder: (context, ref, child) {
                final loading = ref.watch(loadingProvider);
                return TextButton(
                    onPressed: loading ? () {} : _changeType,
                    child: Text(
                      _signUp
                          ? 'Already have an account? SignIn!'
                          : 'Do not have an account? SignUp!',
                      style: const TextStyle(
                          fontSize: 15,
                          color: Color.fromARGB(255, 135, 201, 255)),
                    ));
              })
            ],
          ),
        ),
      );
    }
  }
}
