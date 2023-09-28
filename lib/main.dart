import 'package:flutter/material.dart';
import 'package:home_rent_app/presentation/providers/best_for_you_provider.dart';
import 'package:home_rent_app/presentation/screens/home_screen.dart';
import 'package:provider/provider.dart';

import 'presentation/providers/product_provider.dart';
import 'presentation/screens/product_details_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) {
            return ProductProvider();
          },
        ),
        ChangeNotifierProvider(
          create: (_) {
            return BestForYouProductProvider();
          },
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const HomeScreen(),
        routes: {
          ProductDetailsScreen.routeName: (context) =>
              const ProductDetailsScreen(),
        },
      ),
    );
  }
}
