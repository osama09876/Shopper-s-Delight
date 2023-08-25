import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shop_now/Models/Productlist.dart';
import 'package:shop_now/UI%20Helper/Customcolor.dart';
import 'package:shop_now/Views/ProductDetails.dart';
import 'package:shop_now/providers/themeProvider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List _searchResults = [];
  void _performSearch(String query) {
    setState(() {
      _searchResults = ProdustListing.searchList.where((product) {
        return product.title!.toLowerCase().contains(query.toLowerCase());
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      backgroundColor:
          themeProvider.isDarkMode ? Colors.transparent : whitecolor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor:
            themeProvider.isDarkMode ? Colors.transparent : whitecolor,
        centerTitle: true,
        title: Text(
          'Search Products',
          style: GoogleFonts.aboreto(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                label: Text('Search'),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
              onChanged: _performSearch,
            ),
          ),
          Expanded(
            child: _searchResults.isEmpty
                ? Text('No result Found')
                : ListView.builder(
                    itemCount: _searchResults.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProductDetails(
                                      data: _searchResults[index])));
                        },
                        leading: Image(
                            width: 50,
                            height: 50,
                            image: AssetImage(
                                _searchResults[index].imageUrl1.toString())),
                        title: Text(_searchResults[index].title.toString()),
                        subtitle: Text('\$ ${_searchResults[index].cost}'),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
