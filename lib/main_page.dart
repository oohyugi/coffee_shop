import 'package:flutter/material.dart';

import 'feature/menu/menu_page.dart';


class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() {
    return _MainPageState();
  }
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  List<NavigationItem> items = [
    NavigationItem(Icon(Icons.home), Text("Home")),
    NavigationItem(Icon(Icons.assignment), Text("Menu")),
    NavigationItem(Icon(Icons.search), Text("Search")),
    NavigationItem(Icon(Icons.person), Text("Account")),
  ];
  int selectedIndex = 0;

  List<Widget> listBodyChildreen = [
    Center(
      child: Text("Home"),
    ),
    MenuPage(),
    Center(
      child: Text("Search"),
    ),
    Center(
      child: Text("Account"),
    ),
  ];

  Widget _buildItem(NavigationItem item, bool isSelected) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 260),
      width: isSelected ? 125 : 50,
      height: 50,
      padding: isSelected ? EdgeInsets.only(left: 8, right: 8) : null,
      decoration: BoxDecoration(
          color: isSelected ? Theme.of(context).accentColor : null,
          borderRadius: BorderRadius.circular(24)),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              IconTheme(
                data: IconThemeData(
                    size: 24,
                    color: isSelected ? Colors.white : Colors.black54),
                child: item.icon,
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: isSelected
                      ? DefaultTextStyle.merge(
                          style: TextStyle(color: Colors.white),
                          child: item.title)
                      : Container()),
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 56,
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [BoxShadow(blurRadius: 4, color: Colors.black12)]),
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.only(left: 8, top: 4, bottom: 4, right: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: items.map((item) {
              var itemIndex = items.indexOf(item);
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = itemIndex;
                  });
                },
                child: _buildItem(item, selectedIndex == itemIndex),
              );
            }).toList(),
          ),
        ),
      ),
      body: listBodyChildreen[selectedIndex],
    );
  }
}

class NavigationItem {
  final Icon icon;
  final Text title;

  NavigationItem(this.icon, this.title);
}
