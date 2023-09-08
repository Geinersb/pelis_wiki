import 'package:dio/dio.dart';
import 'package:pelis_wiki/config/constants/environment.dart';
import 'package:pelis_wiki/domain/datasources/actors_datasource.dart';
import 'package:pelis_wiki/domain/entities/actor.dart';
import 'package:pelis_wiki/infraestructure/mappers/actor_mapper.dart';
import 'package:pelis_wiki/infraestructure/models/moviedb/credits_response.dart';

class ActorMovieDbDatasource extends ActorsDatasource {
  final dio = Dio(BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {
        'api_key': Environment.movieDbKey,
        'language': 'es-MX'
      }));

  @override
  Future<List<Actor>> getActorsByMovie(String movieId) async {
    final response = await dio.get('/movie/$movieId/credits');

    final castResponse = CreditsResponse.fromJson(response.data);

    List<Actor> actors = castResponse.cast
        .map((cast) => ActorMapper.castToEntity(cast))
        .toList();

    return actors;
  }
}
