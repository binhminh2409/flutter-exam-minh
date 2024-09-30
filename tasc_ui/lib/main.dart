import 'package:flutter/material.dart';
import 'package:tasc_ui/service/api_service';
import 'model/place.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Popular Destinations',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Place>> _places;

  // Fetch API
  @override
  void initState() {
    super.initState();
    _places = ApiService().fetchPlaces(); 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Popular Destinations'),
      ),
      body: FutureBuilder<List<Place>>(
        future: _places,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator()); // Loading spinner
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No places found.'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final place = snapshot.data![index];
                return Card(
                  child: ListTile(
                    leading: place.imageUrl.isNotEmpty
                        ? Image.network(place.imageUrl, width: 50, height: 50)
                        : Icon(Icons.location_city, size: 50),
                    title: Text(place.name),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
