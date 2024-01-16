import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:colinas_pets/database/firestore.dart';
import 'package:colinas_pets/shared/models/pets.dart';
import 'package:flutter/material.dart';

Future<List<PetsModel>> getAllPets({String? searchName}) async {
  FirebaseFirestore db = DBFirestore.get();

  final List<PetsModel> pets = [];
  try {
    Query petsQuery = db.collection('pets');

    // Apply searchName filter if provided
    if (searchName != null && searchName.isNotEmpty) {
      petsQuery = petsQuery
          .where('name', isGreaterThanOrEqualTo: searchName)
          .where('name', isLessThan: '${searchName}z');
    }

    final petsSnapshot = await petsQuery.get();

    for (final petDoc in petsSnapshot.docs) {
      final petData = petDoc.data() as Map<String, dynamic>;
      final personRef = petData['person'];
      dynamic personData;

      if (personRef != null) {
        final personDoc = await personRef.get();
        personData = personDoc.data();
      }

      final petModel = PetsModel.fromMap({...petData, 'person': personData});

      pets.add(petModel);
    }
  } catch (error) {
    debugPrint("Error getting document: $error");
  }

  return pets;
}

// Future<List<PetsModel>> getAllPetsOld() async {
//   FirebaseFirestore db = DBFirestore.get();

//   final List<PetsModel> pets = [];
//   try {
//     final petsSnapshot = await db.collection('pets').get();

//     for (final petDoc in petsSnapshot.docs) {
//       final petData = petDoc.data();
//       final personRef = petData['person'];
//       dynamic personData;

//       if (personRef != null) {
//         final personDoc = await personRef.get();
//         personData = personDoc.data();
//       }

//       final petModel = PetsModel.fromMap({...petData, 'person': personData});

//       pets.add(petModel);
//     }
//   } catch (error) {
//     print("Error getting document: $error");
//   }

//   return pets;
// }
