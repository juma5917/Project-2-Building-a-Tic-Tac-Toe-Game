import 'dart:io';

// Define the board structure
List<String> board = List.filled(9, ' ');

// Display the board
void displayBoard() {
  print(' ${board[0]} | ${board[1]} | ${board[2]} ');
  print('-----------');
  print(' ${board[3]} | ${board[4]} | ${board[5]} ');
  print('-----------');
  print(' ${board[6]} | ${board[7]} | ${board[8]} ');
}

// Check for a winner or a draw
String checkWinner() {
  List<List<int>> winConditions = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
  ];

  for (var condition in winConditions) {
    if (board[condition[0]] != ' ' &&
        board[condition[0]] == board[condition[1]] &&
        board[condition[1]] == board[condition[2]]) {
      return board[condition[0]];
    }
  }

  if (!board.contains(' ')) {
    return 'draw';
  }

  return '';
}

// Main game loop
void main() {
  print('Welcome to Tic Tac Toe!');

  bool player1Turn = true;

  while (true) {
    displayBoard();

    var currentPlayer = player1Turn ? 'X' : 'O';
    print('Player ${player1Turn ? '1' : '2'} ($currentPlayer), enter your move (1-9):');

    var move = int.tryParse(stdin.readLineSync()!);

    if (move != null && move >= 1 && move <= 9 && board[move - 1] == ' ') {
      board[move - 1] = currentPlayer;

      var winner = checkWinner();
      if (winner.isNotEmpty) {
        displayBoard();
        if (winner == 'draw') {
          print('It\'s a draw!');
        } else {
          print('Player $winner wins!');
        }
        break;
      }

      player1Turn = !player1Turn;
    } else {
      print('Invalid move. Please enter a number between 1 and 9 for an empty cell.');
    }
  }
}
