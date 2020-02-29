# Convention de nommage
https://docs.microsoft.com/en-us/azure/cloud-adoption-framework/ready/azure-best-practices/naming-and-tagging#sample-naming-convention
## Données significatives
* Object/sujet `<obj>`: Le projet, le service ou le département, l'application...
* Centre de coût `<cc>`: Pour usage rapports financiers et refacturations
* Localisation `<loc>`: Le code pays ([ISO3166-1 alpha-2](https://fr.wikipedia.org/wiki/ISO_3166-1#Table_de_codage)) 

## exemple
* Ressource group: `<loc>`-`<obj>`-`<cc>`-rg-_identifiant_
  * Pour une organisation moins mondialisée, le premier rang sera plutôt l'objet (client ou projet ou application ou service).

# Convention pour les TAGs
https://docs.microsoft.com/en-us/azure/cloud-adoption-framework/ready/azure-best-practices/naming-and-tagging#metadata-tags
* Tag=loc: Localisation, on peut reprendre le même code ISO-2, et ajouter la commune, si services localisés (+ "-`<Commune>`")
  * si les objets concernent un espace inter-nations, ajouter un codage région-zones: 
  * digital ex. cf. https://www.bfs.admin.ch/bfs/fr/home/bases-statistiques/stgb.assetdetail.7626604.html
  * code M49: https://unstats.un.org/unsd/methodology/m49/
* Tag=cc: Centres de coûts (le mandant)
  * interne et souvent existant dans l'organisation
* Tag=obj: idem
* Tag=resp: identifiant du service, département ou de la personne responsable, décideuse pour la ressource concernée
* Tag=sup: identifiant du service, département ou de la personne responsable du support technique, des SLAs, à avertir en cas de problèmes (souvent le support niveau 2)
* Tag=sd: identifiant du service desk qui assure l'assistance de premier niveau, en pensant aux hotlines rotatives 24/7 (en 3x8h) et donc une identification unique pour un groupe de multiples hotlines.
* Tag= : non limitatif.

On peut voir que les tag sont souvent redondants, avec la convention de nommage, mais cela peut permettre de distinguer des
