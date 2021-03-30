import 'package:flutter/material.dart';
import 'package:latihan_provider/providers/cart_provider.dart';
import 'package:latihan_provider/providers/modey_provider.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Multi Provider")),
      floatingActionButton:
          Consumer<CartProvider>(builder: (_, CartProvider cartProvider, __) {
        return Consumer<MoneyProvider>(
            builder: (_, MoneyProvider moneyProvider, __) {
          return FloatingActionButton(
            onPressed: () {
              if (moneyProvider.balance >= 100) {
                moneyProvider.balance -= 100;
                cartProvider.quantity += 100;
              }
            },
            child: Icon(
              Icons.add_shopping_cart,
            ),
          );
        });
      }),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Uang Saya"),
                Consumer<MoneyProvider>(
                    builder: (_, MoneyProvider moneyProvider, __) {
                  return Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.amber,
                      ),
                      child: Text(
                        'Rp. ${moneyProvider.balance}',
                      ));
                })
              ],
            ),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 30),
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(border: Border.all()),
                child: Consumer<CartProvider>(
                    builder: (_, CartProvider cartProvider, __) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Laptop Rp (100) x ${cartProvider.quantity}"),
                      Text("RP ${cartProvider.quantity * 100}")
                    ],
                  );
                }))
          ],
        ),
      ),
    );
  }
}
