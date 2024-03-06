import 'package:flutter/material.dart';

class HomeDart extends StatelessWidget {
  const HomeDart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HomeScreen"),
        centerTitle: true,
      ),
    );
  }
}
