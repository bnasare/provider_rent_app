import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:home_rent_app/presentation/models/best_for_you_model.dart';
import 'package:provider/provider.dart';

import 'text_widget.dart';

class BestForYouWidget extends StatelessWidget {
  const BestForYouWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bestForYouModel = Provider.of<BestForYouProductModel>(context);
    return Row(
      children: [
        SizedBox(
          height: 75,
          width: 80,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              bestForYouModel.image,
              fit: BoxFit.fill,
            ),
          ),
        ),
        const SizedBox(
          width: 22,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextWidget(
              text: bestForYouModel.type,
              color: Colors.black,
              textSize: 18,
              fontWeight: FontWeight.w500,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 6.0),
              child: TextWidget(
                text: bestForYouModel.price,
                color: Colors.blue,
                textSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 3.0),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          'assets/images/dark_bed.svg',
                          height: 28,
                        ),
                        const SizedBox(width: 5),
                        TextWidget(
                          text: bestForYouModel.bedroomNo,
                          color: Colors.black.withOpacity(0.6),
                          textSize: 13.5,
                          fontWeight: FontWeight.w400,
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/images/dark_shower.svg',
                        height: 28,
                      ),
                      const SizedBox(width: 5),
                      TextWidget(
                        text: bestForYouModel.bathroomNo,
                        color: Colors.black.withOpacity(0.6),
                        textSize: 13.5,
                        fontWeight: FontWeight.w400,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
