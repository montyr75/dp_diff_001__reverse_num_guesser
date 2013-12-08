/*
 * Create a program that will try to guess a number between 1 and 100 that the user is thinking of.
 * Provide a menu for user feedback with options for high, low, or correct guesses.
 * The optimal binary algorithm yields a 7-guess maximum.
 */

import "dart:io";

const int MAX_GUESS = 100;

int floor = 0;            // needs to start at 0, or rounding will never result in a guess of 1
int ceiling = MAX_GUESS;
int guesses = 0;
int lastGuess;

void main() {
  print("\nThink of a number between 1 and $MAX_GUESS, and I'll try to guess it!");
  print("\nPress <ENTER> once you've got your number.");

  // get user input and throw away result
  stdin.readLineSync();

  // take a guess
  guess();
}

void guess() {
  // calculate a new guess
  lastGuess = ((floor + ceiling) / 2).round();

  // count each guess made
  guesses++;

  print("\nI guess...ummm...$lastGuess!");

  printMenu();
}

void printMenu() {
  print("\n** MENU **"
    "\nGuess is too (h)igh"
    "\nGuess is too (l)ow"
    "\nGuess is (c)orrect"
  );

  // get user input (not case sensitive)
  String input = stdin.readLineSync().toLowerCase();

  // handle menu selections
  switch (input) {
    case 'h': ceiling = lastGuess; guess(); break;
    case 'l': floor = lastGuess; guess(); break;
    case 'c': win(); break;
    default:
      print("\nWhat the hell was that? Try again, pal.");
      printMenu();
      break;
  }
}

void win() {
  // handle plurality
  String guess = guesses == 1 ? "guess" : "guesses";

  print("\nYes! I win! Eat it! I guessed your number ($lastGuess) in $guesses $guess.");
}