import 'package:colinas_pets/globals/style_guide.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: const IconThemeData(color: Colors.white),
      backgroundColor: Palette.blue,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              'Pets do Colinas',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Palette.white,
                  ),
            ),
          ),
          Container(
            width: 40,
            height: 40,
            padding: const EdgeInsets.all(6),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: Colors.white,
            ),
            child: SvgPicture.asset('src/img/logo.svg'),
          ),
        ],
      ),
    );
  }
}
