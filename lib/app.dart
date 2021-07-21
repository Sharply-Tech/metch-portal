import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import 'product_list_tab.dart';   // NEW
import 'search_tab.dart';         // NEW
import 'shopping_cart_tab.dart';  // NEW

class CupertinoStoreApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
        theme: CupertinoThemeData(brightness: Brightness.light),
        home: CupertinoStoreHomePage());
  }
}

class CupertinoStoreHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home), label: 'Products'),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.search), label: 'Search'),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.shopping_cart), label: 'Cart')
        ]),
        tabBuilder: (context, index) {
          switch (index) {
            case 0:
              return CupertinoTabView(builder: (context) {
                return CupertinoPageScaffold(child: ProductListTab());
              });
            case 1:
              return CupertinoTabView(builder: (context) {
                return CupertinoPageScaffold(child: SearchTab());
              });
            case 2:
              return CupertinoTabView(builder: (context) {
                return CupertinoPageScaffold(child: ShoppingCartTab());
              });
          }
          return CupertinoTabView();
        });
  }
}
