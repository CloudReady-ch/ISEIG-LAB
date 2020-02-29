# Convention de nommage
https://docs.microsoft.com/en-us/azure/cloud-adoption-framework/ready/azure-best-practices/naming-and-tagging#sample-naming-convention
## Données significatives
* Object/sujet `<obj>`: Le projet, le service ou le département, l'application...
* Centre de coût `<cc>`: Pour usage rapports financiers et refacturations
* Localisation `<loc>`: Le code pays ([ISO3166-1 alpha-2](https://fr.wikipedia.org/wiki/ISO_3166-1#Table_de_codage))
* Duration: `<dur>`: La date ISO-8601 YYYY-MM-DD (Date ISO 10c) ou YYYYMMDD (Date ISO 8n)
  * La date est omise quand la durée est indéterminée, ajoutée quand une date de fin est prévue. Comme la désignation est rarement modifiable, tant pis si cela change...
  * La date de création est inutile, les metadata d'Azure fournissent cette information.

## Stratégies
Le 'container' de base est le groupe de ressources (Resource group). Mai snous avons la souscription qui va servir de 'container' de niveaux supérieurs, et les 
* Minimaliste: Le moins de groupes de ressources possibles. Cela implique de regrouper toutes les ressources sous la même délégation d'usages et de droits, dans un seul et même 'container'.
  * Attention aux ressources temporaires, à mettre tout de même dans leur même 'container' 
* Granulaire (ou atomiste): Le nombre de groupes ressources nécessaires pour regrouper le plus petit 'container' possible pour gérer un service cohérent et de ressources inter-dépendantes. Et donc, le plus grand nombre de ressources.
* intermédiaire: Adaptation selon la situation, avec un regroupement de ressources parfois dans un seul 'container', mais pas systématiquement. Souvent, on veut partir minimaliste, et in fine, on se met à créer un nouveau 'container', mais qui comprendra les mêmes groupes assignés qu'un existant, sauf quôn a pas pris le temps de le vérifier.

## exemple
* Resource group (Groupe de ressources): `<loc>`-`<obj>`-`<cc>`-rg-_identifiant_`-YYYYMMDD`
  * Pour une organisation moins mondialisée, le premier rang sera plutôt l'objet (client ou projet ou application ou service).
  * _identifiant_: sera le plus explicite possible: "wordpress_URL", "webservices_X", "shares_bidule"


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

On peut voir que les tag sont souvent redondants, avec la convention de nommage, mais cela peut permettre de détecter des erreurs et incohérences. On peut utiliser des "Policies" pour forcer la présence de certains tag à la création.