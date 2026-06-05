
# tictactoe

## Description

Implémentation du jeu [Tic-tac-toe](https://fr.wikipedia.org/wiki/Tic-tac-toe),
en Haskell et avec la bibliothèque
[vector](https://hackage.haskell.org/package/vector).


## Usage

```
$ cabal run tictactoe 

...
...
...
nb moves: 0
status: X play
move? foobar
not a move (should be: 'i j')
move? 13 37
invalid move

...
...
...
nb moves: 0
status: X play
move? 1 1

...
.X.
...
nb moves: 1
status: O play
move? 
```

## Planning

- [ ] réécrire les types Cell, Status et Game, dans le module Tictactoe
- [ ] mettre à jour les test
- [ ] mettre à jour le main
 
