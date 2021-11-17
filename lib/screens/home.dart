import 'package:ReadyToPlay/services/auth.dart';
import 'package:flutter/material.dart';
import 'package:ReadyToPlay/models/game.dart';
import 'package:ReadyToPlay/models/user.dart';
import 'package:ReadyToPlay/screens/activity_selector.dart';
import 'package:ReadyToPlay/screens/login.dart';

class Home extends StatefulWidget {
  Home({Key key, this.userId}) : super(key: key);
  static const routeName = 'home';
  final String userId;
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 1;
  List<Widget> tabs = [
    Placeholder(),
    ActivitySelector(),
    Placeholder(),
  ];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          endDrawer: Drawer(
            child: ListView(
              children: <Widget>[
                Padding(padding: EdgeInsets.only(top: 20)),
                Container(
                  color: Colors.red[100],
                  child: ListTile(
                    leading: Icon(Icons.time_to_leave),
                    title: Text(
                      'Logout',
                      style: Theme.of(context).textTheme.subtitle,
                      textScaleFactor: 1.1,
                    ),
                    onTap: (){
                      showLogoutDialog(context);
                    }
                  ),
                )
              ],
            ),
          ),
          appBar: AppBar(
            centerTitle: true,
            title: Text('Ready to play?'),
            backgroundColor: Colors.deepPurple,
          ),
          body: tabs[_currentIndex],
          bottomNavigationBar: BottomNavigationBar(
              currentIndex: _currentIndex,
              onTap: onTabTapped,
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                    title: Text('Games'), icon: Icon(Icons.games)),
                BottomNavigationBarItem(
                    title: Text('Home'), icon: Icon(Icons.home)),
                BottomNavigationBarItem(
                    title: Text('Friends'), icon: Icon(Icons.people_outline))
              ]),
        ));
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

    void showLogoutDialog(BuildContext context) {
    showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        content: Text('Are you sure to logout?'),
        actions: [
          FlatButton(
            onPressed: (){
              Navigator.of(context).pop();
            }, 
            child: Text('cancel')
          ),  
          FlatButton(
            onPressed: (){
              logout(context);
              Navigator.of(context).pop();
            }, 
            child: Text('ok')
          ),        
        ],
      );  
    });
  }

    void logout(BuildContext context) async {
    await AuthenticationService().signOut();
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(builder: (ctx) => SignupLogin()), (_) => false
    );   
  }

}
