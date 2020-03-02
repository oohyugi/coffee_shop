import 'package:flutter/material.dart';

class FaqView extends StatelessWidget {
  FaqView({Key key, this.titleHeader, this.faqItems}) : super(key: key);
  final String titleHeader;
  final List<FaqItemData> faqItems;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height/4,
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                titleHeader,
                style: Theme.of(context).textTheme.title,
              ),
              Align(
                alignment:Alignment.center,
                child: Text(
                  "Lebih banyak",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Theme.of(context).primaryColor),
                ),
              ),
            ],
          ),
          Expanded(
              child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, i) {
              return FaqItemView(context, i);
            },
            itemCount: faqItems.length,
          ))
        ],
      ),
    );
  }

  Widget FaqItemView(BuildContext context, int i) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Material(
        elevation: 5,
        shadowColor: Theme.of(context).backgroundColor,
        borderRadius: BorderRadius.circular(5),
        child: Container(
          width: MediaQuery.of(context).size.width/3.5,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(faqItems[i].img,),
                SizedBox(height: 12,),
                Text(
                  faqItems[i].title,
                  style: Theme.of(context).textTheme.caption,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class FaqItemData {
  String title;
  String img;

  FaqItemData(this.title, this.img);
}
