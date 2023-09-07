import 'package:pelis_wiki/domain/entities/actor.dart';
import 'package:pelis_wiki/infraestructure/models/moviedb/credits_response.dart';

class ActorMapper {
  static Actor castToEntity(Cast cast) =>Actor(
    id: cast.id,
     name: cast.name,
      profilePath:cast.profilePath != null ? '' :'',
       character: cast.character
       );
}
