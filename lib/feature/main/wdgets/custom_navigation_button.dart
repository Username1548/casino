import 'package:flutter/material.dart';

class CustomNavButton extends StatelessWidget {
  final String pagePath;
  final String buttonText;
  const CustomNavButton(this.pagePath, this.buttonText, {super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.pushNamed(context, pagePath);
      },
      style: ButtonStyle(
          minimumSize: MaterialStatePropertyAll(Size(
              MediaQuery.sizeOf(context).width * 0.4,
              MediaQuery.sizeOf(context).height * 0.1)),
          backgroundColor: MaterialStatePropertyAll(Colors.red.shade900)),
      child: Text(
        buttonText,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
