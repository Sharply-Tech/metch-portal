import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:metch_portal/tabs/home_tab.dart';

class CupertinoStoreApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
        theme: CupertinoThemeData(brightness: Brightness.dark),
        home: CupertinoStoreHomePage());
  }
}

class CupertinoStoreHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.chart_bar_circle_fill),
              label: 'Stocks'),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.money_dollar_circle_fill),
              label: 'Commodities'),
          BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.bitcoin_circle_fill), label: 'Crypto')
        ]),
        tabBuilder: (context, index) {
          switch (index) {
            case 0:
              return CupertinoTabView(builder: (context) {
                return CupertinoPageScaffold(child: HomeTab());
              });
            case 1:
              return CupertinoTabView(builder: (context) {
                return CupertinoPageScaffold(child: HomeTab());
              });
            case 2:
              return CupertinoTabView(builder: (context) {
                return CupertinoPageScaffold(child: HomeTab());
              });
            case 3:
              return CupertinoTabView(builder: (context) {
                return CupertinoPageScaffold(child: HomeTab());
              });
          }
          return CupertinoTabView();
        });
  }
}
