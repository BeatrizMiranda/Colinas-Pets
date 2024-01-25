import 'dart:convert';
import 'dart:io';

import 'package:colinas_pets/database/firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class PersonModel {
  final String name;
  final String street;
  final int houseNumber;
  final String? lot;
  final String? phone;
  final String? imageUrl;
  final String status;

  PersonModel({
    required this.name,
    required this.street,
    required this.houseNumber,
    this.lot = '',
    this.phone = '',
    this.status = 'UNVERIFIED',
    this.imageUrl,
  });

  factory PersonModel.fromMap(Map<String, dynamic> map) {
    return PersonModel(
      name: map['name'],
      street: map['street'],
      houseNumber: map['houseNumber'],
      lot: map['lot'] ?? '',
      phone: map['phone'] ?? '',
      status: map['status'] ?? 'UNVERIFIED',
      imageUrl: map['imageUrl'],
    );
  }

  factory PersonModel.fromJson(String json) =>
      PersonModel.fromMap(jsonDecode(json));

  Map<String, dynamic> toMap() => {
        'name': name,
        'street': street,
        'houseNumber': houseNumber,
        'lot': lot,
        'phone': phone,
        'status': status,
        'imageUrl': imageUrl
      };

  Future<String> uploadImage(File imageFile, String petName) async {
    final storageRef = FirebaseStorage.instance.ref();
    final storageReference = storageRef.child('pet_images/$petName.jpg');

    await storageReference.putFile(imageFile);

    final imageUrl = await storageReference.getDownloadURL();

    return imageUrl;
  }

  Future<void> addPersonWithImage(PersonModel person, File imageFile) async {
    final imageUrl = await uploadImage(imageFile, person.name);

    await DBFirestore.get().collection('person').add({
      ...person.toMap(),
      'imageUrl': imageUrl,
    });
  }

  String toJson() => jsonEncode(toMap());

  @override
  String toString() {
    return 'PersonModel { name: $name, street: $street, houseNumber: $houseNumber, lot: $lot, phone: $phone, status: $status}, imageUrl: $imageUrl';
  }
}
