import 'package:flutter/material.dart';

class Mockupscreentwo extends StatelessWidget {
  final List<Movie> popularMovies = [
    Movie("Birds of Prey", "7.2", "assets/images/birds of prey.jpg"),
    Movie("Red Sparrow", "6.5", "assets/images/african-couple-cinema.jpg"),
  ];

  final List<Movie> nowPlayingMovies = [
    Movie("To All the Boys", "6.9", "assets/images/all boys.webp"),
    Movie("Ford v Ferrari", "7.2", "assets/images/farari.jpg"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          // Top Banner
          Stack(
            children: [
              Image.asset(
                "assets/images/african-couple-cinema.jpg",
                height: 220,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Positioned(
                bottom: 16,
                left: 16,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Jumanji: The Next Level",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Action · Adventure · Comedy · Fantasy",
                      style: TextStyle(color: Colors.white70),
                    ),
                  ],
                ),
              ),
            ],
          ),

          SizedBox(height: 16),

          // What's Popular
          sectionTitle("What's Popular"),
          movieList(popularMovies),

          SizedBox(height: 16),

          // Now Playing
          sectionTitle("Now Playing"),
          movieList(nowPlayingMovies),
        ],
      ),
    );
  }

  Widget sectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Text(
        title,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget movieList(List<Movie> movies) {
    return SizedBox(
      height: 180,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 16),
        itemCount: movies.length,
        itemBuilder: (context, index) {
          final movie = movies[index];
          return Padding(
            padding: EdgeInsets.only(right: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    movie.image,
                    height: 120,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 6),
                Text(movie.title, maxLines: 1, overflow: TextOverflow.ellipsis),
                Row(
                  children: [
                    Icon(Icons.star, size: 14, color: Colors.orange),
                    SizedBox(width: 4),
                    Text(movie.rating),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class Movie {
  final String title;
  final String rating;
  final String image;

  Movie(this.title, this.rating, this.image);
}
