
# compute

## Description

Exemple d'utilisation des transformateurs de monade dans un petit programme de
calculs.

```
>>> runMaybeT $ myCompute 441
Just (42.0,441.0)

>>> runMaybeT $ myCompute (-4)
mySqrt: -4.0 < 0
Nothing
```

## Planning

- [ ] compute1 : réécrire `safeSqrt` et `safeMul2` avec les fonctions de `Monad` et de
  `MonadPlus` (à la place des `Just` et des `Nothing`)

- [ ] compute2 : réécrire compute1 mais avec le transformateur `MaybeT` et en
  affichant un message d'erreur dans `safeSqrt`

