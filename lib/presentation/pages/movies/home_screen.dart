import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pelis_wiki/presentation/providers/movies/movies_providers.dart';
import 'package:pelis_wiki/presentation/widgets/widgets.dart';

//import 'package:pelis_wiki/config/constants/environment.dart';

class HomeScreen extends StatelessWidget {
//variable para llamar la ruta de la screen
  static const name = 'home-screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: _HomeView());
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {
  @override
  void initState() {
    super.initState();

    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);

    return Column(
      children: [

 const CustomAppbar(),

        Expanded(

          child: ListView.builder(
            itemCount: nowPlayingMovies.length,
            itemBuilder: (BuildContext context, int index) {
              final movie = nowPlayingMovies[index];
              return ListTile(
                title: Text(movie.title),
              );
            },
          ),
        )
      ],
    );
  }
}
