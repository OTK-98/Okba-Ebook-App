import 'package:flutter/material.dart';

class SearchResultsPage extends StatelessWidget {
  final List searchResults;

  SearchResultsPage({required this.searchResults});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search Results"),
      ),
      body: ListView.builder(
        itemCount: searchResults.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(searchResults[index]['title']),
            subtitle: Text(searchResults[index]['author']),
          );
        },
      ),
    );
  }
}
