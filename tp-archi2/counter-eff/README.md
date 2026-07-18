
# counter-eff

## Description

Application qui gère un compteur. Version texte (`cli-counter`) et version web (`web-counter`).

```
$ cabal run cli-counter0

Value = 0
Enter command (+/-)?
+
Value = 1
Enter command (+/-)?
-
Value = 0
Enter command (+/-)?
p
invalid command
Value = 0
Enter command (+/-)?
q
Value = 0

$
```

Implémentation avec la bibliothèque effectul.

## Planning

- [ ] regarder le code fourni
- [ ] ajouter une fonction `addCounter` à l'effet `MonadCounter` et mettre à jour les applications
- [ ] implémenter un effet `MonadLogger` et mettre à jour l'application `Web`
 
