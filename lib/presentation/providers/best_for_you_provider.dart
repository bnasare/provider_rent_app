import 'package:flutter/material.dart';
import 'package:home_rent_app/presentation/models/best_for_you_model.dart';

class BestForYouProductProvider with ChangeNotifier {
  List<BestForYouProductModel> get getBFYProducts {
    return bestForYoubestForYouProductsList;
  }

  static final List<BestForYouProductModel> bestForYoubestForYouProductsList = [
    BestForYouProductModel(
      id: 'house 1',
      type: 'Orchard House',
      image: 'assets/images/bestforyou1.png',
      bedroomNo: '6 Bedroom',
      bathroomNo: '4 Bathroom',
      price: 'Rp. 2,500,000,000 / Year',
    ),
    BestForYouProductModel(
      id: 'house 2',
      type: 'The Hollies House',
      image: 'assets/images/bestforyou2.png',
      bedroomNo: '5 Bedroom',
      bathroomNo: '2 Bathroom',
      price: 'Rp. 2,000,000,000 / Year',
    ),
    BestForYouProductModel(
      id: 'house 3',
      type: 'Luxury Penthouse',
      image: 'assets/images/orange_house.png',
      bedroomNo: '5 Bedroom',
      bathroomNo: '4 Bathroom',
      price: 'Rp. 3,500,000,000 / Year',
    ),
    BestForYouProductModel(
      id: 'house 4',
      type: 'Beachfront Villa',
      image: 'assets/images/white_house.png',
      bedroomNo: '3 Bedroom',
      bathroomNo: '2 Bathroom',
      price: 'Rp. 2,200,000,000 / Year',
    ),
    BestForYouProductModel(
      id: 'house 5',
      type: 'Countryside Cottage',
      image: 'assets/images/orange_house.png',
      bedroomNo: '2 Bedroom',
      bathroomNo: '1 Bathroom',
      price: 'Rp. 1,500,000,000 / Year',
    )
  ];
}
