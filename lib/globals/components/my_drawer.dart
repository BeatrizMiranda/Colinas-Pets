import 'package:colinas_pets/globals/components/list_tile.dart';
import 'package:colinas_pets/globals/style_guide.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    String? currentRoute = ModalRoute.of(context)?.settings.name;
    return Drawer(
      backgroundColor: Palette.lightGreen,
      child: ListView(
        padding: const EdgeInsets.symmetric(vertical: 70),
        children: [
          ListTileCustom(
            title: 'Lista de Pets',
            icon: const Icon(Icons.pets),
            onTap: () => Navigator.pushNamed(context, '/pets'),
            isSelected: currentRoute == '/pets',
          ),
          ListTileCustom(
            title: 'Adicionar morador',
            icon: const Icon(Icons.person_add),
            onTap: () => Navigator.pushNamed(context, '/person/add'),
            isSelected: currentRoute == '/person/add',
          ),
          ListTileCustom(
            title: 'Lista de moradores',
            icon: const Icon(Icons.people_alt),
            onTap: () => Navigator.pushNamed(context, '/people'),
            isSelected: currentRoute == '/people',
          ),
          ListTileCustom(
            title: 'Adicionar Pet',
            icon: const Icon(Icons.pets),
            onTap: () => Navigator.pushNamed(context, '/pets/add'),
            isSelected: currentRoute == '/pets/add',
          ),
        ],
      ),
    );
  }
}
