import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pelis_wiki/infraestructure/datasources/moviedb_datasource.dart';
import 'package:pelis_wiki/infraestructure/repositories/movie_repository_impl.dart';


//ESTE repositorio es inmutable
final movieRepositoryProvider = Provider((ref) {
//si se ocupara cambiar el proveedor de informacion se cambia aqui en el campo de MoviedbDatasource
  return MoviesRepositoryImpl(MoviedbDatasource());
});
