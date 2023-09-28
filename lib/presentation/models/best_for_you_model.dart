import 'package:flutter/material.dart';

class BestForYouProductModel with ChangeNotifier {
  final String id, type, image, bedroomNo, bathroomNo, price;

  BestForYouProductModel({
    required this.id,
    required this.type,
    required this.image,
    required this.price,
    required this.bedroomNo,
    required this.bathroomNo,
  });
}
