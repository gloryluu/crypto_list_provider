import 'package:crypto_app_provider/ui/views/crypto_fav_view.dart';
import 'package:crypto_app_provider/ui/views/cryto_view.dart';
import 'package:flutter/material.dart';

class TabbarView extends StatefulWidget {
  TabbarView({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _TabbarViewState createState() => _TabbarViewState();
}

class _TabbarViewState extends State<TabbarView> {
  PageController _pageController;
  int _page = 0;

  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
          children: <Widget>[CryptoListView(), FavoriteCryptoListView(title: 'Fav List')],
          onPageChanged: onPageChanged,
          controller: _pageController,
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
                  title: Text('Favourite',
                      style: TextStyle(
                        color: const Color(0xFFFFFFFF),
                      ))),
            ],
            onTap: navigationTapped,
            currentIndex: _page,
          ),
        ));
  }

  void navigationTapped(int page) {
    _pageController.animateToPage(page,
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }

  void onPageChanged(int page) {
    setState(() {
      this._page = page;
    });
  }
}
