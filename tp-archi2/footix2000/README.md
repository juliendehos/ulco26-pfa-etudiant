
# footix2000

## Description

Une application qui fournit quelques statistiques sur les coupes du
monde de football, via une page web et une API.

Page web :

    - liste des pays avec leur nombre de victoires
    - liste des tournois avec leur vainqueur

API :

    - liste des pays
    - liste des tournois gagnés par un pays donné


## Planning

- [ ] implémenter partiellement l'effet `Db` (`DbGetTourmanents` et `DbReset`),
  ainsi que son interpréteur, le programme `footix2000-init`et l'affichage web
  des tournois (penser à mettre des messages de log).
- [ ] implémenter `DbGetCountries` et `ApiGetCountries` (+ interpréteur et serveur web)
- [ ] implémenter `DbGetWins` et `ApiGetWins` (+ interpréteur et serveur web)
- [ ] implémenter `DbGetNbWins` (+ interpréteur et serveur web)


## Sources

- https://github.com/jfjelstul/worldcup
- https://datahub.io/football/worldcup
 
