#include <stdio.h>
#include <ncurses.h>

int main() {
  int ch;

  initscr();
  raw();
  keypad(stdscr, TRUE);
  noecho();

  do {
    ch = getch();
    printw("Key: %d\n", ch);
    refresh();
  } while (ch != 113); // 113 = 'q'

  endwin();
  return 0;
}
