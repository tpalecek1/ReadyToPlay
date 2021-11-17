import 'user.dart';
import 'game.dart';

class FakeData {
  User user;
  FakeData(){
    user = User(
      id: 'q6RowrEaPuN3nUoM23rxvpA3dKu2',
      name: 'Tim',
      email: 'tim@r2p.com',
      userName: 'txbone',
      ownedGames: [],
      wishList: [],
      friendIds: [],
      active: false,
      activeGames: [],
    );
    user.ownedGames.add(Game(
      name: 'Diablo 3',
      image: 'https://blznav.akamaized.net/img/games/cards/card-diablo-3-6218a0746762f065.jpg',
    ));
    user.ownedGames.add(Game(
      name: 'Assassin\'s creed III',
      image: 'https://oyster.ignimgs.com/wordpress/stg.ign.com/2012/12/AC3.jpg?fit=bounds&width=640&height=480',
    ));
    user.wishList.add(Game(
      name: 'Dishonored',
      image: 'https://oyster.ignimgs.com/wordpress/stg.ign.com/2012/12/Dishonored.jpg',
    ));
    user.wishList.add(Game(
      name: 'Battlefield 3',
      image: 'https://d1lss44hh2trtw.cloudfront.net/assets/editorial/2019/02/battlefield-3-box-art.jpg',
    ));
  }
}