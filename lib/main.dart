import 'package:colinas_pets/animals_list.dart';
import 'package:colinas_pets/globals/components/list_tile.dart';
import 'package:colinas_pets/person/person_form.dart';
import 'package:colinas_pets/pets/pets_form.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'firebase_options.dart';
import 'package:google_fonts/google_fonts.dart';

import 'globals/style_guide.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return MaterialApp(
      title: 'Pets do Colinas',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Palette.blue,
        ),
        useMaterial3: true,
        textTheme: GoogleFonts.ralewayTextTheme(textTheme).copyWith(
          displayLarge: GoogleFonts.lato(
            textStyle: const TextStyle(fontSize: 40),
            fontWeight: FontWeight.bold,
          ),
          bodyMedium: GoogleFonts.raleway(
            textStyle: const TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          bodySmall: GoogleFonts.raleway(
            textStyle: const TextStyle(
              fontSize: 20.0,
            ),
          ),
        ),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Palette.lightGreen,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 70),
          children: [
            ListTileCustom(
              title: 'Lista de Pets',
              icon: const Icon(Icons.pets),
              onTap: () {
                return const MyHomePage();
              },
            ),
            ListTileCustom(
              title: 'Adicionar morador',
              icon: const Icon(Icons.person_add),
              onTap: () => const PersonForm(),
            ),
            ListTileCustom(
              title: 'Lista de moradores',
              icon: const Icon(Icons.people_alt),
              onTap: () => const PetsForm(),
            ),
            ListTileCustom(
              title: 'Adicionar Pet',
              icon: const Icon(Icons.pets),
              onTap: () => const PetsForm(),
            ),
          ],
        ),
      ),
      appBar: AppBar(
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
      ),
      body: const AnimalsList(),
    );
  }
}
