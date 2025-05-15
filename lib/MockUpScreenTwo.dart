import 'package:flutter/material.dart';

class Mockupscreentwo extends StatelessWidget {
  const Mockupscreentwo({super.key});

  // Data for "What's Popular" section
  final List<Map<String, String>> popularMovies = const [
    {
      'title': 'Birds of Prey',
      'description': 'Description for Birds of Prey',
      'assetPath': 'assets/images/birds_of_prey.png',
    }, // Add assetPath
    {
      'title': 'Red Sparrow',
      'description': 'Description for Red Sparrow',
      'assetPath': 'assets/images/red_sparrow.png',
    }, // Add assetPath
  ];

  // Data for "Now Playing" section
  final List<Map<String, String>> nowPlayingMovies = const [
    {
      'title': 'To all the Boys',
      'description': 'Description for To all the Boys',
      'assetPath': 'assets/images/birds of prey.jpg',
      'watchedPercentage': '6.9',
    },
    {
      'title': 'Ford v Ferrari',
      'description': 'Description for Ford v Ferrari',
      'assetPath': 'assets/images/birds of prey.jpg', // Use assetPath
      'watchedPercentage': '7.2',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Image with Gradient and Title
            Container(
              height: 300,
              decoration: const BoxDecoration(
                // Use AssetImage for the header image
                image: DecorationImage(
                  image: AssetImage(
                    'assets/images/jumanji_header.png',
                  ), // Replace with your header asset path
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: [
                  // Gradient Overlay
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(0.7),
                        ],
                      ),
                    ),
                  ),
                  // Movie Title
                  const Positioned(
                    bottom: 20,
                    left: 20,
                    child: Text(
                      'Jumanji: The Next Level',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "What's Popular",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 250,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount:
                          popularMovies
                              .length, // Use the number of popular movies
                      itemBuilder: (context, index) {
                        final movie = popularMovies[index];
                        return Container(
                          width: 120, // Adjust width as needed
                          margin: const EdgeInsets.only(right: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Use Image.asset for popular movie
                              Expanded(
                                child: Image.asset(
                                  movie['assetPath']!, // Use the asset path from the data
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                movie['title']!,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                movie['description']!,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),

            // Now Playing section
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Now Playing",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 250, // Adjusted height to accommodate description
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount:
                          nowPlayingMovies
                              .length, // Use the number of now playing movies
                      itemBuilder: (context, index) {
                        final movie = nowPlayingMovies[index];
                        return Container(
                          width: 120,
                          margin: const EdgeInsets.only(right: 10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Stack(
                                  children: [
                                    // Use Image.asset for now playing movie
                                    Image.asset(
                                      movie['assetPath']!, // Use the asset path from the data
                                      fit: BoxFit.cover,
                                      width: double.infinity,
                                      height: double.infinity,
                                    ),
                                    // Watched Percentage Circle
                                    Positioned(
                                      bottom: 5,
                                      right: 5,
                                      child: Container(
                                        padding: const EdgeInsets.all(4),
                                        decoration: BoxDecoration(
                                          color: Colors.black.withOpacity(0.7),
                                          shape: BoxShape.circle,
                                        ),
                                        child: Text(
                                          movie['watchedPercentage']!,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                movie['title']!,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 2),
                              Text(
                                movie['description']!,
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
