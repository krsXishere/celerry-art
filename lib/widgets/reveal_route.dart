import 'package:flutter/material.dart';
import 'circular_reveal_clipper.dart';

class RevealRoute extends PageRouteBuilder {
  final Widget page;
  final Alignment? centerAlignment;
  final Offset? centerOffset;
  final double minRadius;
  final double maxRadius;

  RevealRoute({
    required this.page,
    this.minRadius = 0,
    required this.maxRadius,
    this.centerAlignment,
    this.centerOffset,
  })  : assert(centerOffset != null || centerAlignment != null),
        super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) {
            return page;
          },
        );

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    return ClipPath(
      clipper: CircularRevealClipper(
        fraction: animation.value,
        centerAlignment: centerAlignment,
        centerOffset: centerOffset,
        minRadius: minRadius,
        maxRadius: maxRadius,
      ),
      child: child,
    );
  }
}
