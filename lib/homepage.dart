import 'package:casino/carte.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Carte> cards = [];

  List<Carte> currentCards = [];

  var rng = Random();

  void _generateNewGame() {
    cards.add(const Carte(name: 'bar', image: 'images/bar.png'));
    cards.add(const Carte(name: 'cerise', image: 'images/cerise.png'));
    cards.add(const Carte(name: 'cloche', image: 'images/cloche.png'));
    cards.add(const Carte(name: 'diamant', image: 'images/diamant.png'));
    cards.add(
        const Carte(name: 'fer-a-cheval', image: 'images/fer-a-cheval.png'));
    cards.add(const Carte(name: 'pasteque', image: 'images/pasteque.png'));
    cards.add(const Carte(name: 'sept', image: 'images/sept.png'));

    currentCards.add(cards[1]);
    currentCards.add(cards[2]);
    currentCards.add(cards[3]);
  }

  @override
  void initState() {
    _generateNewGame();
    super.initState();
  }

  void _generateGame() {
    setState(() {
      currentCards.clear();
      currentCards.add(cards[rng.nextInt(7)]);
      currentCards.add(cards[rng.nextInt(7)]);
      currentCards.add(cards[rng.nextInt(7)]);

      if (currentCards[0].name == cards[6].name &&
          currentCards[1].name == cards[6].name &&
          currentCards[2].name == cards[6].name) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Vous avez gagné le jackpot!'),
          ),
        );
      } else if (currentCards[0].name == currentCards[1].name &&
          currentCards[1].name == currentCards[2].name) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Vous avez gagné !'),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: GridView.count(
          crossAxisCount: 3,
          children: [
            Image(image: AssetImage(currentCards[0].image)),
            Image(image: AssetImage(currentCards[1].image)),
            Image(image: AssetImage(currentCards[2].image)),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _generateGame,
        tooltip: 'Increment',
        child: const Icon(Icons.play_arrow),
      ),
    );
  }
}
