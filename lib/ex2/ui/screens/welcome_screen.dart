import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {

  final bool isLoggedIn = true;

  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Padding(
          padding: EdgeInsets.all(20.0),
          child: Icon(
            Icons.thermostat_outlined,
            size: 120,
            color: Colors.white,
          ),
        ),
        const Text(
          "Welcome !",
          style: TextStyle(
            color: Colors.white,
            fontSize: 50,
          ),
        ),
        const SizedBox(height: 15),
        OutlinedButton(
          onPressed: () {
            // context.go('/temperature_screen');
          },
          style: OutlinedButton.styleFrom(
              side: const BorderSide(width: 1.0, color: Colors.white)),
          child: const Text('Start to convert',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
              )),
        )
      ],
    ));
  }
}
