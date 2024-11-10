import 'package:flutter/material.dart';

class FavoriteCard extends StatefulWidget {
  const FavoriteCard({super.key, required this.title, required this.description});

  final String title;
  final String description;

  @override
  State<FavoriteCard> createState() => _FavoriteCardState();
}

class _FavoriteCardState extends State<FavoriteCard> {
  bool isFavorite = false;

  void clickFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 1, color: Colors.grey),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.blue),
                ),
                const SizedBox(height: 8.0),
                Text(
                  widget.description,
                  style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: clickFavorite,
            icon: Icon(
              Icons.favorite,
              color: isFavorite ? Colors.red : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}

class Ex2 extends StatelessWidget {
  const Ex2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Cards'),
      ),
      body: const Column(
        children: [
          FavoriteCard(title: 'Title', description: 'Description'),
          //Divider(color: Colors.grey,),
          FavoriteCard(title: 'Title', description: 'Description'),
          //Divider(color: Colors.grey,),
          FavoriteCard(title: 'Title', description: 'Description'),
          //Divider(color: Colors.grey,),
        ],
      ),
    );
  }
}
