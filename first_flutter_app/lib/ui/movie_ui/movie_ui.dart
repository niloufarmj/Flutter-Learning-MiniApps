import 'package:firstflutterapp/model/movie.dart';
import 'package:flutter/material.dart';

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
