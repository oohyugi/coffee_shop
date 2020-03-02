import 'package:flutter/material.dart';

class CircleTabIndicator extends Decoration {
  final BoxPainter _painter;

  CircleTabIndicator({@required Color color, @required double radius})
      : _painter = _CirclePainter(color, radius);

  @override
  BoxPainter createBoxPainter([onChanged]) => _painter;
}

class _CirclePainter extends BoxPainter {
  final Paint _paint;
  final double radius;

  _CirclePainter(Color color, this.radius)
      : _paint = Paint()
          ..color = color
          ..isAntiAlias = true;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    final Offset circleOffset = offset +
        Offset(configuration.size.width/2,
            (configuration.size.height - radius) /2);
//    canvas.drawCircle(circleOffset, radius, _paint);

  final Rect rect = Offset(offset.dx+8,(configuration.size.height/2)- 32/2) & Size(configuration.size.width-16, 32);
  _paint.style = PaintingStyle.fill;
  canvas.drawRRect(RRect.fromRectAndRadius(rect, Radius.circular(8)), _paint);
  }
}
