
import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Wisdom extends StatefulWidget {
  @override
  _WisdomState createState() => _WisdomState();
}

class _WisdomState extends State<Wisdom> {

  int _index = 0;
  String imageUrl = "https://picsum.photos/200";
  int imageIndex = 2;

  List quotes = [
    "井の中の蛙、大海を知らず",
    "口は災いの元 ",
    "能ある鷹は爪を隠す",
    "猿も木から落ちる",
    " 負けるが勝ち",
    "自業自得",
    "継続は力なり。"
  ];

  List pronounce = [
    "I no naka no kawazu, taikai wo sirazu",
    "Kuchi wa wazawai no moto ",
    "Nô aru taka wa tsume wo kakusu",
    "Saru mo ki kara ochiru",
    "Makeru ga kachi",
    "Jigou jitoku",
    "keizoku wa chikara nari"
  ];

  List translations = [
    " A frog in a well never knows the vast ocean",
    "A mouth causes trouble",
    "The skillful hawk hides its talons",
    "Even a monkey can fall from a tree",
    " To lose means to win",
    "You get what you deserve",
    "Continuing on is power"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,

      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Japanese Quotes App", style: TextStyle(color: Colors.blue.shade200, fontFamily: "blogger", fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),

      body: Container(
        alignment: Alignment.center,

        child: Stack(
          alignment: Alignment.topCenter,
            children: <Widget>[
              _getBox(),
              _getPicture(),

          ]
        )


      )

    );
  }

  _showQuote() {
    var random = new Random();
    setState(() {

      _index = (_index+1) % quotes.length;
      imageCache.clear();

        imageUrl = "https://picsum.photos/" + (random.nextInt(300)+100).toString();

    });

  }

  Container _getBox() {
    return Container(
      width: 300,
      height: 450,
      //margin: ,
      decoration: BoxDecoration(
          color: Colors.grey.shade900,
          borderRadius: BorderRadius.circular(20.0),
      ),

      child: Column(

        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget> [
          Text("\n\n\n" , style: TextStyle(fontSize: 45)),
          Text((quotes[_index]), style: TextStyle(color: Colors.white, fontSize: 20.5, fontFamily: "blogger", fontWeight: FontWeight.bold), textAlign: TextAlign.center, ),
          Text((pronounce[_index] + "\n\n"), style: TextStyle(color: Colors.blueGrey, fontSize: 14, fontStyle: FontStyle.italic), textAlign: TextAlign.center,),

          Text(translations[_index], style: TextStyle(color: Colors.white70, fontSize: 13, fontStyle: FontStyle.italic), textAlign: TextAlign.center,),
          Text("\n"),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

             ElevatedButton.icon(
                  onPressed: _showQuote,
                  icon: Icon(Icons.wb_sunny, color: Colors.white),
                  label: Text("Inspire me!", style: TextStyle(color: Colors.white),),
                  //color: Colors.deepPurpleAccent,
                  style: ButtonStyle(
                     shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                         RoundedRectangleBorder(
                             borderRadius: BorderRadius.circular(18.0)
                         )
                     ),

                 ),

              )

            ],
          ),

        ],
      ),
    );
  }

  Container _getPicture() {
    return Container(
      width: 200,
      height: 200,
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(100.0)),
          image: DecorationImage(image: NetworkImage(imageUrl), fit: BoxFit.cover)
      ),
    );
  }

  nextButton() {}

  likeButton() {}
}


class BizzCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,

      appBar: AppBar(
        title: Text("BizCard", style: TextStyle(color: Colors.white, fontSize: 23),),
        centerTitle: true,
        backgroundColor: Colors.black,

      ),
      body: Container(
        alignment: Alignment.center,

        child: Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            _getCard(),
            _getAvatar()
          ],
        )
      ),
    );
  }

  Container _getCard() {
    return Container(
      width: 320,
      height: 220,
      margin: EdgeInsets.all(50.0),
      decoration: BoxDecoration(
        color: Colors.grey.shade900,
        borderRadius: BorderRadius.circular(10.0)
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget> [
          Text("\n"),
          Text("Nanami MJ", style: TextStyle(color: Colors.white, fontSize: 30, fontFamily: "blogger")),
          Text("niloo.ast@gmail.com", style: TextStyle(color: Colors.white, fontSize: 15)),
          Text("\n"),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ButtonWithSnackBox()
            ],
          )
        ],
      ),
    );
  }



  Container _getAvatar() {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(50.0)),
        border: Border.all(color: Colors.deepPurpleAccent, width: 1.8),
        image: DecorationImage(image: NetworkImage("https://picsum.photos/200"), fit: BoxFit.cover)
      ),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black54,
      child: Center(
          child: Text("Hello Flutter",
              style: TextStyle(
                fontSize: 35,
                fontFamily: "blogger",
                color: Colors.purpleAccent,
                fontWeight: FontWeight.w500,

              ),
              textDirection: TextDirection.ltr)),
    );
  }
}

class ScaffoldExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('my app title',
          style: TextStyle(
          fontSize: 35,
          fontFamily: "blogger",
          color: Colors.purpleAccent,
          fontWeight: FontWeight.w500)
        ),
        centerTitle: true,
        backgroundColor: Colors.black54,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.email), onPressed: () => debugPrint("email clicked"))
        ],
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.red,
        child: Icon(Icons.call_missed),
        onPressed: () => debugPrint("miss call tapped"),
      ),

      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(icon: Icon(Icons.accessibility), title: Text("first")),
        BottomNavigationBarItem(icon: Icon(Icons.ac_unit), title: Text("second"))
      ], onTap: (int index) => debugPrint("tapped on " + index.toString()),),

      backgroundColor: Colors.blueGrey.shade200,

      body: Container(

        alignment: Alignment.center,

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,

          children: <Widget>[

//            InkWell(
//
//              child: const Padding(
//                  padding: EdgeInsets.all(20.0),
//                  child: Text('Tap me!',
//                         style: TextStyle(fontSize: 25, color: Colors.white),
//
//                  ),
//
//              ),
//              highlightColor: MaterialStateColor.resolveWith((states) => Colors.black),
//              splashColor: MaterialStateColor.resolveWith((states) => Colors.lightBlue),
//              hoverColor: MaterialStateColor.resolveWith((states) => Colors.purpleAccent),
//              focusColor: MaterialStateColor.resolveWith((states) => Colors.red),
//              onTap: () => debugPrint('Tapped ...'),
//              customBorder: Border.all(color: Colors.black87, width: 10, style: BorderStyle.solid),
//              borderRadius: BorderRadius.circular(5.5),
//            )
          CustomButton()

          ],
        ),

      ),
    );
  }

}

class CustomButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () {
        final snackBar = SnackBar(
            content: Text("hello again"),
            backgroundColor: Colors.black,
        );

        Scaffold.of(context).showSnackBar(snackBar);
      },
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          color: Colors.purple,
          borderRadius: BorderRadius.circular(8.0)

        ),
        child: Text("Button"),
      ),
    );
  }
  
}

class ButtonWithSnackBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final snackBar = SnackBar(
          content: Text("thanks for following me!"),
          backgroundColor: Colors.purpleAccent,

        );

        Scaffold.of(context).showSnackBar(snackBar);
      },
      child: Container(
          padding: EdgeInsets.all(15.0),
          decoration: BoxDecoration(
              color: Colors.deepPurpleAccent,
              borderRadius: BorderRadius.circular(15.0),
              gradient: LinearGradient(
                  colors: [
                    Colors.deepPurpleAccent,
                    Colors.purpleAccent,
                  ]
              )
          ),
          child:
          //Icon(Icons.alternate_email, color: Colors.white,),
          Text("Follow Me!", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)
      ),
    );
  }
}