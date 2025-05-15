import 'package:flutter/material.dart';

class MovieScreen extends StatefulWidget {
  const MovieScreen({super.key});

  @override
  _MovieScreenState createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  int _selectedIndex = 1;

  final List<String> popularMovieTitles = [
    'To All the Boys: P.S. I Still Love You',
    'Baby Driver',
    'John Wick',
    'Exit',
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(160),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.purple[400],
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40),
                bottomRight: Radius.circular(40),
              ),
            ),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    // Top Row
                    Row(
                      children: [
                        Text(
                          'TMDB',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(width: 10),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8),
                            decoration: BoxDecoration(
                              color: Colors.white24,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.white),
                            ),
                            child: Row(
                              children: [
                                Icon(Icons.search, color: Colors.white, size: 20),
                                SizedBox(width: 8),
                                Text(
                                  'Find your movies...',
                                  style: TextStyle(color: Colors.white70),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        Icon(Icons.filter_list, color: Colors.white),
                      ],
                    ),
                    SizedBox(height: 20),
                    // Title
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Discover & Enjoy\nYour Favourite Movies',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        body: Column(
          children: [
            // Tab Bar
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: TabBar(
                labelColor: Colors.white,
                unselectedLabelColor: Colors.grey[600],
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.purple,
                ),
                tabs: [
                  Tab(text: 'Popular'),
                  Tab(text: 'Upcoming'),
                  Tab(text: 'Now Playing'),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                children: [
                  _buildMovieList(), // Popular
                  Center(child: Text("Upcoming movies...")),
                  Center(child: Text("Now playing movies...")),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.movie), label: 'Movies'),
            BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: 'Bookmark'),
            BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: 'Account'),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.purple,
          unselectedItemColor: Colors.grey,
          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed,
        ),
      ),
    );
  }

  Widget _buildMovieList() {
    return ListView.builder(
      itemCount: popularMovieTitles.length,
      itemBuilder: (context, index) {
        return MovieListItem(title: popularMovieTitles[index]);
      },
    );
  }
}

class MovieListItem extends StatelessWidget {
  final String title;

  const MovieListItem({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image placeholder
            Container(
              width: 80,
              height: 120,
              color: Colors.grey[300],
              child: Icon(Icons.image, size: 40, color: Colors.grey),
            ),
            SizedBox(width: 10),
            // Movie info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  SizedBox(height: 4),
                  Text('2019 • 1h 48m',
                      style: TextStyle(color: Colors.grey[700])),
                  Text('Romance, Comedy',
                      style: TextStyle(color: Colors.grey[700])),
                  SizedBox(height: 8),
                  Text(
                    'This is a short description of the movie. It will be replaced with actual synopsis later.',
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 13),
                  ),
                ],
              ),
            ),
            SizedBox(width: 8),
            // Rating
            Container(
              padding: EdgeInsets.all(6),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.green[100],
              ),
              child: Text(
                '7.2',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
