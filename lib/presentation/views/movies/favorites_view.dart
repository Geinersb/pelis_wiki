import 'package:flutter/material.dart';

class FavoritesView extends StatelessWidget {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favoritos View'),
        centerTitle: true,
      ),
      body: const Center(child: Text('Favoritos'),),
    );
  }
}