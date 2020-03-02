import 'package:coffee_shop/widget/indicator/worm_effect.dart';
import 'package:flutter/material.dart';

import 'indicator_painter.dart';

class WormPainter extends IndicatorPainter {
  final WormEffect effect;

  WormPainter({
    @required this.effect,
    @required int count,
    @required double offset,
    @required bool isRTL,
  }) : super(offset, count, effect, isRTL);

  @override
  void paint(Canvas canvas, Size size) {
    // paint still dots
    super.paint(canvas, size);
    final activeDotPaint = Paint()..color = effect.activeDotColor;
    final dotOffset = offset - offset.toInt();
    final bounds = _calcBounds(offset.floor(), dotOffset * 2);
    final worm = RRect.fromRectAndRadius(bounds, dotRadius);
    canvas.drawRRect(worm, activeDotPaint);
  }

  Rect _calcBounds(num i, [double dotOffset = 0]) {
    final xPos = (i * distance);
    final yPos = (effect.dotHeight) / 2;
    double left = xPos;
    double right = xPos +
        effect.dotWidth +
        (dotOffset * (effect.dotWidth + effect.spacing));
    if (dotOffset > 1) {
      right = xPos + effect.dotWidth + (1 * (effect.dotWidth + effect.spacing));
      left = xPos + ((effect.spacing + effect.dotWidth) * (dotOffset - 1));
    }
    return Rect.fromLTRB(
        left, yPos - effect.dotHeight / 2, right, yPos + effect.dotHeight / 2);
  }
}
