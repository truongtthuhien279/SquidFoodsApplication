import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:squid_foods/pages/HomePage.dart';
import '../animations/FadeAnimation.dart';

class StarterPage extends StatefulWidget {
  const StarterPage({super.key});

  @override
  State<StarterPage> createState() => _StarterPageState();
}

class _StarterPageState extends State<StarterPage> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double>_animation;

  bool _textVisible = true;

  @override
  void initState(){
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 100)
    );

    _animation = Tween<double>(
      begin: 1,
      end: 25.0,
    ).animate(_animationController);

    super.initState();
  }

  void onTap(){
    setState(() {
      _textVisible=false;
    });
    _animationController.forward().then((f) =>
    Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: HomePage()))
    );
  }

  @override
  void dispose() {
    _animationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/starter.jpg'),
              fit: BoxFit.cover
            )
          ),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                colors:[
                  Colors.black.withOpacity(.9),
                  Colors.black.withOpacity(.8),
                  Colors.black.withOpacity(.2),
                ],
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  FadeAnimation(delay: .5 , child:
                  RichText(
                    text: TextSpan(
                      text: 'Taking Order For Faster Delivery',
                      style: TextStyle(color: Colors.white, fontSize: 47, fontWeight: FontWeight.bold),
                    ),
                  )),

                  SizedBox(height: 20.0,),
                  FadeAnimation(delay: 1 , child:
                      Text('See resturants nearby by \nadding location',
                  style: TextStyle(color: Colors.white,
                  height: 1.4,
                  fontSize: 10),)),
                  SizedBox(height: 100.0,),

                  //Nut Start
                  FadeAnimation(delay: 1.2 , child:
                      ScaleTransition(
                        scale: _animation,
                        child:Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              gradient: LinearGradient(
                                  colors: [
                                    Colors.yellow,
                                    Colors.orange,
                                  ]
                              )
                          ),
                          child: AnimatedOpacity(
                            opacity: _textVisible ? 1.0 : 0.0,
                            duration: Duration(milliseconds: 50),

                            child: MaterialButton(
                              minWidth: double.infinity,
                              onPressed: () => onTap(),
                              child: Text("Start",style: TextStyle(color: Colors.white),),
                            ),
                          )

                        )),

                      ),
                  SizedBox(height: 30.0,),
                  FadeAnimation(delay: 1.4 , child:
                  AnimatedOpacity(
                    opacity: _textVisible ? 1.0 : 0.0,
                    duration: Duration(milliseconds: 50),
                    child: Align(
                      child: Text("Now Delivery To Your Door 24/7",
                      style: TextStyle(color: Colors.white70,
                      fontSize: 15),),
                    ),
                  )),
                  SizedBox(height: 30.0,),],

              ),
            ),
          ),

        ));
  }
}
