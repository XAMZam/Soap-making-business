import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// The main function, entry point of the application
void main() {
  // Running the app by passing the instance of MyApp widget
  runApp(const MyApp());
}

// MyApp class, a StatelessWidget that represents the root of the application
class MyApp extends StatelessWidget {
  // Constructor for MyApp
  const MyApp({Key? key}) : super(key: key);

  // The build method required to override for StatelessWidget, it returns the root widget of the application
  @override
  Widget build(BuildContext context) {
    // MaterialApp widget, provides the core functionality of a material design app
    return MaterialApp(
      // Title of the application
      title: 'shopcare',
      // Theme data for the application, specifying the primary swatch color
      theme: ThemeData(
        //pr
        primarySwatch: Colors.lightGreen,
      ),
     // Setting debugShowCheckedModeBanner to false removes the debug banner in the app
      debugShowCheckedModeBanner: false, 
      // The home page of the application, an instance of MyHomePage widget
      home: const MyHomePage(title: 'Shopcare Home'),
    ); // materialApp
  }
}

// MyHomePage class, a StatelessWidget representing the home page of the application
class MyHomePage extends StatelessWidget {
  // Title of the home page
  final String title;

  // Constructor for MyHomePage
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // The build method required to override for StatelessWidget, it returns the widget hierarchy of the home page
  @override
  Widget build(BuildContext context) {
    // Dummy list of categories
    List<String> categories = [
      'Lavender & Chamomile',
      'Peppermint & Eucalyptus',
      'Citrus & Ginger',
      'Rosemary & Mint',
      'Tea Tree & Lavender',
      'Oatmeal & Honey',
      
    ];

    // Scaffold widget, provides a framework for implementing the basic material design visual layout structure of the home page
    return Scaffold(
      // AppBar widget, represents the app bar at the top of the screen
      appBar: AppBar(
        // Title of the app bar, centered using the Center widget
        title: Center(child: Text(title)),
      ),
      // GridView.builder widget, builds a grid view with a custom builder
      body: GridView.builder(
        // SliverGridDelegate that defines the grid layout
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Number of columns in the grid
        crossAxisSpacing: 10.0, // Spacing between columns
        mainAxisSpacing: 10.0, // Spacing between rows
        childAspectRatio: 2.0, // Aspect ratio of each tile (width / height)
        ),
        // Number of items in the grid view
        itemCount: categories.length,
        // Builder function that returns the widget for each item in the grid view
        itemBuilder: (BuildContext context, int index) {
          // GestureDetector widget, detects gestures on its child and calls onTap callback when tapped
          return GestureDetector(
            // onTap callback function called when the category tile is tapped
            onTap: () {
              // Handle category tap by printing the tapped category
              print('Category tapped: ${categories[index]}');
              // Navigate to categories screen with selected category
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CategoriesScreen(category: categories[index]),
                ),
              );
            },
            // Card widget, represents a material design card containing the category name
            child: Card(
              elevation: 3.0,
              // Centering the category name text within the card
              child: Center(
                // Text widget displaying the category name
                child: Text(
                  categories[index],
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

// CategoriesScreen class, a StatelessWidget representing the screen displaying products for a specific category
class CategoriesScreen extends StatelessWidget {
  // Category for which the products are displayed
  final String category;

  // Constructor for CategoriesScreen
  const CategoriesScreen({Key? key, required this.category}) : super(key: key);

  // The build method required to override for StatelessWidget, it returns the widget hierarchy of the categories screen
  @override
  Widget build(BuildContext context) {
    // Dummy list of products for the selected category
    List<String> products = [
      'Hair shampoo',
      'Scrub',
      'Face cleanser ',
      'Body and liquid soap',
      'Essential oil',
    ];

    // Scaffold widget, provides a framework for implementing the basic material design visual layout structure of the categories screen
    return Scaffold(
      // AppBar widget, represents the app bar at the top of the screen
      appBar: AppBar(
        // Title of the app bar, centered using the Center widget
        title: Text(category),
        centerTitle: true,
      ),
      // GridView.builder widget, builds a grid view with a custom builder
      body: GridView.builder(
        // SliverGridDelegate that defines the grid layout
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of columns in the grid
          crossAxisSpacing: 10.0, // Spacing between columns
          mainAxisSpacing: 10.0, // Spacing between rows
          childAspectRatio: 1.5, // Aspect ratio of each tile (width / height)
        ),
        // Number of items in the grid view
        itemCount: products.length,
        // Builder function that returns the widget for each item in the grid view
        itemBuilder: (BuildContext context, int index) {
          // GestureDetector widget, detects gestures on its child and calls onTap callback when tapped
          return GestureDetector(
            // onTap callback function called when the product tile is tapped
            onTap: () {
              // Handle product tap by printing the tapped product
              print('Product tapped: ${products[index]}');
            },
            // Card widget, represents a material design card containing the product name
            child: Card(
              elevation: 3.0,
              // Padding around the product name text within the card
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                // Text widget displaying the product name
                child: Text(
                  products[index],
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
