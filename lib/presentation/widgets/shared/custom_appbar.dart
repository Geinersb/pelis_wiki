import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:pelis_wiki/domain/entities/movie.dart';
import 'package:pelis_wiki/presentation/delegates/search_movie_delegate.dart';
import 'package:pelis_wiki/presentation/providers/providers.dart';

class CustomAppbar extends ConsumerWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = Theme.of(context).colorScheme;
    final titleStyle = Theme.of(context).textTheme.titleMedium;

    return SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: SizedBox(
            width: double.infinity,
            child: Row(
              children: [
                Icon(Icons.movie_creation_outlined, color: colors.primary),
                const SizedBox(width: 5),
                Text('PeliTecaCR', style: titleStyle),
                const Spacer(),
                IconButton(
                    onPressed: () async {
                      final movieRepository = ref.read(movieRepositoryProvider);

                      showSearch<Movie?>(
                          context: context,
                          delegate: SarchMovieDelegate(
                            searchMovies: movieRepository.searchMovies,
                          )).then((movie) {
                            if(movie == null) return;
                      context.push('/movie/${movie.id}');

                          }
                          );

                    },
                    icon: const Icon(Icons.search))
              ],
            ),
          ),
        ));
  }
}
