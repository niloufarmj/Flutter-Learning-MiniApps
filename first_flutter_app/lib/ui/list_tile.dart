
import 'package:firstflutterapp/ui/movie.dart';
import 'package:flutter/material.dart';

class MovieListView extends StatelessWidget {

  final List<Movie> movieList = Movie.getMovies();


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
        body: ListView.builder(itemCount: movieList.length,itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(5.0),
            child: Stack(
                children: <Widget> [
                  movieCard(movieList[index], context)
                  ,

                  Positioned(
                    top: 15,
                      child: movieImage(movieList[index].poster)
                  ),

                ],
            ),
          );
//          return Card(
//            elevation: 4.5,
//            color: Colors.deepPurpleAccent.withOpacity(0.1),
//            child: ListTile(
//              leading: CircleAvatar(
//                child:
//                Container(
//                    decoration: BoxDecoration(
//
//                        image: DecorationImage(
//                          image: NetworkImage(movieList[index].poster),
//                          fit: BoxFit.cover
//                        )
//                    ),
//
//                ),
//                backgroundColor: Colors.deepPurpleAccent,
//              ),
//              title: Text(movieList[index].title, style: TextStyle(color: Colors.white, fontFamily: "blogger"),),
//              subtitle: Text("sub", style: TextStyle(color: Colors.white70)),
//              onTap: () {
//                Navigator.push(context,
//                    MaterialPageRoute(builder:
//                        (context) =>
//                            MovieListViewDetails(
//                              movieName: movieList[index].title,
//                              movie: movieList[index],
//                            )
//                    ));
//              },
//              trailing: Text("...", style: TextStyle(color: Colors.white, fontFamily: "blogger"),),
//            ),
//
//          );
        })
    );
  }

  Widget movieCard(Movie movie, BuildContext context) {
    return InkWell(
      child: Container(
        margin: EdgeInsets.only(left: 70),
        width: MediaQuery.of(context).size.width,
        height: 150,
        child: Card(
          elevation: 4.5,
          color: Colors.deepPurpleAccent.withOpacity(0.1),
          child: Padding(
            padding: const EdgeInsets.only(
              top: 8,
              bottom: 8,
              left: 54,
              right: 12
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,

              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(movie.title, style: TextStyle(color: Colors.white, fontFamily: "blogger", fontWeight: FontWeight.bold, fontSize: 17),),
                    Text("Rating: ${movie.imdbRating}/10 ", style: TextStyle(color: Colors.white70, fontFamily: "blogger", ),)

                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("${movie.year}", style: TextStyle(color: Colors.white70, fontFamily: "blogger"),),
                    Text("${movie.runtime}", style: TextStyle(color: Colors.white70, fontFamily: "blogger"),),
                    Text("${movie.rated}", style: TextStyle(color: Colors.white70, fontFamily: "blogger"),)
                  ],
                )
              ],
            ),
          )


//          ListTile(
//            leading: CircleAvatar(
//              child:
//              Container(
//                decoration: BoxDecoration(
//
//                    image: DecorationImage(
//                        image: NetworkImage(movie.poster),
//                        fit: BoxFit.cover
//                    )
//                ),
//
//              ),
//              backgroundColor: Colors.deepPurpleAccent,
//            ),
//            title: Text(movie.title, style: TextStyle(color: Colors.white, fontFamily: "blogger"),),
//            subtitle: Text("sub", style: TextStyle(color: Colors.white70)),
//            onTap: () {
//              Navigator.push(context,
//                  MaterialPageRoute(builder:
//                      (context) =>
//                      MovieListViewDetails(
//                        movieName: movie.title,
//                        movie: movie,
//                      )
//                  ));
//            },
//            trailing: Text("Rating: ${movie.imdbRating}/10 ", style: TextStyle(color: Colors.white, fontFamily: "blogger"),),
//          ),

        ),
      ),
      onTap: () => {
      Navigator.push(context,
                  MaterialPageRoute(builder:
                      (context) =>
                      MovieListViewDetails(
                        movieName: movie.title,
                        movie: movie,
                      )
                  ))
      },
    );
  }

  Widget movieImage(String imageUrl) {
    return Container(
      width: 90,
      height: 120,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black38,
              blurRadius: 4.0,
              spreadRadius: 0.0,
              offset: Offset(
                0.0,
                1.0,
              ),
            ),
          ],
        image: DecorationImage(
          image: NetworkImage(imageUrl ?? 'https://www.reelviews.net/resources/img/default_poster.jpg'),
          fit: BoxFit.fill
        )
      ),
    );
  }
}

class MovieListViewDetails extends StatelessWidget {

  final String movieName;
  final Movie movie;

  const MovieListViewDetails({Key key, this.movieName, this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
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
      body: ListView(
        children: <Widget>[
          MovieDetailsThumbnail(thumbnail: movie.images[0])
        ],
      )
    );
  }
}

class MovieDetailsThumbnail extends StatelessWidget {

  final String thumbnail;

  const MovieDetailsThumbnail({Key key, this.thumbnail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
             Container(
                width: MediaQuery.of(context).size.width,
                height: 240,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(thumbnail)
                  )
                ),
              ),
            Icon(Icons.play_circle_outline, size: 100, color: Colors.black54,)
          ],

        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.transparent,
                Colors.black26,
                Colors.black,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter
            )
          ),
          height: 170,
        )
      ],
    );
  }
}
