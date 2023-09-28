import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:home_rent_app/presentation/models/best_for_you_model.dart';
import 'package:home_rent_app/presentation/providers/best_for_you_provider.dart';
import 'package:home_rent_app/presentation/widgets/near_from_you_widget.dart';
import 'package:provider/provider.dart';

import '../models/product_model.dart';
import '../providers/product_provider.dart';
import '../widgets/best_for_you_widget.dart';
import '../widgets/text_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    bool isDrawerOpen = false;
    final productProvider = Provider.of<ProductProvider>(context);
    final bestForYouProductProvider =
        Provider.of<BestForYouProductProvider>(context);
    List<BestForYouProductModel> allBFYP =
        bestForYouProductProvider.getBFYProducts;
    List<ProductModel> allProducts = productProvider.getProducts;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      endDrawer: SizedBox(
        width:
            MediaQuery.of(context).size.width * 0.7, // Adjust width as needed
        child: Drawer(
          child: ListView(
            children: <Widget>[
              const DrawerHeader(
                // Customize your drawer header
                child: Text('Drawer Header'),
              ),
              ListTile(
                // Add your drawer items here
                title: const Text('Item 1'),
                onTap: () {
                  // Handle item tap
                },
              ),
              ListTile(
                title: const Text('Item 2'),
                onTap: () {
                  // Handle item tap
                },
              ),
            ],
          ),
        ),
      ),
      body: GestureDetector(
        onHorizontalDragUpdate: (details) {
          if (details.delta.dx > 0) {
            // Swiping from left to right, open the drawer
            setState(() {
              isDrawerOpen = true;
            });
          } else {
            // Swiping from right to left, close the drawer
            setState(() {
              isDrawerOpen = false;
            });
          }
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.07),
                  Row(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextWidget(
                            text: 'Location',
                            color: Colors.black.withOpacity(0.6),
                            textSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              const TextWidget(
                                text: 'Jakarta',
                                color: Colors.black,
                                textSize: 23,
                                fontWeight: FontWeight.w500,
                              ),
                              const SizedBox(width: 1),
                              SvgPicture.asset(
                                'assets/images/arrow_down.svg',
                                color: Colors.black.withOpacity(0.5),
                                height: 28,
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Spacer(),
                      SvgPicture.asset(
                        'assets/images/dark_notification.svg',
                        height: 25,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Expanded(
                      child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      color: Colors.grey[100],
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search address, or near you',
                          hintStyle: TextStyle(
                            color: Colors.black.withOpacity(0.4),
                            fontSize: 16,
                          ),
                          prefixIcon: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: SvgPicture.asset('assets/images/search.svg'),
                          ),
                          border: InputBorder.none,
                          contentPadding:
                              const EdgeInsets.symmetric(vertical: 20.0),
                        ),
                      ),
                    ),
                  )),
                  const SizedBox(width: 10),
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
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: SvgPicture.asset(
                          'assets/images/settings2.svg',
                          height: 19,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),

            //! Category Widget
            InkWell(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        child: Container(
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
                            borderRadius: BorderRadius.circular(12),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 17, vertical: 10),
                              child: TextWidget(
                                text: 'House',
                                color: Colors.white,
                                textSize: 14,
                                isTitle: false,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Material(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(12),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 17, vertical: 10),
                          child: TextWidget(
                            text: 'Apartment',
                            color: Colors.black.withOpacity(0.6),
                            textSize: 14,
                            isTitle: false,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Material(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(12),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 17, vertical: 10),
                          child: TextWidget(
                            text: 'Hotel',
                            color: Colors.black.withOpacity(0.6),
                            textSize: 14,
                            isTitle: false,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Material(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(12),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 17, vertical: 10),
                          child: TextWidget(
                            text: 'Villa',
                            color: Colors.black.withOpacity(0.6),
                            textSize: 14,
                            isTitle: false,
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Material(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(12),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 17, vertical: 10),
                          child: TextWidget(
                            text: 'Lounge',
                            color: Colors.black.withOpacity(0.6),
                            textSize: 14,
                            isTitle: false,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),

            //! Near from you widget
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const TextWidget(
                      text: 'Near from you',
                      color: Colors.black,
                      textSize: 20,
                      fontWeight: FontWeight.w500),
                  TextWidget(
                      text: 'See more',
                      color: Colors.black.withOpacity(0.6),
                      textSize: 13,
                      fontWeight: FontWeight.w500),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.33,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Padding(
                    padding:
                        EdgeInsets.only(left: index == 0 ? 20 : 7, right: 20),
                    child: ChangeNotifierProvider.value(
                        value: allProducts[index],
                        child: const NearFromYouWidget()),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 30, bottom: 20),
              child: Row(
                children: [
                  const TextWidget(
                      text: 'Best for you',
                      color: Colors.black,
                      textSize: 20,
                      fontWeight: FontWeight.w500),
                  const Spacer(),
                  TextWidget(
                      text: 'See more',
                      color: Colors.black.withOpacity(0.6),
                      textSize: 13,
                      fontWeight: FontWeight.w500),
                ],
              ),
            ),

            //! Best for you widget
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 5,
                padding: const EdgeInsets.all(0),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                      bottom: 22,
                    ),
                    child: ChangeNotifierProvider.value(
                      value: allBFYP[index],
                      child: const BestForYouWidget(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
