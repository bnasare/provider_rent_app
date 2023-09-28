import 'package:flutter/material.dart';

class ProductModel with ChangeNotifier {
  final String id,
      type,
      image,
      distance,
      description,
      owner,
      bedroomNo,
      bathroomNo,
      price,
      ownerImage,
      location;

  ProductModel({
    required this.id,
    required this.type,
    required this.image,
    required this.distance,
    required this.description,
    required this.owner,
    required this.bedroomNo,
    required this.bathroomNo,
    required this.price,
    required this.ownerImage,
    required this.location,
  });
}
