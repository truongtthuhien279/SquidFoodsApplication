import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

enum AniProps{opacity, translateY}
class FadeAnimation extends StatelessWidget {
  final double delay;
  final Widget child;

   FadeAnimation({ required this.delay,  required this.child});

  @override
  Widget build(BuildContext context) {
    //multiTrackTween bị đổi thành multiTW
    final tween = MultiTween<AniProps>()
      ..add(AniProps.opacity, Tween(begin: 0.0, end: 1.0),
          Duration(milliseconds: 500))
      ..add(
          AniProps.translateY, Tween(begin: 120.0, end: 0.0),
          Duration(milliseconds: 500), Curves.easeOut);
    //code cũ
    // Track('opacity').add(Duration(milliseconds: 500),
    //     Tween(begin: 0.0, end: 1.0)
    // ),
    // Track('translateX').add(Duration(milliseconds: 500),
    //     Tween(begin: 120.0, end: 0.0),
    //     curve: Curves.easeOut
    // )
    return PlayAnimation<MultiTweenValues<AniProps>>(
      delay: Duration(milliseconds: (500 * delay).round()),
      duration: tween.duration,
      tween: tween,
      child: child,
      builder: (context, child, animation) => Opacity(
        opacity: animation.get(AniProps.opacity),
        child: Transform.translate(
            offset: Offset(animation.get(AniProps.translateY), 0),
            child: child
        ),
      ),
    );
  }
}



