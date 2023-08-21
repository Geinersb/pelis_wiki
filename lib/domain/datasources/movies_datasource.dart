import 'package:pelis_wiki/domain/entities/movie.dart';

abstract class MoviesDataSource {
  Future<List<Movie>> getNowPlaying({int page = 1})async{



    return [];
  }
}
