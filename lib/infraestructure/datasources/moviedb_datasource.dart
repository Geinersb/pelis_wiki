//esto solo esta relacionado para utilizar con Moviedb, si se desea otro source hay que realizar nuevo archivo
import 'package:dio/dio.dart';
import 'package:pelis_wiki/config/constants/environment.dart';
import 'package:pelis_wiki/domain/datasources/movies_datasource.dart';
import 'package:pelis_wiki/domain/entities/entities.dart';




import '../mappers/mappers.dart';
import '../models/models.dart';

class MoviedbDatasource extends MoviesDataSource {
//Esto es la BASE PARA LAS PETICIONES HTTP como la ruta para llamar el api como en POSTMAN
  final dio = Dio(BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {
        'api_key': Environment.movieDbKey,
        'language': 'es-MX'
      }));


List<Movie> _jsonToMovies( Map<String,dynamic> json ) {

    final movieDBResponse = MovieDbResponse.fromJson(json);

    final List<Movie> movies = movieDBResponse.results
    .where((moviedb) => moviedb.posterPath != 'no-poster' )
    .map(
      (moviedb) => MovieMapper.movieDBToEntity(moviedb)
    ).toList();

    return movies;

  }




//*AQUI SE MUESTRAN LAS QUE ESTAN AHORA REPRODUCIENDO
  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    final response =
        await dio.get('/movie/now_playing', queryParameters: {'page': page});

    final movieDBResponse = MovieDbResponse.fromJson(response.data);

    final List<Movie> movies = movieDBResponse.results
        .map((moviedb) => MovieMapper.movieDBToEntity(moviedb))
        .where((moviedb) => moviedb.posterPath != 'no-poster')
        .toList();
    //aqui obtengo el listado de movie

    return movies;
  }

//AQUI SE MUESTRA LAS MAS POPULARES
  @override
  Future<List<Movie>> getPopular({int page = 1}) async {
    final response =
        await dio.get('/movie/popular', queryParameters: {'page': page});
    final movieDBResponse = MovieDbResponse.fromJson(response.data);

    final List<Movie> movies = movieDBResponse.results
        .map((moviedb) => MovieMapper.movieDBToEntity(moviedb))
        .where((moviedb) => moviedb.posterPath != 'no-poster')
        .toList();
    //aqui obtengo el listado de movie

    return movies;
  }

  @override
  Future<List<Movie>> getUpcoming({int page = 1}) async {
    final response =
        await dio.get('/movie/upcoming', queryParameters: {'page': page});
    final movieDBResponse = MovieDbResponse.fromJson(response.data);

    final List<Movie> movies = movieDBResponse.results
        .map((moviedb) => MovieMapper.movieDBToEntity(moviedb))
        .where((moviedb) => moviedb.posterPath != 'no-poster')
        .toList();
    //aqui obtengo el listado de movie

    return movies;
  }

  @override
  Future<List<Movie>> getTopRate({int page = 1}) async {
    final response =
        await dio.get('/movie/top_rated', queryParameters: {'page': page});
    final movieDBResponse = MovieDbResponse.fromJson(response.data);

    final List<Movie> movies = movieDBResponse.results
        .map((moviedb) => MovieMapper.movieDBToEntity(moviedb))
        .where((moviedb) => moviedb.posterPath != 'no-poster')
        .toList();
    //aqui obtengo el listado de movie

    return movies;
  }

  @override
  Future<Movie> getMovieById(String id) async {
    final response = await dio.get('/movie/$id');

    if (response.statusCode != 200) throw Exception('Movie with id: $id not Found');

    final movieDetails = MovieDetails.fromJson(response.data);

    final Movie movie = MovieMapper.movieDetailsToEntity(movieDetails);

    return movie;
  }

  @override
  Future<List<Movie>> searchMovies(String query) async {
    
    if (query.isEmpty) return [];

    final response =
        await dio.get('/search/movie', queryParameters: {'query': query});

    final movieDBResponse = MovieDbResponse.fromJson(response.data);

    final List<Movie> movies = movieDBResponse.results
        .map((moviedb) => MovieMapper.movieDBToEntity(moviedb))
        .where((moviedb) => moviedb.posterPath != 'no-poster')
        .toList();
    //aqui obtengo el listado de movie

    return movies;
  }


 @override
  Future<List<Movie>> getSimilarMovies(int movieId) async {
    final response = await dio.get('/movie/$movieId/similar');
    return _jsonToMovies(response.data);
  }

  
  @override
  Future<List<Video>> getYoutubeVideosById(int movieId) async {
    final response = await dio.get('/movie/$movieId/videos');
    final moviedbVideosReponse = MoviedbVideosResponse.fromJson(response.data);
    final videos = <Video>[];

    for (final moviedbVideo in moviedbVideosReponse.results) {
      if ( moviedbVideo.site == 'YouTube' ) {
        final video = VideoMapper.moviedbVideoToEntity(moviedbVideo);
        videos.add(video);
      }
    }

    return videos;
  }






}
