
import 'package:flutter/material.dart';


class HeroDialogRoute<T>  extends PageRoute<T>{


final WidgetBuilder _builder;
HeroDialogRoute({
  required WidgetBuilder builder,
  RouteSettings? settings,
  bool fullscreenDialog= false,
}): _builder = builder,

super(settings: settings, fullscreenDialog: fullscreenDialog);

@override
bool get opaque => false;

@override 
bool get barrierDismissible => true;

  @override 
  Color? get barrierColor =>Colors.black45;

  @override
  
  String? get barrierLabel => "Pop up dialog open";

  @override
  Widget buildPage(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
  return _builder(context);
  }

  @override

  bool get maintainState => true;

  @override
 
  Duration get transitionDuration =>const Duration(milliseconds: 300);
  
@override
Widget buildTransitions(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child){
  return child;
}

}