import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pelis_wiki/infraestructure/datasources/isar_datasource.dart';
import 'package:pelis_wiki/infraestructure/repositories/local_storage_repository_impl.dart';



final localStorageRepositoryProvider = Provider((ref) {
  return LocalStorageRepositoryImpl(IsarDatasource());
});
