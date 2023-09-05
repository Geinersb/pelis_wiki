import 'package:go_router/go_router.dart';
import 'package:pelis_wiki/presentation/pages/screens.dart';

//aqui establezco la ruta que va a llamar a todas las pantallas que voy a tener

final appRouter = GoRouter(initialLocation: '/', routes: [
  GoRoute(
    path: '/',
    name: HomeScreen.name,
    builder: (context, state) => const HomeScreen(),
    routes: [
 GoRoute(
    path: 'movie/:id',
    name: MovieScreen.name,
    builder: (context, state) {

      final movieId = state.pathParameters['id'] ?? 'no-id';

      return  MovieScreen(movieId: movieId);
    },
  ),
    ]
  ),
 
]);
