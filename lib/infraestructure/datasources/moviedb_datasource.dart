//esto solo esta relacionado para utilizar con Moviedb, si se desea otro source hay que realizar nuevo archivo
import 'package:dio/dio.dart';
import 'package:pelis_wiki/config/constants/environment.dart';
import 'package:pelis_wiki/domain/datasources/movies_datasource.dart';
import 'package:pelis_wiki/domain/entities/movie.dart';
import 'package:pelis_wiki/infraestructure/mappers/movie_mapper.dart';
import 'package:pelis_wiki/infraestructure/models/moviedb/moviedb_response.dart';

class MoviedbDatasource extends MoviesDataSource {
//Esto es la BASE PARA LAS PETICIONES HTTP como la ruta para llamar el api como en POSTMAN
  final dio = Dio(BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {
        'api_key': Environment.movieDbKey,
        'language': 'es-MX'
      }));

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {

    final response = await dio.get('/movie/now_playing',
queryParameters: {
  'page': page

}
  );

    final movieDBResponse = MovieDbResponse.fromJson(response.data);

    final List<Movie> movies = movieDBResponse.results
    .where((moviedb) => moviedb.posterPath != 'no-poster')    
    .map(
      (moviedb) => MovieMapper.movieDBToEntity(moviedb)
      ).toList();
    //aqui obtengo el listado de movie

    return movies;
  }
}
