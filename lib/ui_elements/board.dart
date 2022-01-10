import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:tictactoe/constants.dart';
import 'package:tictactoe/provider/game_provider.dart';

class Board extends StatefulWidget {
  const Board({
    Key? key,
  }) : super(key: key);

  @override
  State<Board> createState() => _BoardState();
}

class _BoardState extends State<Board> {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Consumer<GameProvider>(
      builder: (BuildContext context, GameProvider state, child) {
        GameProvider gameProvider =
            Provider.of<GameProvider>(context, listen: true);
        return Container(
          //height: screenSize.height * 0.5,
          color: Colors.grey,
          child: GridView.count(
            shrinkWrap: true,
            // Create a grid with 2 columns. If you change the scrollDirection to
            // horizontal, this produces 2 rows.
            crossAxisCount: 3,
            // Generate 100 widgets that display their index in the List.
            children: [
              //a[0][0]
              GestureDetector(
                onTap: () {
                  gameProvider.move(0, 0, context);
                },
                child: BoardTile(
                  value: gameProvider.board[0][0] == boardStatus.empty
                      ? "-"
                      : gameProvider.board[0][0] == boardStatus.player1
                          ? "o"
                          : "x",
                ),
              ),
              //a[0][1]
              GestureDetector(
                onTap: () {
                  gameProvider.move(0, 1, context);
                },
                child: BoardTile(
                  value: gameProvider.board[0][1] == boardStatus.empty
                      ? "-"
                      : gameProvider.board[0][1] == boardStatus.player1
                          ? "o"
                          : "x",
                ),
              ),
              //a[0][2]
              GestureDetector(
                onTap: () {
                  gameProvider.move(0, 2, context);
                },
                child: BoardTile(
                  value: gameProvider.board[0][2] == boardStatus.empty
                      ? "-"
                      : gameProvider.board[0][2] == boardStatus.player1
                          ? "o"
                          : "x",
                ),
              ),
              //a[1][0]
              GestureDetector(
                onTap: () {
                  gameProvider.move(1, 0, context);
                },
                child: BoardTile(
                  value: gameProvider.board[1][0] == boardStatus.empty
                      ? "-"
                      : gameProvider.board[1][0] == boardStatus.player1
                          ? "o"
                          : "x",
                ),
              ),
              //a[1][1]
              GestureDetector(
                onTap: () {
                  gameProvider.move(1, 1, context);
                },
                child: BoardTile(
                  value: gameProvider.board[1][1] == boardStatus.empty
                      ? "-"
                      : gameProvider.board[1][1] == boardStatus.player1
                          ? "o"
                          : "x",
                ),
              ),
              //a[1][2]
              GestureDetector(
                onTap: () {
                  gameProvider.move(1, 2, context);
                },
                child: BoardTile(
                  value: gameProvider.board[1][2] == boardStatus.empty
                      ? "-"
                      : gameProvider.board[1][2] == boardStatus.player1
                          ? "o"
                          : "x",
                ),
              ),
              //a[2][0]
              GestureDetector(
                onTap: () {
                  gameProvider.move(2, 0, context);
                },
                child: BoardTile(
                  value: gameProvider.board[2][0] == boardStatus.empty
                      ? "-"
                      : gameProvider.board[2][0] == boardStatus.player1
                          ? "o"
                          : "x",
                ),
              ),
              //a[2][1]
              GestureDetector(
                onTap: () {
                  gameProvider.move(2, 1, context);
                },
                child: BoardTile(
                  value: gameProvider.board[2][1] == boardStatus.empty
                      ? "-"
                      : gameProvider.board[2][1] == boardStatus.player1
                          ? "o"
                          : "x",
                ),
              ),
              //a[2][2]
              GestureDetector(
                onTap: () {
                  gameProvider.move(2, 2, context);
                },
                child: BoardTile(
                  value: gameProvider.board[2][2] == boardStatus.empty
                      ? "-"
                      : gameProvider.board[2][2] == boardStatus.player1
                          ? "o"
                          : "x",
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class BoardTile extends StatelessWidget {
  const BoardTile({
    required this.value,
    Key? key,
  }) : super(key: key);
  final String value;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.all(0.8),
      color: screenBackGroundColor,
      height: 100,
      width: screenSize.width * 0.25,
      child: Center(
          child: Text(
        value,
        style: GoogleFonts.lato(color: Colors.red, fontSize: 40),
      )),
    );
  }
}
