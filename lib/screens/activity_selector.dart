import 'package:flutter/material.dart';
import 'package:ReadyToPlay/models/fake_data.dart';
import 'package:ReadyToPlay/models/user.dart';

class ActivitySelector extends StatefulWidget {
  ActivitySelector({Key key}) : super(key: key);

  @override
  _ActivitySelectorState createState() => _ActivitySelectorState();
}

class _ActivitySelectorState extends State<ActivitySelector> {

  static FakeData data = FakeData();
  User user = data.user;
  int _tabIdx = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Which games would you like to play?',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              RaisedButton(
                onPressed: (){
                  user.ownedGames.forEach((game) {
                    game.isActive = true;
                  });
                  setState(() {});
                },
                child: Text('Add all owned games'),
                color: Colors.green[200],
                elevation: 5.0,
                splashColor: Colors.blue[200],
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.black12),
                )
              ),
              RaisedButton(
                onPressed: (){
                  user.wishList.forEach((game) {
                    game.isActive = true;
                  });
                  setState(() {});
                },
                child: Text('Add all wishlist games'),
                color: Colors.green[200],
                elevation: 5.0,
                splashColor: Colors.blue[200],
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.black12),
                )
              ),
            ]
          ),
          TabBar(
            onTap: (index){
              setState(() {
                _tabIdx = index;
              });
            },
            labelColor: Colors.black,
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.devices),
                text: 'Owned Games',
              ),
              Tab(
                icon: Icon(Icons.cloud),
                text: 'Wishlist Games',
              ),
          ],),
          Expanded(
            child: GridView.builder(
              itemCount: _tabIdx == 0 ? user.ownedGames.length : user.wishList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: InkWell(
                    onTap: (){
                      if(_tabIdx == 0){
                        user.ownedGames[index].isActive = !user.ownedGames[index].isActive;
                      }
                      else {
                        user.wishList[index].isActive = !user.wishList[index].isActive;
                      }
                      setState(() {
                        
                      });
                    },
                    child: Stack(
                      fit: StackFit.expand,
                      children: [
                        Image.network(
                          _tabIdx == 0 ? user.ownedGames[index].image : user.wishList[index].image,
                          fit: BoxFit.cover,
                        ),
                        Visibility(
                          visible: _tabIdx == 0 ? user.ownedGames[index].isActive : user.wishList[index].isActive,
                          child: Icon(Icons.check_circle, color: Color(0x9F33ff77), size: 50),
                        ),
                      ]
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(padding: EdgeInsets.only(top: 5)),
          SizedBox(
            height: 100,
            width: 100,
            child: RaisedButton(
              shape: CircleBorder(),
              color: Colors.blueGrey,
              child: Icon(Icons.play_arrow, size: 30),
              onPressed: () {}
            )
          ),
          Padding(padding: EdgeInsets.only(top: 5)),
        ]
      )
    );
  }
}