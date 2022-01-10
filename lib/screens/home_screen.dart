import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tictactoe/constants.dart';
import 'package:tictactoe/screens/player_vs_computer.dart';
import 'package:tictactoe/screens/player_vs_player.dart';

class Home extends StatefulWidget {
  static const id = "Home";

  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: screenBackGroundColor,
      appBar: AppBar(
        elevation: 0.0,
        shadowColor: Colors.transparent,
        backgroundColor: screenBackGroundColor,
        centerTitle: true,
        title: Text(
          "Tic Tac Toe",
          style: GoogleFonts.lato()
              .copyWith(color: Colors.white70, fontSize: 25.0),
        ),
      ),
      body: Stack(
        children: [
          Container(
            height: screenSize.height * 0.5,
            width: screenSize.width,
            child: Image.asset("assets/TicTacToe.png"),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: SizedBox(
              width: screenSize.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: screenSize.height * 0.1,
                    width: screenSize.width * 0.9,
                    child: TextButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.black45),
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.black45),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, PlayerVsComputer.id);
                      },
                      child: Text(
                        'Player  vs  Computer',
                        style: GoogleFonts.lato()
                            .copyWith(fontSize: 25.0, color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  SizedBox(
                    height: screenSize.height * 0.1,
                    width: screenSize.width * 0.9,
                    child: TextButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.black45),
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.black45),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, PlayerVsPlayer.id);
                      },
                      child: Text(
                        'Player  vs  Player',
                        style: GoogleFonts.lato()
                            .copyWith(fontSize: 25.0, color: Colors.white),
                      ),
                    ),
                  ),

                  // SizedBox(
                  //   height: screenSize.height * 0.1,
                  //   width: screenSize.width,
                  //   child: TextButton(
                  //     style: ButtonStyle(
                  //       foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                  //     ),
                  //     onPressed: () {},
                  //     child: const Text(
                  //       'Player vs Player(online)',
                  //       style: TextStyle(fontSize: 35, color: Colors.white),
                  //     ),
                  //   ),
                  // ),
                  SizedBox(
                    height: screenSize.height * 0.2,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
