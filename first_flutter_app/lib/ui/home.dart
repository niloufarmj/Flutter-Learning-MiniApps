import 'dart:math';
import 'dart:ui';

import 'package:firstflutterapp/util/hexColor.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Wisdom extends StatefulWidget {
  @override
  _WisdomState createState() => _WisdomState();
}

class BillSplitter extends StatefulWidget {
  @override
  _BillSplitterState createState() => _BillSplitterState();
}

class _BillSplitterState extends State<BillSplitter> {

  int _tipPercentage = 0;
  int _personCounter = 1;
  double _billAmount = 0.0;
  Color blueShade = new HexColor("#392457");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        color: Colors.black,
        child: ListView(

          scrollDirection: Axis.vertical,
          padding: EdgeInsets.all(20.5),
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.12),
              width: 100,
              height: 175,
              decoration: BoxDecoration(
                color: Colors.deepPurpleAccent.withOpacity(0.1),

                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Total Per Person \n", style: TextStyle(color: Colors.white, fontSize: 20)),
                    Text("\$" + ((_billAmount + (_tipPercentage*_billAmount)/100)/_personCounter).toString(), style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold))
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 40),
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.white30, width: 1.3)
              ),
              child: Column(
                children: <Widget>[
                  //bill amount
                  TextField(
                    keyboardType: TextInputType.numberWithOptions(decimal: true),
                    style: TextStyle(color: Colors.white, fontSize: 20),
                    decoration: InputDecoration(
                      hintText: "Bill Amount",
                      hintStyle: TextStyle(color: Colors.blueGrey),
                      prefixIcon: Icon(Icons.attach_money, color: Colors.deepPurpleAccent),

                    ),
                    onChanged: (String value) {
                      try {
                        _billAmount = double.parse(value);
                      } catch(exception) {
                        _billAmount = 0;
                      }
                    },
                  ),

                  //split
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children:<Widget> [
                          Text("   "),
                          Icon(Icons.wrap_text, color: Colors.deepPurpleAccent),
                          Text("   Split", style: TextStyle(color: Colors.blueGrey, fontSize: 20),)
                        ],
                      ),

                      Row(
                        children: <Widget>[
                          InkWell(
                            onTap: () {
                              setState(() {
                                if (_personCounter > 1)
                                  _personCounter --;
                              });
                            },
                            child: Container(
                              width: 40,
                              height: 40,
                              margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.deepPurpleAccent.withOpacity(0.1)
                              ),
                                child: Center(child: Text("-", style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),)),
                            ),
                          ),
                          Text(_personCounter.toString(), style: TextStyle(color: Colors.white, fontSize: 22),),
                          InkWell(
                            onTap: () {
                              setState(() {
                                  _personCounter ++;
                              });
                            },
                            child: Container(
                              width: 40,
                              height: 40,
                              margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.deepPurpleAccent.withOpacity(0.1)
                              ),
                              child: Center(child: Text("+", style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),)),
                            ),
                          ),

                        ],
                      ),

                    ],
                  ),

                  //tip
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("   "),
                          Icon(Icons.wallet_giftcard_outlined, color: Colors.deepPurpleAccent,),
                          Text("   Tip", style: TextStyle(color: Colors.blueGrey, fontSize: 20),)
                        ],
                      ),

                      Padding(
                        padding: const EdgeInsets.all(17.0),
                        child: Text(((_tipPercentage*_billAmount)/100).toString(), style: TextStyle(color: Colors.white, fontSize: 22),),
                      )

                    ],
                  ),

                  //tip percentage
                  Column(
                    children: <Widget>[
                      Text("$_tipPercentage %", style: TextStyle(color: Colors.deepPurpleAccent, fontSize: 24, fontWeight: FontWeight.bold)),
                      Slider(
                          min: 0,
                          max: 100,
                          value: _tipPercentage.toDouble(),
                          onChanged: (double value) {
                            setState(() {
                              _tipPercentage = value.round();
                            });
                          },
                          activeColor: Colors.white,
                          inactiveColor: Colors.blueGrey,
                          divisions: 10,
                          )
                    ],
                  )
                ]
              )
            )
          ],
        )
      ),
    );
  }
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

