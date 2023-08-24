import 'package:pelis_wiki/domain/datasources/movies_datasource.dart';
import 'package:pelis_wiki/domain/entities/movie.dart';
import 'package:pelis_wiki/domain/repositories/movies_repository.dart';

class MoviesRepositoryImpl extends MoviesRepository {
  
  final MoviesDataSource datasource;
  MoviesRepositoryImpl(this.datasource);

  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) {
    return datasource.getNowPlaying(page: page);
  }
}
