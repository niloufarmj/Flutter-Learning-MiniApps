
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
          MovieDetailsThumbnail(thumbnail: movie.images[0]),
          SizedBox(height: 10,),
          MovieDetailsHeaderWithPoster(movie: movie),
          HorizontalLine(),
          MovieDetailsCast(movie: movie,),
          HorizontalLine(),
          MovieDetailsExtraPosters(images: movie.images)
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

class MovieDetailsHeaderWithPoster extends StatelessWidget {

  final Movie movie;

  const MovieDetailsHeaderWithPoster({Key key, this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          MoviePoster(poster: movie.poster),
          SizedBox(width: 16,),
          Expanded(child: MovieDetailHeader(movie: movie))
        ],
      ),
    );
  }
}

class MoviePoster extends StatelessWidget {

  final String poster;

  const MoviePoster({Key key, this.poster}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var borderRadius = BorderRadius.all(Radius.circular(10));

    return Card(
      color: Colors.black,
      margin: EdgeInsets.only(top: 15),
      child: ClipRRect(
        borderRadius: borderRadius,
        child: Container(
          width: MediaQuery.of(context).size.width * 0.26,
          height: 180,
          decoration: BoxDecoration(
            image: DecorationImage(image: NetworkImage(poster), fit: BoxFit.cover)
          ),
        ),
      ),
    );
  }
}

class MovieDetailHeader extends StatelessWidget {

  final Movie movie;

  const MovieDetailHeader({Key key, this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    TextStyle whiteStyle = TextStyle(color: Colors.white, fontSize: 14);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("${movie.year}     ${movie.genre}".toUpperCase(), style: TextStyle(color: Colors.deepPurpleAccent, fontSize: 14),),
        SizedBox(height: 13,),
        Text(movie.title, style: TextStyle(
            color: Colors.white,
            fontSize: 27,
            fontWeight: FontWeight.bold,
            fontFamily: "blogger",
            shadows: [Shadow(
              color: Colors.deepPurpleAccent,
              offset: Offset.zero,
              blurRadius: 7
            )
          ]),),
        SizedBox(height: 10,),
        Text.rich(TextSpan(
          style: TextStyle(
            color: Colors.white70,
            fontSize: 14
          ),
          children: <TextSpan> [
            TextSpan(text: movie.plot),
            TextSpan(text: " More...", style: TextStyle(color: Colors.blueGrey))
          ]
        ))
      ],
    );
  }
}

class MovieDetailsCast extends StatelessWidget {

  final Movie movie;

  const MovieDetailsCast({Key key, this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: <Widget>[
            MovieField(field: "Casts", value: movie.actors),
            MovieField(field: "Director", value: movie.director),
            MovieField(field: "Weiter", value: movie.writer),
            MovieField(field: "Language", value: movie.awards),
            MovieField(field: "Country", value: movie.country),
            MovieField(field: "Release Date", value: movie.released,),
            MovieField(field: "Rated", value: movie.rated),
            MovieField(field: "Imdb Rate", value: movie.imdbRating + "/10 (" + movie.imdbVotes + " votes)"),
            MovieField(field: "Awards", value: movie.awards),

          ],
        )
    );
  }
}

class MovieField extends StatelessWidget {

  final String field, value;

  const MovieField({Key key, this.field, this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("$field: ".toUpperCase(), style: TextStyle(color: Colors.deepPurpleAccent, fontSize: 14, fontWeight: FontWeight.w300, fontFamily: "blogger")),
          Expanded(child: Text(value, style: TextStyle(color: Colors.white, fontSize: 13)))
        ],
      ),
    );
  }
}

class HorizontalLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Container(
        height: 0.4,
        color: Colors.blueGrey,
      ),
    );
  }
}

class MovieDetailsExtraPosters extends StatelessWidget {

  final List<String> images;

  const MovieDetailsExtraPosters({Key key, this.images}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 22, right: 22, top: 8, bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget> [
          Text("more movie posters".toUpperCase(), style: TextStyle(color: Colors.deepPurpleAccent, fontSize: 15, fontFamily: "blogger"),),
          Container(
            height: 145,
            child: Padding(
              padding: const EdgeInsets.only(top: 10),
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    child: Container(
                      width: MediaQuery.of(context).size.width / 2,
                      height: 135,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(images[index]), fit: BoxFit.cover
                        )
                      ),
                    ),
                  ),
                  separatorBuilder: (context, index) => SizedBox(width: 8,),
                  itemCount: images.length
              ),
            ),
          )
        ],
      ),
    );
  }
}






