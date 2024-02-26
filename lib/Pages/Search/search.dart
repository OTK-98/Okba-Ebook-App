import 'package:e_book_okba_store/Components/BookCard.dart';
import 'package:e_book_okba_store/Controller/BookController.dart';
import 'package:e_book_okba_store/Pages/BookDetails/BookDetails.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:lottie/lottie.dart';

class SearchScreen extends StatefulWidget {
  // final FocusNode focusNode;

  const SearchScreen({
    Key? key,
    // required this.focusNode
  }) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController _searchController = TextEditingController();
  BookController bookController = Get.put(BookController());

  bool _isResultsVisible = false;
  List filteredResults = [];

  void clearSearch() {
    _searchController.clear();
    setState(() {
      _isResultsVisible = false;
      filteredResults.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          backgroundColor: Color(0xFF15202B),
          body: Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                  child: Row(
                    children: [
                      Icon(Iconsax.search_status, color: Colors.white),
                      SizedBox(width: 15),
                      Expanded(
                        child: TextField(
                          onChanged: (query) {
                            _searchController.text = query;

                            if (query.isEmpty) {
                              setState(() {
                                _isResultsVisible = false;
                              });
                            } else {
                              bookController.searchFromFirebase1(query,
                                  (List<dynamic> searchResults) {
                                setState(() {
                                  filteredResults = searchResults;
                                  _isResultsVisible = true;
                                });
                              });
                            }
                          },
                          controller: _searchController,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            hintText: 'ابحث عن كتابك المفضل...',
                            hintStyle: TextStyle(color: Colors.white54),
                            border: InputBorder.none,
                            contentPadding:
                                EdgeInsets.zero, // Set padding to zero
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Iconsax.close_circle),
                        onPressed: clearSearch,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Expanded(
                  child: Container(
                    child: _isResultsVisible
                        ? GridView.count(
                            scrollDirection: Axis.vertical,
                            crossAxisCount: 3,
                            childAspectRatio: 0.1, // Adjust this value
                            crossAxisSpacing:
                                1, // Adjust the spacing between columns
                            mainAxisSpacing:
                                1, // Adjust the spacing between rows
                            padding: EdgeInsets.all(16.0),
                            children: filteredResults.map((e) {
                              return BookCard(
                                title: e.title,
                                coverUrl: e.coverUrl,
                                ontap: () {
                                  Get.to(BookDetails(
                                    book: e,
                                  ));
                                },
                              );
                            }).toList(),
                          )
                        : Center(
                            child: Container(
                              width: 80, // Set the desired width
                              height: 80, // Set the desired height
                              child: Image.asset(
                                "Assets/Icons/search.png",
                              ),
                            ),
                          ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
