
# histogram

## Description

Calcule et affiche l'[histogramme](https://fr.wikipedia.org/wiki/Histogramme) d'un fichier de données.


## Usage

```
$ cabal run histogram
usage: <filename> <size>
```

```
$ cabal run histogram -- data/uniform.txt 60
5
**************************************
**********************************************
************************************************
*********************************************************
**********************************************************
************************************************
*****************************************************
**************************************************
**********************************************
************************************************************
14
```

```
$ cabal run histogram -- data/normal.txt 30
-6

*
*
***
******
*********
****************
******************
**************************
******************************
***************************
**************************
**********************
**************
********
*****
**
*

15
```

## Planning

- [ ] implémenter la fonction `computeHist` + vérifier avec les tests unitaires
- [ ] implémenter la fonction `displayHist` et tester dans le `main` sur `testData`
- [ ] modifier le `main` de façon à tester sur le fichier `data/normal.txt`
- [ ] implémenter `parseArgs` et terminez le `main` 

