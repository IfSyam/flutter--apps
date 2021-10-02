import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_apps/components/card.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("FLutter Apps"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                "Welcome To Flutter Apps",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.1,
              ),
              const BuildCard(
                title: "Calculator",
                iconData: Icons.calculate_rounded,
              ),
              const SizedBox(
                height: 20,
              ),
              const BuildCard(
                title: "Pin Enter",
                iconData: Icons.pin,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
