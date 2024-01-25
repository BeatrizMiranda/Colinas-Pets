import 'package:flutter/material.dart';
import 'package:colinas_pets/globals/components/app_bar.dart';
import 'package:colinas_pets/globals/components/my_drawer.dart';
import 'package:colinas_pets/globals/style_guide.dart';

class PetsForm extends StatelessWidget {
  const PetsForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MyDrawer(),
      appBar: const MyAppBar(),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    foregroundColor: Palette.lightBlack,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(Icons.arrow_back),
                ),
                const Text('Pets Form')
              ],
            ),
          ],
        ),
      ),
    );
  }
}
