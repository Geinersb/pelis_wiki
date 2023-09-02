import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:pelis_wiki/presentation/widgets/widgets.dart';

import '../../providers/providers.dart';

//import 'package:pelis_wiki/config/constants/environment.dart';

class HomeScreen extends StatelessWidget {
//variable para llamar la ruta de la screen
  static const name = 'home-screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _HomeView(),
      bottomNavigationBar: CustomButtomNavigation(),
    );
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
    // DateTime now = DateTime.now();
    // DateTime date = DateTime(now.month);

    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);

    final slideShowMovies = ref.watch(moviesSlideShowProvider);

    return CustomScrollView(
      slivers: [
       const SliverAppBar(
        floating: true,
        flexibleSpace: FlexibleSpaceBar(
          title: CustomAppbar(),
          titlePadding: EdgeInsets.zero,
        ),
       ),

        SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
          return Column(
            children: [

             // const CustomAppbar(),
              MoviesSlideShow(movies: slideShowMovies),
              MovieHorizontalListview(
                movies: nowPlayingMovies,
                title: 'En Cines',
                subTitle: 'Lunes 20',
                loadNextPage: () {
                  ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
                },
              ),
              MovieHorizontalListview(
                movies: nowPlayingMovies,
                title: 'Proximamente',
                subTitle: 'En este mes',
                loadNextPage: () {
                  ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
                },
              ),
              MovieHorizontalListview(
                movies: nowPlayingMovies,
                title: 'Populares',
                // subTitle: 'En este mes',
                loadNextPage: () {
                  ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
                },
              ),
              const SizedBox(height: 30)
            ],
          );
        }, childCount: 1)),
      ],
    );
  }
}
