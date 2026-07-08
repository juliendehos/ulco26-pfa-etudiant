
# guess

## Description

Implémente un jeu où l'on doit deviner un nombre entre 1 et 100, avec un nombre
d'essais limité.

Utilise une implémentation perso de `StateT` et `MonadState`, mais similaires
aux implémentations des bibliothèques `transformers` et `mtl`.

## Planning

- [ ] regarder les implémentations fournies de `StateT` et `MonadState`
- [ ] regarder et tester `guess0`
- [ ] écrire une version `guess1`, en implémentant la fonction `playMove` avec un `State` 
- [ ] écrire une version `guess2`, en implémentant la fonction `playMove` avec un `StateT` 
- [ ] écrire une version `guess3`, en implémentant la fonction `playMove` avec un `MonadState` 
- [ ] tester `guess3` avec une autre pile de monades (par exemple avec un `IdentityT`)

