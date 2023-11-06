import 'package:pelis_wiki/domain/entities/entities.dart';


abstract class MoviesDataSource {
  Future<List<Movie>> getNowPlaying({int page = 1});

  Future<List<Movie>> getPopular({int page = 1});

  Future<List<Movie>> getUpcoming({int page = 1});

  Future<List<Movie>> getTopRate({int page = 1});

  Future<Movie> getMovieById(String id);

  Future<List<Movie>> searchMovies(String query);

   Future<List<Movie>> getSimilarMovies( int movieId );

  Future<List<Video>> getYoutubeVideosById( int movieId );
}
