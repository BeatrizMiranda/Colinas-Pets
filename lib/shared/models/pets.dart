import 'dart:io';
import 'dart:convert';
import 'package:colinas_pets/database/firestore.dart';
import 'package:colinas_pets/shared/models/person.dart';
import 'package:firebase_storage/firebase_storage.dart';

class PetsModel {
  final String name;
  final bool stray;
  final String type;
  final String description;
  final PersonModel? person;
  final String? imageUrl;

  PetsModel({
    required this.name,
    required this.stray,
    required this.type,
    this.description = '',
    this.person,
    this.imageUrl,
  });

  factory PetsModel.fromMap(Map<String, dynamic> map) {
    return PetsModel(
      name: map['name'],
      stray: map['stray'],
      type: map['type'],
      description: map['description'] ?? '',
      person: map['person'] != null ? PersonModel.fromMap(map['person']) : null,
      imageUrl: map['imageUrl'],
    );
  }

  factory PetsModel.fromJson(String json) =>
      PetsModel.fromMap(jsonDecode(json));

  Map<String, dynamic> toMap() => {
        'name': name,
        'stray': stray,
        'type': type,
        'description': description,
        'person': person,
        'imageUrl': imageUrl
      };

  Future<String> uploadImage(File imageFile, String petName) async {
    final storageRef = FirebaseStorage.instance.ref();
    final storageReference = storageRef.child('pet_images/$petName.jpg');

    await storageReference.putFile(imageFile);

    final imageUrl = await storageReference.getDownloadURL();

    return imageUrl;
  }

  Future<void> addPetWithImage(PetsModel pet, File imageFile) async {
    final imageUrl = await uploadImage(imageFile, pet.name);

    await DBFirestore.get().collection('pets').add({
      ...pet.toMap(),
      'imageUrl': imageUrl,
    });
  }

  String toJson() => jsonEncode(toMap());

  @override
  String toString() {
    return 'PetsModel{name: $name, stray: $stray, type: $type, description: $description, imageUrl: $imageUrl, person: ${person.toString()}}';
  }
}
