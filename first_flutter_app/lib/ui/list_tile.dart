import 'package:flutter/material.dart';

class MovieListView extends StatelessWidget {

  List movies = [
    "Taxi Driver",
    "Fight Club",
    "Inception",
    "The Shining",
    "Mr. Nobody",
    "Prestige",
    "Malena",
    "Parasite",
    "Requiem For a Dream",
    "Leon The Professional",
    "The Shawshank Redemption",
    "Forrest Gump",
    "Her",
    "The Pianist",
    "Capernaum",
    "Memento"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black54,
        appBar: AppBar(
          title: Text(
              "Movies",
              style: TextStyle(fontSize: 32,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  shadows: [
                    Shadow(
                        color: Colors.white,
                        offset: Offset.zero,
                        blurRadius: 6
                    )
                  ]
              )),
          backgroundColor: Colors.black,
        ),
        body: ListView.builder(itemCount: movies.length,itemBuilder: (BuildContext context, int index) {
          return Card(
            elevation: 4.5,
            color: Colors.deepPurpleAccent.withOpacity(0.1),
            child: ListTile(
              leading: CircleAvatar(
                child:
                Container(
                    decoration: BoxDecoration(
                        color: Colors.deepPurpleAccent,
                        borderRadius: BorderRadius.circular(13.8)
                    ),
                    child: Text(movies[index][0])
                ),
                backgroundColor: Colors.deepPurpleAccent,
              ),
              title: Text(movies[index], style: TextStyle(color: Colors.white, fontFamily: "blogger"),),
              subtitle: Text("sub", style: TextStyle(color: Colors.white70)),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => MovieListViewDetails(movieName: movies[index],)));
              },
              trailing: Text("...", style: TextStyle(color: Colors.white, fontFamily: "blogger"),),
            ),

          );
        })
    );
  }
}

class MovieListViewDetails extends StatelessWidget {

  final String movieName;

  const MovieListViewDetails({Key key, this.movieName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      appBar: AppBar(
        title: Text(
            "Movies",
            style: TextStyle(fontSize: 32,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                shadows: [
                  Shadow(
                      color: Colors.white,
                      offset: Offset.zero,
                      blurRadius: 6
                  )
                ]
            )),
        backgroundColor: Colors.black,
      ),
      body: Container(
        child: RaisedButton(
          child: Text("go back ${this.movieName}", style: TextStyle(color: Colors.white),),
          onPressed: () {
            Navigator.pop(context);
          },
        )
      ),
    );
  }
}
