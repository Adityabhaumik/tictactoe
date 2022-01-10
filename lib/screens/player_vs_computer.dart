import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tictactoe/constants.dart';
import 'package:tictactoe/provider/game_provider.dart';
import 'package:tictactoe/ui_elements/board.dart';

class PlayerVsComputer extends StatefulWidget {
  static const id = "PlayerVsComputer";

  const PlayerVsComputer({Key? key}) : super(key: key);

  @override
  _PlayerVsComputerState createState() => _PlayerVsComputerState();
}

class _PlayerVsComputerState extends State<PlayerVsComputer> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return ChangeNotifierProvider<GameProvider>(
      create: (BuildContext context) => GameProvider(),
      child: Consumer<GameProvider>(
          builder: (BuildContext context, GameProvider state, child) {
        GameProvider gameProvider =
            Provider.of<GameProvider>(context, listen: true);
        gameProvider.isVsComputer = true;
        return Scaffold(
          backgroundColor: screenBackGroundColor,
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white70,
              ),
            ),
            elevation: 0.0,
            shadowColor: Colors.transparent,
            backgroundColor: screenBackGroundColor,
            centerTitle: true,
            title: Text(
              "Player Vs Computer",
              style: GoogleFonts.lato()
                  .copyWith(color: Colors.white70, fontSize: 25.0),
            ),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: screenSize.height * 0.2,
                child: Center(
                  child: Text(
                    "Turn : ${gameProvider.currentTurn == boardStatus.player1 ? "Player 1" : "Computer "}",
                    style:
                        GoogleFonts.lato(color: Colors.white70, fontSize: 45),
                  ),
                ),
              ),
              const Board(),
            ],
          ),
        );
      }),
    );
  }
}
