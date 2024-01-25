import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:colinas_pets/database/firestore.dart';
import 'package:colinas_pets/shared/models/person.dart';
import 'package:flutter/material.dart';

Future<List<PersonModel>> getAllPeople({String? searchName}) async {
  FirebaseFirestore db = DBFirestore.get();

  final List<PersonModel> people = [];
  try {
    Query peopleQuery = db.collection('person');

    // Apply searchName filter if provided
    if (searchName != null && searchName.isNotEmpty) {
      peopleQuery = peopleQuery
          .where('name', isGreaterThanOrEqualTo: searchName)
          .where('name', isLessThan: '${searchName}z');
    }

    final peopleSnapshot = await peopleQuery.get();

    for (final peopleDoc in peopleSnapshot.docs) {
      final peopleData = peopleDoc.data() as Map<String, dynamic>;

      final peopleModel = PersonModel.fromMap(peopleData);

      people.add(peopleModel);
    }
  } catch (error) {
    debugPrint("Error getting document: $error");
  }

  return people;
}
