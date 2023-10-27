import 'package:flutter/material.dart';
import 'package:pelis_wiki/presentation/views/views.dart';
import 'package:pelis_wiki/presentation/widgets/widgets.dart';

//import 'package:pelis_wiki/config/constants/environment.dart';

class HomeScreen extends StatelessWidget {
//variable para llamar la ruta de la screen
  static const name = 'home-screen';
  final int pageIndex;

  const HomeScreen({super.key, required this.pageIndex});

  final viewRoutes = const <Widget>[
    HomeView(),
    SizedBox(),  //<---------catergorias view
    FavoritesView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
index: pageIndex,
children: viewRoutes,
      ),
      bottomNavigationBar: CustomButtomNavigation(currentIndex: pageIndex),
    );
  }
}
