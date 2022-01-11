///This is File is written with reference to "https://medium.com/@dmilicic/building-a-tic-tac-toe-app-in-flutter-e893792f1fed"

class ComputerMoveCalculator {
  static const int player1 = 1;
  static const int computer = -1;
  static const int winners = 0;
  static const int draw = 2;
  static const int empty = 0;
  static const int won = 100;
  static const int draw_ = 0;
  static const int lost = -100;
  static const winConditions = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6],
  ];

  int changePlayer(int currentPlayer) {
    return -1 * currentPlayer;
  }

  bool isBoardFull(List<int> board) {
    for (var val in board) {
      if (val == ComputerMoveCalculator.empty) return false;
    }

    return true;
  }

  bool isMoveLegal(List<int> board, int move) {
    if (move < 0 ||
        move >= board.length ||
        board[move] != ComputerMoveCalculator.empty) {
      return false;
    }

    return true;
  }

  int evaluateBoard(List<int> board) {
    for (var list in ComputerMoveCalculator.winConditions) {
      if (board[list[0]] != ComputerMoveCalculator.empty &&
          board[list[0]] == board[list[1]] &&
          board[list[0]] == board[list[2]]) {
        return board[list[0]];
      }
    }
    if (isBoardFull(board)) {
      return ComputerMoveCalculator.draw;
    }
    return ComputerMoveCalculator.winners;
  }

  int calculate(List<int> board, int currentPlayer) {
    return findBestMove(board, currentPlayer).move;
  }

  int findBestScore(List<int> board, int currentPlayer) {
    int evaluation = evaluateBoard(board);

    if (evaluation == currentPlayer) {
      return won;
    } else if (evaluation == draw) {
      return draw_;
    } else if (evaluation == changePlayer(currentPlayer)) {
      return lost;
    }

    return findBestMove(board, currentPlayer).score;
  }

  Move findBestMove(List<int> board, int currentPlayer) {
    List<int> boardCopy;
    Move bestMove = Move(score: -10000, move: -1);
    for (int i = 0; i < board.length; i++) {
      if (!isMoveLegal(board, i)) {
        continue;
      }
      boardCopy = List.from(board);
      boardCopy[i] = currentPlayer;
      int nextScore = -findBestScore(boardCopy, changePlayer(currentPlayer));
      if (nextScore > bestMove.score) {
        bestMove.score = nextScore;
        bestMove.move = i;
      }
    }
    return bestMove;
  }
}

class Move {
  int score;
  int move;

  Move({required this.score, required this.move});
}