class Quiz extends StatefulWidget {
  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {

  List questions = [
    "The earth is the fourth planet from the sun.",
    "The planet Venus has no moons.",
    "Jupiter is composed mostly of iron.",
    "The sun is a star of average size.",
    "A lunar eclipse occurs when the sun passes",
  ];

  List alreadyTrue = [
    false, false, false, false, false
  ];

  List answers = [
    false, true, false, true, true
  ];


  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  int _overallPoint = 0;
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Simple Quiz App!", style: TextStyle(color: Colors.white, fontSize: 34, fontFamily: "affection", fontWeight: FontWeight.bold),),
      ),
      body: Container(
        child: Column(
          children: <Widget> [
            Container(
                alignment: Alignment.topRight,
                child: Image.asset("assets/images/quiz.png", width: 380)
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              width: 340,
              height: 180,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.white30, width: 1.3)
              ),
              child: _questionBox()

            ),
            _nextPrevButton()
          ],
        ),
      ),
    );
  }

  Column _questionBox() {
    if (_index >= questions.length)
      //a box that shows score
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text("final score: ", style: TextStyle(color: Colors.blueGrey, fontSize: 20)),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(_overallPoint.toString(), style: TextStyle(color: Colors.deepPurpleAccent, fontSize: 50, fontWeight: FontWeight.bold),),
          )
        ],
      );

    //normal question box

    return Column(
        children: <Widget> [
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Text(questions[_index], style: TextStyle(color: Colors.white70, fontSize: 20,), textAlign: TextAlign.center),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _checkButton(),
              _falseButton()
            ],
          )
        ]
    );
  }

  GestureDetector _checkButton() {
    return GestureDetector(
      onTap: () {
        var snackBar;
        if (alreadyTrue[_index]) {
          snackBar = SnackBar(
            content: Text("True Answer Already Chosen!", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),),
            backgroundColor: Colors.yellowAccent.shade200,
          );
        }

        else if (answers[_index]) {
          snackBar = SnackBar(
            content: Text("Correct!", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),),
            backgroundColor: Colors.greenAccent,

          );
          _overallPoint++;
          alreadyTrue[_index] = true;
        }

        else {
          snackBar = SnackBar(
            content: Text("Incorrect!", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),),
            backgroundColor: Colors.redAccent,

          );
        }
        _scaffoldKey.currentState.showSnackBar(snackBar);
      },
      child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.deepPurpleAccent,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Icon(Icons.check, color: Colors.white, size: 35,)
      ),
    );
  }

  GestureDetector _falseButton() {
    return GestureDetector(
      onTap: () {
        var snackBar;
        if (alreadyTrue[_index]) {
          snackBar = SnackBar(
            content: Text("True Answer Already Chosen!", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),),
            backgroundColor: Colors.yellowAccent.shade200,
          );
        }

        else if (!answers[_index]) {
          snackBar = SnackBar(
            content: Text("Correct!", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),),
            backgroundColor: Colors.greenAccent,

          );
          _overallPoint++;
          alreadyTrue[_index] = true;
        }

        else {
          snackBar = SnackBar(
            content: Text("Incorrect!", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),),
            backgroundColor: Colors.redAccent,

          );
        }
        _scaffoldKey.currentState.showSnackBar(snackBar);
      },
      child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.deepPurpleAccent,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Icon(Icons.clear, color: Colors.white, size: 35,)
      ),
    );
  }

  Container _nextPrevButton() {
    if (_index >= questions.length)
      //a box that shows score
      if (_overallPoint >= 3)
        return Container(
          margin: EdgeInsets.only(top: 25),
          child:
            Text("Good Job!", style: TextStyle(color: Colors.white, fontSize: 22, fontFamily: "affection"))
        );
      else
        return Container(
            margin: EdgeInsets.only(top: 25),
            child:
            Text("Not so good!", style: TextStyle(color: Colors.white, fontSize: 22, fontFamily: "affection"))
        );

    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          //prev
          InkWell(

            child: Container(
                width: 150,
                height: 50,
                margin: EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 2),
                    borderRadius: BorderRadius.circular(7.5)
                ),
                child:
                Center(child: Text("<- previous", style: TextStyle(color: Colors.white, fontSize: 17)))
            ),
            onTap: () {
              setState(() {
                if (_index > 0)
                _index--;
              });
            },
          ),

          //next
          InkWell(
            child: Container(
                width: 150,
                height: 50,
                margin: EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 2),
                    borderRadius: BorderRadius.circular(7.5)
                ),
                child:
                Center(child: Text("Next ->", style: TextStyle(color: Colors.white, fontSize: 17)))
            ),
            onTap: () {
              setState(() {
                _index++;
              });
            },
          )
        ],
      )

    );
  }

  
}

class BizCard extends StatelessWidget {
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


