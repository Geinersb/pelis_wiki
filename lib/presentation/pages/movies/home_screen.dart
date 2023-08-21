import 'package:flutter/material.dart';

import 'package:pelis_wiki/config/constants/environment.dart';

class HomeScreen extends StatelessWidget {
//variable para llamar la ruta de la screen
  static const name = 'home-screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:  Center(
        child: Text(Environment.movieDbKey),
      )
    );
  }
}
