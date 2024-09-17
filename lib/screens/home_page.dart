import 'package:custom_button_builder/custom_button_builder.dart';
import 'package:flutter/material.dart';
import '../services/api_service.dart';
import 'company_info_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List _movies = [];

  @override
  void initState() {
    super.initState();
    _fetchMovies();
  }

  _fetchMovies() async {
    try {
      var movies = await ApiService.fetchMovies();
      setState(() {
        _movies = movies;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text('Kannada Movies'),
        actions: [
          IconButton(
            icon: Icon(Icons.info_outline),
            onPressed: () {
              // Navigate to CompanyInfoPage when icon is pressed
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CompanyInfoPage()),
              );
            },
          )
        ],
      ),
      body: _movies.isEmpty
          ? Center(child: CircularProgressIndicator())  // Show loading while fetching data
          : Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
                    itemCount: _movies.length,
                    itemBuilder: (context, index) {
            var movie = _movies[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.blue, Colors.purple],  // Define the colors of the gradient
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(15),  // Match the border radius to the card
                ),
                child: Column(
                  children: [
                    Card(
                      color: Colors.transparent,
                      margin: EdgeInsets.all(10),

                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              movie['title'] ?? 'No Title',
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.white),
                            ),
                            SizedBox(height: 5),
                            Text("Genre: ${movie['genre'] ?? 'Unknown'}",style: TextStyle(color: Colors.white70),),
                            Text("Language: ${movie['language'] ?? 'Unknown'}",style: TextStyle(color: Colors.white70),),
                            Text("Director: ${movie['director'].join(', ') ?? 'Unknown'}",style: TextStyle(color: Colors.white70),),
                            Text("Stars: ${movie['stars'].join(', ') ?? 'Unknown'}",style: TextStyle(color: Colors.white70),),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Votes: ${movie['totalVoted'] ?? 0}",
                                  style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white70),
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.blueAccent, // Text color
                                    shadowColor: Colors.tealAccent, // Shadow color
                                    elevation: 5, // Elevation of the button
                                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15), // Button padding
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30), // Rounded corners
                                    ),
                                  ),
                                  onPressed: () {
                                    // Can implement vote functionality here
                                  },
                                  child: Text('Vote',style: TextStyle(color: Colors.white),),

                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    CustomButton(
                      width: 300,
                      backgroundColor: Colors.blueAccent,
                      isThreeD: true,
                      height: 50,
                      borderRadius: 25,
                      animate: true,
                      margin: const EdgeInsets.all(10),
                      onPressed: () {},
                      child: Text(
                        "Trailer",
                        style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color: Colors.white),
                      ),
                    ),
                  ],
                ),

              ),
            );
                    },
                  ),
          ),
    );
  }
}
