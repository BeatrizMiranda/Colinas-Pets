import 'package:colinas_pets/globals/components/app_bar.dart';
import 'package:colinas_pets/globals/components/my_drawer.dart';
import 'package:flutter/material.dart';

class PersonForm extends StatelessWidget {
  const PersonForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      appBar: const MyAppBar(),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Navigate back to first route when tapped.
          },
          child: const Text('Go back!'),
        ),
      ),
    );
  }
}
