import 'package:flutter/material.dart';

typedef FadeScaleTransitionBuilder = Widget Function(Widget, Animation<double>);

FadeScaleTransitionBuilder fadeScaleTransitionBuilder = (child, animation) =>
    FadeTransition(
      opacity: animation,
      child: ScaleTransition(scale: animation, child: child),
    );
