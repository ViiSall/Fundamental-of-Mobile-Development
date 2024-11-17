import 'package:flutter/material.dart';
import 'db/jokes.dart';
import 'model/joke_model.dart';

Color appColor = Colors.green[300] as Color;

void main() => runApp(JokeApp());

class JokeApp extends StatefulWidget {
  const JokeApp({
    super.key,
  });

  @override
  State<JokeApp> createState() => _JokeAppState();
}

class _JokeAppState extends State<JokeApp> {
  String? favoriteJokeId;

  void updateFavorite(String jokeId) {
    setState(() {
      favoriteJokeId = jokeId;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: appColor,
          title: const Text("Favorite Jokes"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ...jokes.map(
                    (joke) {
                  return FavoriteCard(
                    joke: joke,
                    isFavorite: joke.id == favoriteJokeId,
                    selectFavorite: () => updateFavorite(joke.id!),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class FavoriteCard extends StatelessWidget {
  const FavoriteCard(
      {super.key,
        required this.joke,
        required this.isFavorite,
        required this.selectFavorite});

  final Joke joke;
  final bool isFavorite;
  final VoidCallback selectFavorite;

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
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  joke.title,
                  style:
                  TextStyle(color: appColor, fontWeight: FontWeight.w800),
                ),
                const SizedBox(height: 10.0),
                Text(joke.description)
              ],
            ),
          ),
          IconButton(
              onPressed: selectFavorite,
              icon: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: isFavorite ? Colors.red : Colors.grey,
              ))
        ],
      ),
    );
  }
}