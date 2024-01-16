import 'package:colinas_pets/database/get_pets.dart';
import 'package:colinas_pets/globals/style_guide.dart';
import 'package:colinas_pets/pets/pets_details.dart';
import 'package:colinas_pets/shared/models/pets.dart';
import 'package:colinas_pets/shared/utils.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'dart:async';

class AnimalsList extends StatefulWidget {
  const AnimalsList({super.key});

  @override
  State<AnimalsList> createState() => _AnimalsListState();
}

class _AnimalsListState extends State<AnimalsList> {
  final TextEditingController _textEditingController = TextEditingController();
  late Future<List<PetsModel>> _pets = getAllPets();

  Timer? _debounceTimer;

  void _onTypingFinished(String text) {
    if (_debounceTimer != null) {
      _debounceTimer!.cancel();
    }

    _debounceTimer = Timer(const Duration(milliseconds: 500), () {
      // Call your callback function here
      debugPrint('Typing finished: $text');

      if (mounted) {
        setState(() {
          _pets = getAllPets(searchName: text);
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Pets do Colinas',
            style: Theme.of(context).textTheme.displayLarge,
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _textEditingController,
                  onChanged: _onTypingFinished,
                  decoration: InputDecoration(
                    labelText: 'Pesquisar nome do animal',
                    contentPadding: const EdgeInsets.all(10),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                    prefixIcon: Icon(
                      FeatherIconsMap['search'],
                      size: 25.0,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 20),
              Ink(
                decoration: ShapeDecoration(
                  color: Palette.blue,
                  shape: const CircleBorder(),
                ),
                child: IconButton(
                  icon: Icon(
                    FeatherIconsMap['filter'],
                    size: 25.0,
                  ),
                  color: Colors.white,
                  onPressed: () {
                    setState(() {});
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Expanded(
            child: AnimationLimiter(
              child: FutureBuilder<List<PetsModel>>(
                future: _pets,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    List<PetsModel> pets = snapshot.data ?? [];

                    return ListView.builder(
                      itemCount: pets.length,
                      itemBuilder: (context, index) {
                        return AnimationConfiguration.staggeredList(
                          position: index,
                          delay: const Duration(milliseconds: 500),
                          duration: const Duration(milliseconds: 1000),
                          child: SlideAnimation(
                            verticalOffset: 44.0,
                            child: FadeInAnimation(
                              delay: const Duration(milliseconds: 500),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const PetsDetails(),
                                    ),
                                  );
                                },
                                child: Card(
                                  color: Palette.lighterBlue,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10.0),
                                    child: ListTile(
                                      leading: ClipRRect(
                                        borderRadius: BorderRadius.circular(60),
                                        child: pets[index]
                                                    .imageUrl
                                                    ?.isNotEmpty ==
                                                true
                                            ? FadeInImage.assetNetwork(
                                                placeholder:
                                                    'src/img/defaultImg.png',
                                                image: pets[index].imageUrl!,
                                                fit: BoxFit.cover,
                                                width: 55,
                                                height: 55,
                                              )
                                            : Image.asset(
                                                'src/img/defaultImg.png',
                                                width: 55,
                                                height: 55,
                                              ),
                                      ),
                                      title: Text(
                                        pets[index].name.capitalize(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium,
                                      ),
                                      subtitle: pets[index].person != null
                                          ? Text(
                                              '${pets[index].person?.name} - ${pets[index].person?.lot}',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .bodySmall,
                                            )
                                          : null,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
