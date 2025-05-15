import 'package:flutter/material.dart';

class MovieScreen extends StatefulWidget {
  @override
  _MovieScreenState createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
 
  int _selectedIndex = 1;

  
  final List<String> popularMovieTitles = [
    'To All the Boys: P.S. I still Love You',
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900], 
        foregroundColor: Colors.white, 
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            // TMDB Logo Placeholder
            // Replace with Image.asset or Image.network when available
            Text(
              'TMDB',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            // Search Button/Field Placeholder
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 12.0),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2), // Slightly transparent white
                    borderRadius: BorderRadius.circular(20.0),
                    border: Border.all(color: Colors.white), // White border
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.search, color: Colors.white, size: 20),
                      SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          'Find your movies...',
                          style: TextStyle(color: Colors.white70, fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Sort/Filters Button Placeholder
            Icon(Icons.filter_list, color: Colors.white),
          ],
        ),
      ),
      // Add title below AppBar using PreferredSize
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Discover & Enjoy Your Favorite Movies',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          // Categories Row
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                // Popular (Active)
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  decoration: BoxDecoration(
                    color: Colors.blue, // Blue background for active
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Text(
                    'Popular',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white, // White text for active
                    ),
                  ),
                ),
                // Upcoming (Inactive)
                Text(
                  'Upcoming',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[700], // Grey text for inactive
                  ),
                ),
                // Now Playing (Inactive)
                Text(
                  'Now Playing',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[700], // Grey text for inactive
                  ),
                ),
              ],
            ),
          ),
          // Popular Movies Section (only popular list is shown below categories)
          Expanded( // Use Expanded to allow ListView to take available space
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: popularMovieTitles.length, // Use the count of specific titles
              itemBuilder: (context, index) {
                // Pass the specific title to MovieListItem
                return MovieListItem(title: popularMovieTitles[index]);
              },
            ),
          ),
          // Removed Upcoming and Now Playing sections as per request
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.movie),
            label: 'Movies',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: 'Bookmark',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Account',
          ),
        ],
        currentIndex: _selectedIndex, // Set initial index
        selectedItemColor: Colors.blue, // Blue for selected item
        unselectedItemColor: Colors.grey, // Grey for unselected items
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed, // Ensure all items are visible
      ),
    );
  }
}

class MovieListItem extends StatelessWidget {
  // Add a title parameter
  final String title;

  // Constructor to receive the title
  const MovieListItem({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0), // Add horizontal margin
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // Movie Image Placeholder
            Container(
              width: 100,
              height: 150,
              color: Colors.grey[300], // Placeholder color
              child: Icon(Icons.movie, size: 50, color: Colors.grey[600]),
            ),
            SizedBox(width: 10), // Spacing between image and text
            // Movie Title and Description
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title, // Use the passed title
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'This is a placeholder for the movie description. It should provide a brief summary of the movie.', // Placeholder Description
                    style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
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



// red https://images.app.goo.gl/a1M11BbP6US7C7Xr7
// birds of prey   https://images.app.goo.gl/LrDzXHiXzJNbL4EY9
//  to all boys   https://images.app.goo.gl/ftFhCmJEf4D5pXmFA
// ford v Ferrari  https://images.app.goo.gl/sEwkANVdJTqrw32B6