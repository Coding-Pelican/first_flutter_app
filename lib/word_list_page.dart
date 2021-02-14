import 'package:english_words/english_words.dart';
import 'package:first_flutter_app/favorite_list_page.dart';
import 'package:flutter/material.dart';

class WordListPage extends StatelessWidget {
  const WordListPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("First Flutter App"),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.favorite),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return FavoriteListPage();
                }));
              })
        ],
      ),
      body: Center(child: RandomWords()), //  Alt + Enter
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  List<WordPair> words = [];
  Set<WordPair> saved = Set<WordPair>();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        if (index >= words.length)
          words.addAll(generateWordPairs().take(10)); //  1h 9m

        return _getRow(words[index]);
      },
    );
  }

  Widget _getRow(WordPair wordPair) {
    bool _isAlreadySaved = saved.contains(wordPair);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ListTile(
            onTap: () {
              setState(() {
                if (_isAlreadySaved) {
                  saved.remove(wordPair);
                } else {
                  saved.add(wordPair);
                }
              });
              print(saved.toString());
            },
            title: Text(
              wordPair.asCamelCase,
              textScaleFactor: 1,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            trailing: Icon(
                _isAlreadySaved ? Icons.favorite : Icons.favorite_border,
                color: Colors.red)),
        Divider(
          thickness: 1,
          height: 5,
          color: Colors.grey[300],
          indent: 16,
          endIndent: 16,
        )
      ],
    );
  }
}
