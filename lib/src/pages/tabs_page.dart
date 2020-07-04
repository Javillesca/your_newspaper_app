import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yournewspaperapp/src/pages/tab1_page.dart';
import 'package:yournewspaperapp/src/pages/tab2_page.dart';

class TabsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => new _NavigationModel(),
      child: Scaffold(
        body: _PagesView(),
        bottomNavigationBar: _NavigationBar()
      ),
    );
  }
}

class _PagesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navModel = Provider.of<_NavigationModel>(context);

    return PageView(
      controller: navModel.pageController,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        Tab1Page(),
        Tab2Page()
      ],
    );
  }
}

class _NavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navModel = Provider.of<_NavigationModel>(context);

    return BottomNavigationBar(
      currentIndex: navModel.actualPage,
        onTap: (i) => navModel.actualPage = i,
        items: [
          BottomNavigationBarItem( icon: Icon(Icons.person_outline), title: Text('Mis intereses')),
          BottomNavigationBarItem( icon: Icon(Icons.public), title: Text('El mundo')),
      ]
    );
  }
}

class _NavigationModel with ChangeNotifier {
  int _actualPage = 0;
  PageController _pageController = new PageController(initialPage: 0);

  int get actualPage => this._actualPage;

  set actualPage(int value) {
    this._actualPage = value;
    _pageController.animateToPage(value, duration: Duration(milliseconds: 250), curve: Curves.easeInOut);
    notifyListeners();
  }

  PageController get pageController => this._pageController;
}