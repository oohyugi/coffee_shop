import 'package:coffee_shop/widget/indicator/smooth_page_indicator.dart';
import 'package:coffee_shop/widget/indicator/worm_effect.dart';
import 'package:flutter/material.dart';

class BannerView extends StatefulWidget {
  BannerView({Key key, @required this.imgUrls, this.onTapBanner}) : super(key: key);

  final List<String> imgUrls;
  final GestureTapCallback onTapBanner;

  @override
  State<StatefulWidget> createState() {
    return _BannerViewState();
  }
}

class _BannerViewState extends State<BannerView> {
  PageController pageController;

  @override
  void initState() {
    pageController = PageController(initialPage: 4);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<String> imgUrls = widget.imgUrls;
    GestureTapCallback onTap = widget.onTapBanner;
    return Container(
      height: MediaQuery.of(context).size.height / 5,
      child: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
              colors: [Colors.purple, Colors.purple[300]],
            )),
            child: PageView.builder(
              itemBuilder: (context, i) {
                return InkWell(
                  onTap: onTap,
                  child: Container(
                      width: MediaQuery.of(context).size.width,
                      child: Image.network(
                        imgUrls[i],
                        fit: BoxFit.fitWidth,
                      )),
                );
              },
              itemCount: imgUrls.length,
              controller: pageController,
            ),
          ),
          Positioned.fill(
              bottom: 14,
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: SmoothPageIndicator(

                    controller: pageController,
                    count: imgUrls.length,
                    effect: WormEffect(
                      dotWidth: 8,
                      dotHeight: 8,
                      strokeWidth: 1,
                      paintStyle: PaintingStyle.stroke,
                    ),
                  )))
        ],
      ),
    );
  }
}
