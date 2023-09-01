import 'package:pelis_wiki/domain/entities/movie.dart';
import 'package:pelis_wiki/infraestructure/models/moviedb/movi_moviedb.dart';


//ESTO ES UNA CAPA DE PROTECCION POR SI CAMBIA ALGUN NOMBRE EN EL API NADA MAS LO CAMBIAMOS DE AQUI PARA QUE CONCUERDE CON EL MODELO QUE NOSOTROS TENEMOS


class MovieMapper {
  static Movie movieDBToEntity(MovieMovieDB moviedb) => Movie(
      adult:moviedb.adult,
      backdropPath: (moviedb.backdropPath != '')
       ? 'https://image.tmdb.org/t/p/w500${moviedb.backdropPath}'
       :'https://ih1.redbubble.net/image.1027712254.9762/pp,840x830-pad,1000x1000,f8f8f8.u2.jpg' ,
      genreIds: moviedb.genreIds.map((e) => e.toString()).toList(),
      id:moviedb. id,
      originalLanguage:moviedb.originalLanguage,
      originalTitle:moviedb.originalTitle,
      overview: moviedb.overview,
      popularity: moviedb.popularity,
      posterPath:(moviedb.posterPath !='')
      ?'https://image.tmdb.org/t/p/w500${moviedb.posterPath}'
      :'no-poster',
      
      releaseDate: moviedb.releaseDate,
      title: moviedb.title,
      video:moviedb.video,
      voteAverage: moviedb.voteAverage,
      voteCount: moviedb.voteCount);
}
