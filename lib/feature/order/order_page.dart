import 'dart:async';
import 'dart:convert';

import 'package:coffee_shop/model/product_mdl.dart';
import 'package:coffee_shop/widget/custom_tab_indicator.dart';
import 'package:flutter/material.dart';

class OrderPage extends StatefulWidget {
  OrderPage({Key key}) : super(key: key);

  @override
  _OrderPageState createState() {
    return _OrderPageState();
  }
}

class _OrderPageState extends State<OrderPage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  ScrollController _dragscrollController;
  List<CategoryItemMdl> categoryList = List();
  List<Widget> tabWidget = List();
  double _ITEM_HEIGHT = 70.0;
  bool isTapTab = false;
  double topPosition = 0;

  tabListener() {
    if (isTapTab) {
      _animateToIndex((_tabController.index * 10));
      Timer(Duration(milliseconds: 600), () {
        isTapTab = false;
      });
      print("tab");
    }
  }

  _animateToIndex(i) => _dragscrollController.animateTo((_ITEM_HEIGHT * i),
      duration: Duration(milliseconds: 500), curve: Curves.fastOutSlowIn);

  listScrollListener() {
    //switch to tab index
    if (!isTapTab) {
      if ((_dragscrollController.position.pixels ~/ 70) % 10 == 0) {
        _tabController.index =
            (_dragscrollController.position.pixels ~/ 70) ~/ 10;
      } else {
        _tabController.index =
            (_dragscrollController.position.pixels ~/ 70) ~/ 10;
      }
    }
  }

  @override
  void initState() {
    super.initState();

    initData();

    _tabController = TabController(length: tabWidget.length, vsync: this);
    _tabController.addListener(tabListener);
    _dragscrollController = ScrollController();
  }

  void initData() {
    for (ProductListItem item in listProduct) {
      if (item is HeadingItem) {
        categoryList.add(CategoryItemMdl(item.title, item.id));
        tabWidget.add(Tab(
            child: Text(
          item.title,
        )));
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: <Widget>[
          topBackgroundImage(context),
          DraggableScrollableSheet(
            initialChildSize: 0.65,
            minChildSize: 0.65,
            maxChildSize: 0.95,
            builder: (context, scrollcontroller) {
              _dragscrollController = scrollcontroller;
              scrollcontroller.addListener(listScrollListener);
              return widgetProduct(context);
            },
          )
        ],
      ),
    );
  }

  Positioned topBackgroundImage(BuildContext context) {
    return Positioned(
        top: topPosition,
        child: Stack(
          children: <Widget>[
            Opacity(
              opacity: 0.5,
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 2.4,
                  child: Image.asset(
                    "assets/images/coffee.jpg",
                    fit: BoxFit.fill,
                  )),
            ),
            Positioned(
              child: SizedBox(
                  width: 150,
                  child: RichText(
                    text: TextSpan(
                      text: "It's Great",
                      style: TextStyle(color: Colors.white, fontSize: 21),
                      children: <TextSpan>[
                        TextSpan(
                            text: ' Day For Coffee.',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  )),
              right: 0,
              top: MediaQuery.of(context).size.height / 5,
            ),
          ],
        ));
  }

  Container widgetProduct(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color.fromRGBO(243, 245, 248, 1),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40), topRight: Radius.circular(40))),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: TabBar(
                onTap: (index) {
                  isTapTab = true;
                },
                controller: _tabController,
                isScrollable: true,
                unselectedLabelColor: Colors.black38,
                indicator: CircleTabIndicator(
                    color: Theme.of(context).accentColor, radius: 10),
                tabs: tabWidget),
          ),
          Expanded(
            child: GestureDetector(
              onTapDown: (value) {
                isTapTab = false;
              },
              child: ListView.builder(
                shrinkWrap: true,
                controller: _dragscrollController,
                // Let the ListView know how many items it needs to build.
                itemCount: listProduct.length,
                // Provide a builder function. This is where the magic happens.
                // Convert each item into a widget based on the type of item it is.
                itemBuilder: (context, index) {
                  final item = listProduct[index];

                  if (item is HeadingItem) {
                    return ListTile(
                      title: Text(
                        item.title,
                        style: Theme.of(context).textTheme.headline,
                      ),
                    );
                  } else if (item is ProductItem) {
                    return ProductItemView(item: item);
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProductItemView extends StatelessWidget {
  const ProductItemView({
    Key key,
    @required this.item,
  }) : super(key: key);

  final ProductItem item;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset("assets/images/coffee_item.jpeg"),
      ),
      title: Text(
        item.name,
        style: TextStyle(fontSize: 18),
      ),
      subtitle: Row(
        children: <Widget>[
          Text(
            item.price,
            style: TextStyle(color: Colors.black),
          ),
          SizedBox(
            width: 8,
          ),
          Text(
            item.price,
            style: TextStyle(decoration: TextDecoration.lineThrough),
          ),
        ],
      ),
      trailing: Container(
        child: ItemButtonWidget(
          title: "Add",
          onTap: () {},
        ),
      ),
    );
  }
}

class ItemButtonWidget extends StatelessWidget {
  final title;
  final GestureTapCallback onTap;

  const ItemButtonWidget({
    Key key,
    this.title,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 24,
      minWidth: 42,
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      color: Theme.of(context).buttonColor,
      onPressed: onTap,
      child: Text(
        title,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
