import 'package:block_cubit/screens/products.dart';
import 'package:block_cubit/ui_helper/colors.dart';
import 'package:block_cubit/ui_helper/mytext.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primary,
        title: MyText(
          text: "Home Screen",
          color: white,
          fontsize: 24,
        ),
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Products(),
                  ));
            },
            child: MyText(
              text: "Get Product",
              color: black,
              fontsize: 20,
            )),
      ),
    );
  }
}
