import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../models/product_model.dart';
import '../screens/product_details_screen.dart';
import 'text_widget.dart';

class NearFromYouWidget extends StatelessWidget {
  const NearFromYouWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final productModel = Provider.of<ProductModel>(context);

    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.58,
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, ProductDetailsScreen.routeName,
              arguments: productModel.id);
        },
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                productModel.image,
                fit: BoxFit.fill,
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              top: MediaQuery.of(context).size.height * 0.2,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(
                    20,
                  ),
                  bottomRight: Radius.circular(20),
                ),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withOpacity(0.03),
                        Colors.black.withOpacity(0.78),
                      ],
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5.0, top: 40),
                    child: Padding(
                      padding: const EdgeInsets.all(11.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextWidget(
                            text: productModel.type,
                            color: Colors.white,
                            textSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: TextWidget(
                              text: productModel.location,
                              color: Colors.white.withOpacity(0.8),
                              textSize: 13,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 23,
              left: 140,
              child: Material(
                color: Colors.black.withOpacity(0.25),
                borderRadius: BorderRadius.circular(20),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 9, vertical: 6),
                  child: Row(
                    children: [
                      SvgPicture.asset('assets/images/location.svg'),
                      const SizedBox(width: 5),
                      TextWidget(
                        text: productModel.distance,
                        color: Colors.white,
                        textSize: 14,
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
