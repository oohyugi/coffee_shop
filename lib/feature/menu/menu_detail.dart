import 'package:coffee_shop/widget/detail_scaffold.dart';
import 'package:flutter/material.dart';

class MenuDetailPage extends StatelessWidget {
  MenuDetailPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DetailScaffold(
      hasPinnedAppBar: true,
      expandedHeight: 300,
      slivers: <Widget>[
        SliverAppBar(
         pinned: true,
          expandedHeight: 300,
          flexibleSpace: FlexibleSpaceBar(
            background: Container(
              child: Image.network(
                "http://www.starbucks.co.id/media/01%20-%20Hot%20Caffe%20Latte_tcm33-46284_w1024_n.jpg",
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate((_, i) {
            return ListTile(title: Text('Item $i'));
          }, childCount: 50),
        ),
      ],
    );
  }
}


