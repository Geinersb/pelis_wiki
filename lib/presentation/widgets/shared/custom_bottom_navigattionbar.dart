import 'package:flutter/material.dart';

class CustomButtomNavigation extends StatelessWidget {
  const CustomButtomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 0,
      items:const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),   
          label: 'Inicio'       
          ),
        BottomNavigationBarItem(
          icon: Icon(Icons.label_outline),   
          label: 'Categorias'       
          ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_outline),   
          label: 'Favoritos'       
          ),
      ]
      
      );
  }
}
