import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';

List<WordPair> _saved = List<WordPair>();

class FavoriteListPage extends StatelessWidget {
  final List<WordPair> favorites;

  FavoriteListPage(
    this.favorites, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("This is favorite page " + favorites.toString());
    _saved = favorites;
    return Scaffold(
      appBar: AppBar(
        title: Text("Favorite List"),
      ),
      body: ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(
              favorites[index].asCamelCase,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          );
        },
        itemCount: favorites.length,
        separatorBuilder: (BuildContext context, int index) {
          return Divider(
            thickness: 1,
            height: 5,
            color: Colors.grey[300],
            indent: 16,
            endIndent: 16,
          );
        },
      ),
    );
  }
}
