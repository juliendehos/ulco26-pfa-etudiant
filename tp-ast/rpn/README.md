
# rpn

## Description

Petite calculatrice en [Notation polonaise
inverse](https://fr.wikipedia.org/wiki/Notation_polonaise_inverse) (nombres
réels, additions, multiplications, logarithmes).

Lit une expression, l'évalue et la convertit en code
[Lisp](https://fr.wikipedia.org/wiki/Lisp).

```
$ cabal run

> 11 10 +
eval: 21.0
lisp: (+ 11.0 10.0)

> 11 10 + 2 * log
eval: 3.7376696182833684
lisp: (log (* (+ 11.0 10.0) 2.0))

> 

$
```

## Planning

- [ ] implémenter un type Expr
- [ ] implémenter le module Eval + tests unitaires
- [ ] compléter le module Parse
- [ ] implémenter le main
- [ ] implémenter le module Lisp + tests unitaires + main

