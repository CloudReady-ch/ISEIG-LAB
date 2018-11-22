# Gestion des groupes, des droits et des utilisateurs sur les ressources (Dossiers ou fichiers)
**DRAFT NON FINI**
## Notions
### Utilisateurs (users)
Caractérisé par son identifiant, associé (ou pas) à un mot de passe, est la représentation numérique de l'usager d'une ressource informatique.
L'identifiant doit être unique et peut être : 
* un login, associé au domaine qui comprend ce login
* un email, incluant aussi le nom du domaine, mais sous sa forme internet
* 
```Batchfile
domaine\userlogin
email@domaine.ch
+41793092886
```
Ces 3 formes peuvent cohabiter 

## Les outils
### Windows
* ADUC = Active Directory User & Computers

## Exercice Windows
### Créer un utilisateur et lui créer un dossier privé.
Depuis un dossier sur 
1. Créer un utilisateur (Marcel)
2. Créer un dossier dans la racine du disque C (Dossier_Marcel)
3. Créer un groupe qui inclut le nouvel utilisateur (gp_Marcel)
4. Donner tous les droits à ce groupe au nouveau dossier et supprimer tous les autres droits.
5. Se connecter (Marcel) et accéder au dossier
