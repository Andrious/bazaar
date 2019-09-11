import 'package:flutter/material.dart';


// SearchBar

class ProductSearch extends SearchDelegate<String> {
  // final List searchProd = ["arr", "allow", "Blazer", "ramu", "haz"];
  final List searchProd = [
    'Blazer',
    'Red-Blazer',
    'Dress',
    'Jeans',
    'Green-T-Shirt',
    'T-Shirt',
    'Skirt1',
    'Skirt2',
    'Shoe1',
    'Shoe2',
    'Heel1',
    'Heel2',
  ];
  final List recentSearchProd = [
    'Blazer',
    'Jeans',
    'Skirt1',
  ];
  @override
  List<Widget> buildActions(BuildContext context) {
    // Actions for appbar
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // Leading icon
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
    );
  }

  @override
  Widget buildResults(
      BuildContext context,
      ) {
    // show results for given keyword

    return Center(
        child: CircularProgressIndicator(backgroundColor: Colors.redAccent));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // shows suggestions for keyword
    final suggestionList = query.isEmpty
        ? recentSearchProd
        : searchProd.where((s) => s.toLowerCase().startsWith(query)).toList();
    // contains,startswith,endswith and so on
    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (_, int i) {
        return ListTile(
          onTap: () {
            showResults(context);
          },
          leading: Icon(Icons.shopping_basket),
          title: RichText(
            text: TextSpan(
              text: suggestionList[i].substring(0, query.length),
              style:
              TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              children: [
                TextSpan(
                    text: suggestionList[i].substring(query.length),
                    style: TextStyle(color: Colors.grey)),
              ],
            ),
          ),
        );
      },
    );
  }
}
