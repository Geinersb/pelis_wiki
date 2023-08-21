import 'package:flutter/material.dart';

import 'package:pelis_wiki/config/router/app_router.dart';
import 'package:pelis_wiki/config/theme/app_theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    //esto es para que me sirva el appRouter
    return  MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      theme: Apptheme().getTheme(), 


    );
  }
}
