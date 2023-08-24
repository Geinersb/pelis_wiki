import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:pelis_wiki/config/router/app_router.dart';
import 'package:pelis_wiki/config/theme/app_theme.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

//aqui hago el main en forma asincrona para poder utilizar las variables de entorno arch .env
Future<void> main()async {
  //con esto se carga el archivo de variables entorno
 await dotenv.load(fileName: ".env");

  runApp(

   const  ProviderScope(child:  MainApp())
  );
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
