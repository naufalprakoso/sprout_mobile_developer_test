import 'package:flutter/material.dart';

class PokemonDetailScreen extends StatelessWidget {
  const PokemonDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[200],
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.teal[300],
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Bulbasaur", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),
                  Text("#001", style: TextStyle(fontSize: 20, color: Colors.white.withOpacity(0.7))),
                  SizedBox(height: 10),
                  Image.network('https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/1.png', height: 150),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Chip(label: Text("Grass", style: TextStyle(color: Colors.white)), backgroundColor: Colors.green),
                      SizedBox(width: 10),
                      Chip(label: Text("Poison", style: TextStyle(color: Colors.white)), backgroundColor: Colors.purple),
                    ],
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: PokemonDetailScreen(),
          )
        ],
      ),
    );
  }
}
