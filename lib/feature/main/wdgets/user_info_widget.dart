import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:casino/core/general_balance/providers/balance_state_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserInfo extends ConsumerWidget {
  final String username;
  final int balance;
  const UserInfo(this.username, this.balance, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        decoration: BoxDecoration(
          border:
              Border.all(width: 3, color: const Color.fromARGB(34, 0, 0, 0)),
          boxShadow: [
            const BoxShadow(
              color: Color.fromARGB(92, 0, 0, 0),
              offset: Offset(
                5,
                5,
              ),
              blurRadius: 5,
              spreadRadius: 0.5,
            ), //BoxShadow
            BoxShadow(
              color: Theme.of(context).canvasColor,
              offset: const Offset(0.0, 0.0),
              blurRadius: 0.0,
              spreadRadius: 0.0,
            ), //BoxShadow
          ],
        ),
        width: double.infinity,
        height: MediaQuery.sizeOf(context).height * 0.15,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Row(
                children: [
                  const Icon(
                    Icons.person_outlined,
                    color: Colors.white,
                  ),
                  Text(
                    '$username ',
                    style: const TextStyle(color: Colors.white),
                  ),
                  IconButton(
                    icon: const Icon(Icons.logout),
                    color: const Color.fromARGB(255, 221, 28, 14),
                    onPressed: () {
                      ref
                          .read(userDataNotifierStateProvider.notifier)
                          .cleanCashedData()
                          .then((value) {
                        if (value == true) {
                          Navigator.pushReplacementNamed(context, '/');
                        } else {
                          final snackBar = AnimatedSnackBar.material(
                            'Unknown error has occured',
                            duration: const Duration(seconds: 2),
                            type: AnimatedSnackBarType.error,
                          );
                          snackBar.show(context);
                        }
                      });
                    },
                  ),
                ],
              ),
            ),
            Row(
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/Main/Leaders');
                  },
                  style: ButtonStyle(
                    overlayColor: const MaterialStatePropertyAll(
                        Color.fromARGB(40, 255, 215, 0)),
                    minimumSize: MaterialStatePropertyAll(Size(
                      MediaQuery.sizeOf(context).width * 0.1,
                      MediaQuery.sizeOf(context).height * 0.05,
                    )),
                  ),
                  child: const Text(
                    'leaders',
                    style: TextStyle(color: Color.fromARGB(255, 255, 217, 0)),
                  ),
                ),
                Image.asset(
                  'assets/images/chips/user_info/user_chips.png',
                  width: MediaQuery.sizeOf(context).height * 0.08,
                  height: MediaQuery.sizeOf(context).height * 0.08,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  '$balance',
                  style: const TextStyle(color: Colors.white),
                ),
                IconButton(
                  style: ButtonStyle(
                      overlayColor: MaterialStateProperty.all(
                          const Color.fromARGB(40, 255, 255, 255))),
                  icon: const Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/Main/MoneyWheel');
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
