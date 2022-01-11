import 'dart:math';

import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:tictactoe/constants.dart';
import 'package:tictactoe/models/computer.dart';

class GameProvider extends ChangeNotifier {
  List<List<boardStatus>> board = [
    [boardStatus.empty, boardStatus.empty, boardStatus.empty],
    [boardStatus.empty, boardStatus.empty, boardStatus.empty],
    [boardStatus.empty, boardStatus.empty, boardStatus.empty],
  ];

  //turn lastTurn = turn.player1;
  boardStatus currentTurn = boardStatus.player1;

  //turn lastTurn = turn.player1;
  int totalMoves = 0;
  bool isVsComputer = false;

  bool checkWinner(int rowIndex, int columnIndex) {
    int score = 0;
    if (board[0][0] == board[1][1] &&
            board[2][2] == board[1][1] &&
            board[2][2] != boardStatus.empty ||
        board[0][2] == board[1][1] &&
            board[2][0] == board[1][1] &&
            board[2][0] != boardStatus.empty) {
      return true;
      //the current player is the winner
    } else {
      ///check for row match
      for (int i = 0; i < 3; i++) {
        if (board[rowIndex][i] == currentTurn) {
          score++;
        }
      }
      if (score == 3) {
        return true;
      }
      score = 0;

      ///check for collum match
      for (int i = 0; i < 3; i++) {
        if (board[i][columnIndex] == currentTurn) {
          score++;
        }
      }
      if (score == 3) {
        return true;
      }
    }
    return false;
  }

  void resetBoard() {
    currentTurn = boardStatus.player1;
    totalMoves = 0;
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        board[i][j] = boardStatus.empty;
      }
    }
    notifyListeners();
  }

  void move(int rowIndex, int columnIndex, BuildContext context) {
    bool winner = false;
    if (board[rowIndex][columnIndex] == boardStatus.empty) {
      board[rowIndex][columnIndex] = currentTurn;
      winner = checkWinner(rowIndex, columnIndex);
      if (winner == true) {
        //print("$currentTurn has won");
        CoolAlert.show(
          context: context,
          type: isVsComputer == true
              ? CoolAlertType.loading
              : CoolAlertType.success,
          text: currentTurn == boardStatus.player1
              ? "Player 1 has won"
              : isVsComputer == true
                  ? "Computer won"
                  : "Player 2 has won",
        );
        resetBoard();
        return;
      }
      totalMoves++;
      if (totalMoves == 9) {
        //print("game finished");
        CoolAlert.show(
          context: context,
          type: CoolAlertType.loading,
          text: "Well Played the match is Draw",
        );
        resetBoard();
        return;
      }
      currentTurn == boardStatus.player2
          ? currentTurn = boardStatus.player1
          : currentTurn = boardStatus.player2;
      notifyListeners();
      if (isVsComputer == true && currentTurn == boardStatus.player2) {
        //computerMove(context);
        aiMove(context);
        currentTurn = boardStatus.player1;
      }
    }

    ///TODO: check if there is a winner

    notifyListeners();
  }

  void computerMove(BuildContext context) {
    bool moveMade = false;
    var rng = Random();
    int j, i;
    while (true) {
      i = rng.nextInt(3);
      j = rng.nextInt(3);
      if (board[i][j] == boardStatus.empty) {
        move(i, j, context);
        return;
      }
    }

    // for (int i = 0; i < 3; i++) {
    //   for (int j = 0; j < 3; j++) {
    //     if (board[i][j] == boardStatus.empty) {
    //       move(i, j, context);
    //       return;
    //     }
    //   }
    // }
    return;
  }

  void aiMove(BuildContext context) {
    bool moveMade = false;
    var ai = ComputerMoveCalculator();
    List<int> boardInArray = [];
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        if (board[i][j] == boardStatus.player1) {
          boardInArray.add(1);
        } else if (board[i][j] == boardStatus.player2) {
          boardInArray.add(-1);
        } else {
          boardInArray.add(0);
        }
      }
    }
    var bestMove = ai.findBestMove(boardInArray, -1);
    if(bestMove.move<=2){
      move(0, bestMove.move, context);
    }
    else if(bestMove.move<=5){
      int col=bestMove.move%3;
      move(1, col, context);
    }
    else if(bestMove.move<=8){
      int col=bestMove.move%3;
      move(2, col, context);
    }
    //print(bestMove.move);
  }
}
