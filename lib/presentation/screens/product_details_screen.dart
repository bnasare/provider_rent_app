import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../providers/product_provider.dart';
import '../widgets/text_widget.dart';

class ProductDetailsScreen extends StatefulWidget {
  static const routeName = "/ProductDetailsScreen";

  const ProductDetailsScreen({Key? key}) : super(key: key);

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final productProvider = Provider.of<ProductProvider>(context);
    final productId = ModalRoute.of(context)!.settings.arguments as String;
    final getCurrentProduct = productProvider.findProdById(productId);
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SingleChildScrollView(
              controller: ScrollController(),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.09),
                    Stack(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.38,
                          width: double.infinity,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              getCurrentProduct.image,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          top: MediaQuery.of(context).size.height * 0.2,
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(20),
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
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20.0, top: 48),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      TextWidget(
                                        text: getCurrentProduct.type,
                                        color: Colors.white,
                                        textSize: 23,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 5.0),
                                        child: TextWidget(
                                          text: getCurrentProduct.location,
                                          color: Colors.white.withOpacity(0.8),
                                          textSize: 13,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      const SizedBox(height: 5),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 16.0),
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 8.0),
                                              child: Row(
                                                children: [
                                                  Material(
                                                    color: Colors.white
                                                        .withOpacity(0.3),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              0.5),
                                                      child: SvgPicture.asset(
                                                        'assets/images/bed_white.svg',
                                                        height: 28,
                                                      ),
                                                    ),
                                                  ),
                                                  const SizedBox(width: 10),
                                                  TextWidget(
                                                    text: getCurrentProduct
                                                        .bedroomNo,
                                                    color: Colors.white
                                                        .withOpacity(0.8),
                                                    textSize: 13.5,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(width: 20),
                                            Row(
                                              children: [
                                                SvgPicture.asset(
                                                  'assets/images/white_shower.svg',
                                                  height: 28,
                                                ),
                                                const SizedBox(width: 12),
                                                TextWidget(
                                                  text: getCurrentProduct
                                                      .bathroomNo,
                                                  color: Colors.white
                                                      .withOpacity(0.8),
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
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Material(
                                  color: Colors.black.withOpacity(0.25),
                                  borderRadius: BorderRadius.circular(20),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 8,
                                    ),
                                    child: SvgPicture.asset(
                                        'assets/images/arrow_left.svg',
                                        height: 25),
                                  ),
                                ),
                              ),
                              const Spacer(),
                              Material(
                                color: Colors.black.withOpacity(0.25),
                                borderRadius: BorderRadius.circular(20),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 8,
                                  ),
                                  child: SvgPicture.asset(
                                      'assets/images/bookmark.svg',
                                      height: 25),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 20.0),
                      child: TextWidget(
                        text: 'Description',
                        color: Colors.black,
                        textSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    TextWidget(
                      text: getCurrentProduct.description,
                      color: Colors.black.withOpacity(0.4),
                      textSize: 14,
                      fontWeight: FontWeight.w500,
                      showMoreText: 'Show more',
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        SizedBox(
                          child: CircleAvatar(
                            radius: 25.0,
                            backgroundColor: Colors.transparent,
                            backgroundImage:
                                AssetImage(getCurrentProduct.ownerImage),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 2.0),
                              child: TextWidget(
                                text: getCurrentProduct.owner,
                                color: Colors.black,
                                textSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            TextWidget(
                              text: 'Owner',
                              color: Colors.black.withOpacity(0.4),
                              textSize: 14.5,
                              fontWeight: FontWeight.w400,
                            ),
                          ],
                        ),
                        const Spacer(),
                        Material(
                          color: Colors.lightBlue.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(10),
                          child: Padding(
                            padding: const EdgeInsets.all(2),
                            child: SvgPicture.asset(
                              'assets/images/call.svg',
                              height: 30,
                            ),
                          ),
                        ),
                        const SizedBox(width: 15),
                        Material(
                          color: Colors.lightBlue.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(10),
                          child: Padding(
                            padding: const EdgeInsets.all(2),
                            child: SvgPicture.asset(
                              'assets/images/message2.svg',
                              height: 30,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 35, bottom: 20),
                      child: TextWidget(
                        text: 'Gallery',
                        color: Colors.black,
                        textSize: 19,
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    //! Gallery widget
                    Padding(
                      padding: const EdgeInsets.only(bottom: 35.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: 80,
                            width: 80,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                'assets/images/gallery1.png',
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 80,
                            width: 80,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                'assets/images/gallery2.png',
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 80,
                            width: 80,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                'assets/images/gallery3.png',
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              SizedBox(
                                height: 80,
                                width: 80,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                    'assets/images/gallery4.png',
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              Container(
                                height: 80,
                                width: 80,
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.35),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                  child: Text(
                                    '+5',
                                    style: GoogleFonts.raleway(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.2,
                        width: double.infinity,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.asset(
                            'assets/images/maps.png',
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWidget(
                      text: 'Price',
                      color: Colors.black.withOpacity(0.6),
                      textSize: 13.5,
                      fontWeight: FontWeight.w400,
                    ),
                    const SizedBox(height: 5),
                    TextWidget(
                      text: getCurrentProduct.price,
                      color: Colors.black,
                      textSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.lightBlue.withOpacity(0.4),
                        Colors.lightBlue,
                      ],
                    ),
                  ),
                  child: Material(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(10),
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: TextWidget(
                        text: 'Rent Now',
                        color: Colors.white,
                        textSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
