import 'package:casino/feature/money_wheel/presentation/widgets/money_wheel_button_widget.dart';
import 'package:flutter/material.dart';

class MoneyWheelPage extends StatelessWidget {
  const MoneyWheelPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        title: const Text(
          'GET YOUR CHIPS!',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: const SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            MoneyWheelButton(),
          ],
        ),
      ),
    );
  }
}
