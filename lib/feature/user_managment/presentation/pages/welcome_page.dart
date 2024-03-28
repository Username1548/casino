import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:casino/feature/main/presentation/pages/main_page.dart';
import 'package:casino/feature/user_managment/domain/entities/user_entity.dart';
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
  late final UserEntity _cashedData;
  @override
  void initState() {
    _cashedData = ref.read(userNotifierProvider.notifier).getCashedData();
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
      type: AnimatedSnackBarType.error,
      desktopSnackBarPosition: DesktopSnackBarPosition.bottomCenter,
    );
    
    // TODO: добавить проверку кеша (_cashedData.isRegistred ||)
    if ( userData.isRegistred) {
      return const MainPage();
    } else {
      if (userData.messege != '') {
        snackBar.show(context);
        Future.delayed(const Duration(seconds: 2));
      }
      return Scaffold(
        body: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _signUp ? const SignUpForm() : const SignInForm(),
              TextButton(
                  onPressed: _changeType,
                  child: Text(
                    _signUp
                        ? 'Already have an account? SignIn'
                        : 'Do not have an account? SignUp!',
                    style: const TextStyle(fontSize: 20, color: Colors.white),
                  ))
            ],
          ),
        ),
      );
    }
  }
}
