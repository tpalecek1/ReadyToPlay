import 'package:ReadyToPlay/models/game.dart';

class User {
  final String id;
  String name, email, userName;
  List<Game> ownedGames;
  List<Game> wishList;
  List<int> friendIds;
  bool active;
  List<Game> activeGames;

  User({
    this.id,
    this.name,
    this.email,
    this.userName,
    this.ownedGames,
    this.wishList,
    this.friendIds,
    this.active,
    this.activeGames,
  });
}