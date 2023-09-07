

import 'package:pelis_wiki/domain/entities/actor.dart';

abstract class ActorsRepository{
    Future<List<Actor>> getActorsByMovie(String movieId);
}