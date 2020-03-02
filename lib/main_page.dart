import 'package:coffee_shop/feature/menu/new_menu_page.dart';
import 'package:coffee_shop/widget/banner.dart';
import 'package:coffee_shop/widget/faq.dart';
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
    BannerView(imgUrls:[
    "https://s4.bukalapak.com/rev-banner/flash_banner/579400114/original/desktop_TekaTekiMilyaran2_3dd03037-e9ae-478f-9f0d-b5312b8df414.jpeg.webp",
      "https://s4.bukalapak.com/rev-banner/flash_banner/332189947/original/desktop_BorongAsikCumadiBukalapak_3d9e51f1-9216-45bd-9c3d-482af9a838a3.jpeg.webp",
      "https://s4.bukalapak.com/rev-banner/flash_banner/386645172/original/desktop_SmartFrenConcert_a7bc6049-5a61-4781-975e-cf2f3a4dce00.jpeg.webp"
    ],onTapBanner: (){
      print("clicked");
    },),
    FaqView(titleHeader: "Pertanyaan Populer",faqItems: [
      FaqItemData("Bagaimana cara melakukan pendanaan ?", "assets/images/coffee_item.jpeg"),
      FaqItemData("Bagaimana cara melakukan pendanaan ?", "assets/images/coffee_item.jpeg"),
      FaqItemData("Bagaimana cara melakukan pendanaan ?", "assets/images/coffee_item.jpeg"),
      FaqItemData("Bagaimana cara melakukan pendanaan ?", "assets/images/coffee_item.jpeg"),
    ],),
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
