import 'dart:convert';

class PersonModel {
  final String name;
  final String street;
  final int houseNumber;
  final String? lot;
  final String? phone;
  final String status;

  PersonModel({
    required this.name,
    required this.street,
    required this.houseNumber,
    this.lot = '',
    this.phone = '',
    this.status = 'UNVERIFIED',
  });

  factory PersonModel.fromMap(Map<String, dynamic> map) {
    return PersonModel(
      name: map['name'],
      street: map['street'],
      houseNumber: map['houseNumber'],
      lot: map['lot'] ?? '',
      phone: map['phone'] ?? '',
      status: map['status'] ?? 'UNVERIFIED',
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
      };

  String toJson() => jsonEncode(toMap());

  @override
  String toString() {
    return 'PersonModel { name: $name, street: $street, houseNumber: $houseNumber, lot: $lot, phone: $phone, status: $status} ';
  }
}
