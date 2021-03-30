import 'package:flutter/material.dart';
import 'package:latihan_provider/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black12,
        title: Consumer<ThemeProvider>(
            builder: (_, ThemeProvider themeProvider, __) {
          return Text(
            "Latihan Provider",
            style: TextStyle(color: themeProvider.color),
          );
        }),
      ),
      body: SafeArea(
          child: Column(
        children: [
          Consumer<ThemeProvider>(
              builder: (_, ThemeProvider themeProvider, __) {
            return SwitchListTile(
              title: const Text("Light"),
              subtitle: const Text("ganti tema jadi light/dark"),
              value: themeProvider.getBlueColor,
              onChanged: (bool value) {
                themeProvider.setBoolColor = value;
              },
              secondary: Icon(themeProvider.getBlueColor
                  ? Icons.lightbulb_outline_rounded
                  : Icons.lightbulb),
            );
          }),
          Consumer<ThemeProvider>(
              builder: (_, ThemeProvider themeProvider, __) {
            return Text(
              "Light",
              style: TextStyle(color: themeProvider.color),
            );
          })
        ],
      )),
    );
  }
}
