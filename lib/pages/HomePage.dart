import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:squid_foods/animations/FadeAnimation.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
          backgroundColor: Colors.grey[100],
        elevation: 0,
        actions: <Widget>[
          IconButton(onPressed: () {  },
              icon: Icon(Icons.shopping_basket),
              color: Colors.grey[800],

          )
        ],
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarBrightness: Brightness.dark
        ),
        leading: Icon(null),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            FadeAnimation( delay: 1, child:
            Text('Food Delivery ',
              style: TextStyle(color: Colors.grey[80], fontWeight: FontWeight.bold, fontSize: 30),)),
            SizedBox(height: 20,),
            Container(
              height: 50,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  FadeAnimation(delay: 1, child: makeCategory(isActive: true, title: 'Banh Mi')),
                  FadeAnimation(delay: 1.3, child: makeCategory(isActive: false, title: 'Banh Xeo')),
                  FadeAnimation(delay: 1.4, child: makeCategory(isActive: false, title: 'Bun Cha')),
                  FadeAnimation(delay: 1.5, child: makeCategory(isActive: false, title: 'Bun Oc')),
                ],
              ),
            ),
            SizedBox(height: 10,),
          ],
        ),
      ),
            FadeAnimation(delay: 1, child:
            Padding(
              padding: EdgeInsets.all(20),
              child: Text('Free Delivery',
              style: TextStyle(color: Colors.grey[700], fontWeight: FontWeight.bold),
              ),
            )),
            Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      FadeAnimation(delay: 1.4, child:makeItem('assets/images/one.jpg')),
                      FadeAnimation(delay: 1.5, child:makeItem2('assets/images/two.jpg')),
                      FadeAnimation(delay: 1.6, child:makeItem3('assets/images/three.jpg')),

                      // FadeAnimation(2, makeItem(image: 'assests/images/one.jpg')),
                    ],
                  ),
                ),
            ),
            SizedBox(
              height: 30,
            )

          ],
        ),
      ),
    );
  }
}
Widget makeCategory({isActive, title}){
  return AspectRatio(
    aspectRatio: isActive ? 3 : 2.5/1,
    child: Container(
      margin: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
      color: isActive ? Colors.yellow[700] : Colors.white,
      borderRadius: BorderRadius.circular(50),
    ),
    child: Align(
      child: Text(title, style: TextStyle(color: isActive ? Colors.white: Colors.grey[500], fontSize: 18, fontWeight: isActive ? FontWeight.bold: FontWeight.w100),
  ),
    ),
  ),
  );
}

Widget makeItem(image) {
  return AspectRatio(
    aspectRatio: 1 / 1.5,
    child: GestureDetector(
      child: Container(
        margin: EdgeInsets.only(right: 20),
       decoration: BoxDecoration(
         borderRadius: BorderRadius.circular(20),
         image: DecorationImage(
           image: AssetImage(image),
           fit: BoxFit.cover,
         ),
       ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              stops: [.2,.9],
              colors: [
                Colors.black.withOpacity(.9),
                Colors.black.withOpacity(.3),
              ]
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Align(
                  alignment: Alignment.topRight,
                  child: Icon(Icons.favorite, color: Colors.white,),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("\$ 50.00", style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),),
                    SizedBox(height: 10,),
                    Text("Bun Cha Ha Noi", style: TextStyle(color: Colors.white, fontSize: 20,),)
                  ],
                )
              ],
            ),
          ),

        ),
      ),
    ),
  );

}
Widget makeItem2(image) {
  return AspectRatio(
    aspectRatio: 1 / 1.5,
    child: GestureDetector(
      child: Container(
        margin: EdgeInsets.only(right: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                stops: [.2,.9],
                colors: [
                  Colors.black.withOpacity(.9),
                  Colors.black.withOpacity(.3),
                ]
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Align(
                  alignment: Alignment.topRight,
                  child: Icon(Icons.favorite, color: Colors.white,),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("\$ 30.00", style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),),
                    SizedBox(height: 10,),
                    Text("Banh Mi Thap Cam", style: TextStyle(color: Colors.white, fontSize: 20,),)
                  ],
                )
              ],
            ),
          ),

        ),
      ),
    ),
  );

}
Widget makeItem3  (image) {
  return AspectRatio(
    aspectRatio: 1 / 1.5,
    child: GestureDetector(
      child: Container(
        margin: EdgeInsets.only(right: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                stops: [.2,.9],
                colors: [
                  Colors.black.withOpacity(.9),
                  Colors.black.withOpacity(.3),
                ]
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Align(
                  alignment: Alignment.topRight,
                  child: Icon(Icons.favorite, color: Colors.white,),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text("\$ 45.00", style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),),
                    SizedBox(height: 10,),
                    Text("Banh Xeo Tom Thit", style: TextStyle(color: Colors.white, fontSize: 20,),)
                  ],
                )
              ],
            ),
          ),

        ),
      ),
    ),
  );

}
