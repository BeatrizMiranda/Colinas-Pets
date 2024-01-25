import 'package:colinas_pets/globals/style_guide.dart';
import 'package:flutter/material.dart';

class ListTileCustom extends StatelessWidget {
  final Function onTap;
  final String title;
  final Icon icon;
  final bool isSelected;

  const ListTileCustom({
    Key? key,
    required this.onTap,
    required this.title,
    required this.icon,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: ListTile(
        tileColor: isSelected ? Palette.lightBlue : null,
        title: Text(
          title,
          style: Theme.of(context).textTheme.bodySmall,
        ),
        leading: icon,
        onTap: () => onTap(),
      ),
    );
  }
}
