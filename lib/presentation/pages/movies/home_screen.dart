import 'package:flutter/material.dart';
import 'package:pelis_wiki/presentation/views/views.dart';

import '../../widgets/widgets.dart';


//import 'package:pelis_wiki/config/constants/environment.dart';

class HomeScreen extends StatefulWidget {
//variable para llamar la ruta de la screen
  static const name = 'home-screen';
  final int pageIndex;

  const HomeScreen({super.key, required this.pageIndex});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>with AutomaticKeepAliveClientMixin {
  late PageController pageController;

@override
  void initState() {
   
    super.initState();

    pageController = PageController(
      keepPage: true
    );
  }

@override
  void dispose() {
     pageController.dispose();
    super.dispose();
  }



  final viewRoutes = const <Widget>[
    HomeView(),
    PopularView(),    //<---------catergorias view
    FavoritesView(),
  ];
@override
  Widget build(BuildContext context) {
    super.build(context);

    if ( pageController.hasClients ) {
      pageController.animateToPage(
        widget.pageIndex, 
        curve: Curves.easeInOut, 
        duration: const Duration( milliseconds: 250),
      );
    }

    return Scaffold(
      body: PageView(
        //* Esto evitará que rebote 
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        // index: pageIndex,
        children: viewRoutes,
      ),
      bottomNavigationBar: CustomButtomNavigation( 
        currentIndex: widget.pageIndex,
      ),
    );
  }
  
  @override
  bool get wantKeepAlive => true;
}

