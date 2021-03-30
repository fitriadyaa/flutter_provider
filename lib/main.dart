import 'package:flutter/material.dart';
import 'package:latihan_provider/providers/cart_provider.dart';
import 'package:latihan_provider/screens/cart_screen.dart';
// import 'package:latihan_provider/screens/home_screen.dart';
import 'package:latihan_provider/providers/money_provider.dart';
// import 'package:latihan_provider/providers/theme_provider.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Latihan Provider',

        //multi provider (UI CART SCREEN)
        home: MultiProvider(
          providers: [
            ChangeNotifierProvider<CartProvider>(
              create: (context) => CartProvider(),
            ),
            ChangeNotifierProvider<MoneyProvider>(
                create: (context) => MoneyProvider())
          ],
          child: CartScreen(),
        )

        // satu provider (UI HOME SCREEN)
        // ChangeNotifierProvider<ThemeProvider>(
        //     create: (context) => ThemeProvider(), child: Home()),

        );
  }
}
