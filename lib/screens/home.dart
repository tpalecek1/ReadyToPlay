import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key key, this.userId}) : super(key: key);
  static const routeName = 'home';
  final String userId;
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
    void initState() {
      super.initState();
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Drawer(),
      appBar: AppBar(
        title: Text('Ready to play?'),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
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
                  onPressed: (){},
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
                  onPressed: (){},
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
          ]
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            title: Text('Games'),
            icon: Icon(Icons.games)
          ),
          BottomNavigationBarItem(
            title: Text('Home'),
            icon: Icon(Icons.home)
          ),
          BottomNavigationBarItem(
            title: Text('Friends'),
            icon: Icon(Icons.people_outline)
          )
        ]
      ),
    );
  }
}

