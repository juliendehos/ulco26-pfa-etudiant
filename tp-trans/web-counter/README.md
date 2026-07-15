
# web-counter

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

## Planning

- [ ] regarder le code de `Counter1` et de `cli-counter0`
- [ ] implémenter `addCounter` et gérer les touches `+` et `-` dans `cli-counter0`
- [ ] regarder le code de `View` et de `web-counter0`
- [ ] implémenter les routes `inc` et `dec` dans `web-counter0`
- [ ] implémenter `cli-counter1` avec les signatures de fonction données
- [ ] regarder le code de `web-counter1` et terminer l'implémentation
- [ ] regarder le code de `Counter2` et implémenter `addCounter`
- [ ] implémenter `cli-counter2` en utilisant `Counter2` (notamment `MonadCounter`)
- [ ] implémenter `web-counter2` en utilisant `Counter2` 
 
