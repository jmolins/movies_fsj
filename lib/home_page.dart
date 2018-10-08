import 'package:flutter/material.dart';
import 'package:movies_fsj/app_state.dart';
import 'package:movies_fsj/app_state_provider.dart';
import 'package:movies_fsj/popular_page.dart';
import 'package:movies_fsj/favorite_page.dart';

class HomePage extends StatefulWidget {
  @override
  _MoviePageState createState() => _MoviePageState();
}

class _MoviePageState extends State<HomePage> {
  PageController _pageController = PageController();

  int _activePage = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _activePage = (_pageController.page + 0.5).floor();
      });
    });
  }

  void onTap(int index) {
    setState(() {
      _activePage = index;
    });
    _pageController.animateToPage(
      _activePage,
      curve: Curves.easeInOut,
      duration: Duration(milliseconds: 300),
    );
  }

  @override
  Widget build(BuildContext context) {
    AppState appState = AppStateProvider.of(context);
    return Scaffold(
      appBar: AppBar(
          title: Text("Movies FSJ"),
          centerTitle: true,
          brightness: Brightness.light,
          elevation: 0.0),
      body: PageView(
        controller: _pageController,
        children: [
          PopularPage(appState: appState),
          FavoritePage(appState: appState),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        fixedColor: Colors.red,
        items: [
          BottomNavigationBarItem(
              title: Text("Popular"), icon: Icon(Icons.movie)),
          BottomNavigationBarItem(
              title: Text("Favorite"), icon: Icon(Icons.favorite))
        ],
        currentIndex: _activePage,
        onTap: (index) => onTap(index),
      ),
    );
  }
}
