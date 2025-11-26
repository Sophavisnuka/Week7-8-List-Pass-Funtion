import 'package:flutter/material.dart';
import 'data/jokes.dart';

Color appColor = Colors.green[300] as Color;

void main() => runApp(MaterialApp(home: JokeListScreen()));

class JokeListScreen extends StatefulWidget {

  const JokeListScreen ({
    super.key
  });

  @override
  State<JokeListScreen> createState() => _JokeListScreenState();
}

class _JokeListScreenState extends State<JokeListScreen> {
  int? favoriteIndex; // store which joke is the favorite

  void setFavorite(int index) {
    setState(() {
      favoriteIndex = index; // only 1 favorite
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: appColor,
        title: const Text("Favorite Jokes"),
      ),

      // Scrollable !!
      body: ListView.builder(
        itemCount: jokes.length,
        itemBuilder: (context, index) {
          return FavoriteCard(
            joke: jokes[index],
            isFavorite: favoriteIndex == index,
            onFavoriteClick: () => setFavorite(index),
          );
        },
      ),
    );
  }
}


class FavoriteCard extends StatelessWidget {
  final Joke joke;
  final bool isFavorite;
  final VoidCallback onFavoriteClick;

  const FavoriteCard({
    super.key,
    required this.joke,
    required this.isFavorite,
    required this.onFavoriteClick,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(width: .5, color: Colors.grey),
        ),
      ),
      padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
      child: Row(
        children: [
          Expanded(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  joke.title,
                  style: TextStyle(
                    color: appColor,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 10),
                Text(joke.description),
              ],
            ),
          ),
          IconButton(
            onPressed: onFavoriteClick,
            icon: Icon(
              isFavorite ? Icons.favorite : Icons.favorite_border,
              color: isFavorite ? Colors.red : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
