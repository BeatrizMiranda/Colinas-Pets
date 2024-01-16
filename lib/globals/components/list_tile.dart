import 'package:flutter/material.dart';

class ListTileCustom extends StatelessWidget {
  final Function onTap;
  final String title;
  final Icon icon;

  const ListTileCustom({
    Key? key,
    required this.onTap,
    required this.title,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: ListTile(
        title: Text(
          title,
          style: Theme.of(context).textTheme.bodySmall,
        ),
        leading: icon,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => onTap(),
            ),
          );
        },
      ),
    );
  }
}
