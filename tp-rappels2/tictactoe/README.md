
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

- [ ] implémenter `display` (`main.hs`) et tester dans le `main` sur un jeu initial
- [ ] implémenter le module `Tictactoe`, sans détection de victoire/égalité (`checkBoard`)
- [ ] terminer le `main.hs`
- [ ] implémenter la détection de victoire/égalité (`checkBoard`)
- [ ] vérifier avec les tests unitaires et avec le programme exécutable
 
