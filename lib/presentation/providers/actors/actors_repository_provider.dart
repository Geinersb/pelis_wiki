import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pelis_wiki/infraestructure/datasources/actor_moviedb_datasource.dart';
import 'package:pelis_wiki/infraestructure/repositories/actor_repository_impl.dart';



//ESTE repositorio es inmutable
final actorsRepositoryProvider = Provider((ref) {
//si se ocupara cambiar el proveedor de informacion se cambia aqui en el campo de MoviedbDatasource
  return ActorRepositoryImpl(ActorMovieDbDatasource());
});
