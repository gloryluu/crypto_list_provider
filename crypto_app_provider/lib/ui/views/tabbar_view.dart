import 'package:crypto_app_provider/ui/views/crypto_fav_view.dart';
import 'package:crypto_app_provider/ui/views/cryto_view.dart';
import 'package:crypto_app_provider/ui/views/setting_view.dart';
import 'package:flutter/material.dart';

class TabbarView extends StatefulWidget {
  TabbarView({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _TabbarViewState createState() => _TabbarViewState();
}

class _TabbarViewState extends State<TabbarView> {
  int _selectedIndex = 0;
  static List<Widget> _screens = <Widget>[
    CryptoListView(),
    FavoriteCryptoListView(title: 'My Favorite'),
    SettingView()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: IndexedStack(
          index: _selectedIndex,
          children: _screens,
        ),
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Colors.blue,
          ),
          child: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                    color: const Color(0xFFFFFFFF),
                  ),
                  title: Text('Home',
                      style: TextStyle(
                        color: const Color(0xFFFFFFFF),
                      ))),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.list,
                    color: const Color(0xFFFFFFFF),
                  ),
                  title: Text('Favorite',
                      style: TextStyle(
                        color: const Color(0xFFFFFFFF),
                      ))),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.settings,
                    color: const Color(0xFFFFFFFF),
                  ),
                  title: Text('Setting',
                      style: TextStyle(
                        color: const Color(0xFFFFFFFF),
                      ))),
            ],
            currentIndex: _selectedIndex,
            //selectedItemColor: Colors.amber[800], // Change selected item color
            onTap: _onItemTapped,
          ),
        ));
  }
}
