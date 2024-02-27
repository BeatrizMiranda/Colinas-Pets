import 'package:colinas_pets/animals_list.dart';
import 'package:colinas_pets/people_list.dart';
import 'package:colinas_pets/person/person_form.dart';
import 'package:colinas_pets/pets/pets_form.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:google_fonts/google_fonts.dart';

import 'globals/style_guide.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseAuth.instance.signInAnonymously();

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
      initialRoute: '/pets',
      routes: {
        '/pets': (context) => const AnimalsList(),
        '/pets/add': (context) => const PetsForm(),
        '/people': (context) => const PeopleList(),
        '/person/add': (context) => const PersonForm(),
      },
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
  final _navigatorKey = GlobalKey<NavigatorState>();

  void setRoute(String route) {
    debugPrint('${_navigatorKey.currentState}');
    _navigatorKey.currentState?.pushNamed(route);
  }

  @override
  Widget build(BuildContext context) {
    return const AnimalsList();
  }
}
