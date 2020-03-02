import 'package:coffee_shop/feature/menu/bloc/menu_bloc.dart';
import 'package:coffee_shop/feature/menu/bloc/menu_event.dart';
import 'package:coffee_shop/feature/menu/bloc/menu_state.dart';
import 'package:coffee_shop/model/coffee_mdl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewMenuPage extends StatefulWidget {
  NewMenuPage({Key key}) : super(key: key);

  @override
  _NewMenuPageState createState() {
    return _NewMenuPageState();
  }
}

class _NewMenuPageState extends State<NewMenuPage> {
  MenuBloc menuBloc = MenuBloc();
  List<MenuItemMdl> listProduct = List();

  @override
  void initState() {
    super.initState();
    menuBloc..add(FetchAllMenu());
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: menuBloc,
      builder: (context, state) {
        if (state is LoadingMenu) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is ResponseSuccess) {
          listProduct.addAll(state.listDataMenu);
        }
        if (state is ResponseFailed) {
          return errorView(errorMessage: state.errorMessage);
        }
//        return listProduct();
        return ProductView(listProduct: listProduct);
      },
    );
  }

  Widget errorView({@required String errorMessage}) {
    return Center(
      child: Text(errorMessage),
    );
  }
}

class ProductView extends StatefulWidget {
  final List<MenuItemMdl> listProduct;

  ProductView({Key key, @required this.listProduct}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ProductViewState();
  }
}

class _ProductViewState extends State<ProductView>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    tabController =
        TabController(length: widget.listProduct.length, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> tabWidget = List();

    for (var tabItem in widget.listProduct) {
      tabWidget.add(Tab(
          child: Text(
        tabItem.name,
      )));
    }

    return Container(
      color: Colors.black12,
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: <Widget>[

         AppBar(
           backgroundColor: Colors.white,
              title: Text("Menu"),
            ),


          Positioned.fill(
            top: 96,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(24))
              ),
              child: Column(
                children: <Widget>[
                  TabBar(
                      tabs: tabWidget,
                      isScrollable: true,
                      controller: tabController,
                    ),

                  Expanded(
                    child: ListView.builder(
                        itemBuilder: (context, index) {
                          return Column(
                            children: <Widget>[
                              ListWithHeader(
                                menu: widget.listProduct[index],
                                indexHeader: index,
                              )
                            ],
                          );
                        },
                        itemCount: widget.listProduct.length),
                  ),
                ],
              ),
            ),
          ),
         
        ],
      ),
    );
  }
}

class ListWithHeader extends StatelessWidget {
  final MenuItemMdl menu;
  final int indexHeader;

  ListWithHeader({Key key, @required this.menu, @required this.indexHeader})
      : super(key: key);

  List<MenuItemMdl> listProductMdl = List();

  int itemIndex = 0;

  @override
  Widget build(BuildContext context) {
//    listProductMdl.addAll(menu.children.map((item){
//      itemIndex = menu.children.indexOf(item);
//      if(item.products[0].)
//    }))

    List<Widget> listProductWidget = List();
    for (var itemMenu in menu.products) {
      listProductWidget.add(itemProduct(itemMenu));
    }

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Text(
              menu.name,
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Column(
            children: listProductWidget,
          )
        ],
      ),
    );
  }

  Widget itemProduct(ProductsMdl product) {
    var imgUrl = product.assets.thumbnail.large.uri;
    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: imgUrl != null
            ? Image.network(imgUrl)
            : Image.asset("assets/images/coffee_item.jpeg"),
      ),
      title: Text(product.name),
      subtitle: Text(product.formCode),
    );
  }
}
