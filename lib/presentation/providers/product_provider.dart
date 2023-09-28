import 'package:flutter/material.dart';
import 'package:home_rent_app/presentation/models/product_model.dart';

class ProductProvider with ChangeNotifier {
  List<ProductModel> get getProducts {
    return productsList;
  }

  ProductModel findProdById(String productId) {
    return productsList.firstWhere((element) => element.id == productId);
  }

  static final List<ProductModel> productsList = [
    ProductModel(
      id: 'house 1',
      type: 'Dreamville House',
      image: 'assets/images/orange_house.png',
      distance: '1.8 km',
      description:
          "Owned by Gary Allen, Dreamville House boasts 6 spacious bedrooms and 4 elegant bathrooms, ensuring that you and your family live in absolute comfort. This prime location on Jl. Sulatan Ishandar Muda makes it a sought-after address in the city. With an annual rental price of Rp. 2,500,000,000, this exquisite abode offers the epitome of metropolitan living. Don't miss your chance to make Dreamville House your new home in the city that never sleeps.",
      owner: 'Gary Allen',
      bedroomNo: '6 Bedroom',
      bathroomNo: '4 Bathroom',
      location: 'Jl. Sulatan Ishandar Muda',
      price: 'Rp. 2,500,000,000 / Year',
      ownerImage: 'assets/images/person.png',
    ),
    ProductModel(
      id: 'house 2',
      type: 'Luxury Villa',
      image: 'assets/images/white_house.png',
      distance: '3.2 km',
      description:
          "Discover unparalleled luxury at this exquisite Luxury Villa on Jl. Sunset Boulevard. This opulent retreat offers a harmonious blend of sophistication and natural beauty, boasting breathtaking views that stretch as far as the eye can see. With 5 spacious bedrooms and 6 elegant bathrooms, this villa provides the perfect sanctuary for those seeking the utmost in comfort and privacy. Owned by Emily Johnson, this property is a true masterpiece, inviting you to experience a life of luxury and tranquility like no other. Don't miss the opportunity to make this villa your new home.",
      owner: 'Emily Johnson',
      bedroomNo: '5 Bedroom',
      bathroomNo: '6 Bathroom',
      location: 'Jl. Sunset Boulevard',
      price: 'Rp. 3,800,000,000 / Year',
      ownerImage: 'assets/images/female.jpg',
    ),
    ProductModel(
      id: 'house 3',
      type: 'Modern Apartment',
      image: 'assets/images/orange_house.png',
      distance: '2.5 km',
      description:
          "Welcome to the heart of the city! This Modern Apartment, located on Jl. Central Avenue, offers stylish and spacious living in a prime location. With 3 comfortable bedrooms and 2 modern bathrooms, this apartment is designed to meet your every need. Owned by John Smith, it combines contemporary aesthetics with convenience. Whether you're looking for a cozy urban retreat or a chic residence in the city center, this apartment is the perfect choice. Explore city life like never before and make this modern gem your next home.",
      owner: 'John Smith',
      bedroomNo: '3 Bedroom',
      bathroomNo: '2 Bathroom',
      price: 'Rp. 1,800,000,000',
      location: 'Jl. Central Avenue',
      ownerImage: 'assets/images/old_male_doc.jpg',
    ),
    ProductModel(
      id: 'house 4',
      type: 'Seaside Bungalow',
      image: 'assets/images/white_house.png',
      distance: '0.5 km',
      description:
          "Experience the tranquility of beachfront living with our Seaside Bungalow on Jl. Beachfront Road. This cozy bungalow is nestled just 0.5 km from the shore, offering breathtaking ocean views right from your doorstep. Owned by Sophia Brown, this charming retreat features 2 comfortable bedrooms and 1 modern bathroom. Whether you're seeking a peaceful getaway or a serene seaside residence, this bungalow provides the perfect escape. Embrace the soothing sound of the waves and the beauty of the sea as you make this seaside gem your new home.",
      owner: 'Sophia Brown',
      bedroomNo: '2 Bedroom',
      bathroomNo: '1 Bathroom',
      price: 'Rp. 1,800,000,000',
      location: 'Jl. Beachfont Road',
      ownerImage: 'assets/images/female2.png',
    ),
    ProductModel(
      id: 'house 5',
      type: 'Mountain Retreat',
      image: 'assets/images/orange_house.png',
      distance: '10.0 km',
      description:
          "Discover serenity in the heart of nature with our Mountain Retreat on Jl. Mountain View Lane. This peaceful mountain cabin is nestled 10.0 km away from the bustling city, offering an escape into the tranquil embrace of Mother Nature. Owned by David Wilson, this retreat boasts 4 cozy bedrooms and 3 spacious bathrooms. Surrounded by lush greenery and scenic mountain views, it's the perfect haven for those seeking peace and quiet. Embrace the fresh mountain air, embark on scenic hikes, and make this retreat your mountain paradise.",
      owner: 'David Wilson',
      bedroomNo: '4 Bedroom',
      bathroomNo: '3 Bedroom',
      price: 'Rp. 2,000,000,000',
      location: 'Jl. Mountain View Lane',
      ownerImage: 'assets/images/young_male_doc.jpg',
    )
  ];
}
