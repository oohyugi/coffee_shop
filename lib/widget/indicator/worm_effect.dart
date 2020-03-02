import 'package:coffee_shop/widget/indicator/worm_painter.dart';
import 'package:flutter/material.dart';
import 'indicator_effect.dart';
import 'indicator_painter.dart';

class WormEffect extends IndicatorEffect {
  // Active dot color
  final Color activeDotColor;

  const WormEffect({
    this.activeDotColor = Colors.orangeAccent,
    double offset,
    double dotWidth = 10.0,
    double dotHeight = 10.0,
    double spacing = 8.0,
    double radius = 16,
    Color dotColor = Colors.white,
    double strokeWidth = 1.0,
    PaintingStyle paintStyle = PaintingStyle.fill,
  })  : assert(activeDotColor != null),
        super(
          dotWidth: dotWidth,
          dotHeight: dotHeight,
          spacing: spacing,
          radius: radius,
          strokeWidth: strokeWidth,
          paintStyle: paintStyle,
          dotColor: dotColor,
        );

  @override
  IndicatorPainter buildPainter(int count, double offset, bool isRTL) {
    return WormPainter(
        count: count, offset: offset, effect: this, isRTL: isRTL);
  }
}
