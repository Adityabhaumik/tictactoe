import 'package:flutter/material.dart';
import 'package:tictactoe/screens/home_screen.dart';
import 'package:tictactoe/screens/player_vs_computer.dart';
import 'package:tictactoe/screens/player_vs_player.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tic Tac Toe',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: const Home(),
      routes: {
        Home.id: (context) => const Home(),
        PlayerVsComputer.id: (context) => const PlayerVsComputer(),
        PlayerVsPlayer.id: (context) => const PlayerVsPlayer(),
        // PlayerVsComputer.id: (context) => const PlayerVsComputer(),
        // PlayerVsComputer.id: (context) => const PlayerVsComputer(),
      },
    );
  }
}
