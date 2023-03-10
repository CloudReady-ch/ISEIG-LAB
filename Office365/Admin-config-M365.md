# Installation et configurations pour M365
## Exchange
https://admin.exchange.microsoft.com/
### Activer/désactiver l'affichage GAL (Global Address List)
Pour une école, ou des utilisateurs temporaires, c'est mieux de désactiver l'affichage de tous les participants, surtout que cela expose publiquement (en interne) des prénoms et noms, éventuelles adresses, qui sont des données personnelles soumises à GDRP ou LPD (lois protection des données UE et CH). Il est possible de modifier cette option pour chaque Groupe ou Mailboxes, mais 
* Ouvrir "Mailboxes": https://admin.exchange.microsoft.com/#/mailboxes  
![GAL hide unhide step1.jpg](https://github.com/CloudReady-ch/ISEIG-LAB/blob/master/Office365/pictures/GAL%20hide%20unhide%20step1.jpg)
* Sélectionner "toutes" et décocher celles à conserver affichées dans la GAL
![GAL hide unhide step2.jpg](https://github.com/CloudReady-ch/ISEIG-LAB/blob/master/Office365/pictures/GAL%20hide%20unhide%20step2.jpg)
* Activer l'option "Hide"
* Pour les groupes, il faut faire un par un:
![GAL hide hide groups.jpg](https://github.com/CloudReady-ch/ISEIG-LAB/blob/master/Office365/pictures/GAL hide hide groups.jpg)
Option alternative: Créer un script powershell: 
> Set-GlobalAddressList -Identity <GALIdentity>] [-Name <Name>] [<Precanned recipient filter | Custom recipient filter>]

## Education
### SDS
* https://docs.microsoft.com/fr-fr/microsoftteams/remote-learning-edu
  * https://github.com/CloudReady-ch/ISEIG-LAB/blob/master/Office365/SDS%20School%20Data%20Sync.pdf

## Teams
* https://github.com/CloudReady-ch/QuickLearn/blob/master/Microsoft/Teams/x.Custom-Teams.md
