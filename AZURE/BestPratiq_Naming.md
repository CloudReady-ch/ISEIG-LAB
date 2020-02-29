# Convention de nommage
Contrairement aux recommandations de Microsoft, ne pas utiliser le préfixe répétant le type de l'objet au début (mais à la fin). Quel est la première clef de recherche et de sélection dans votre organisation?
* Multinationales: Le pays et la ville...
* PME locales: Le nom du client, ou du département, ou du projet...

Utiliser comme premier code le déterminant le plus significatif, puis le suivant.
https://docs.microsoft.com/en-us/azure/cloud-adoption-framework/ready/azure-best-practices/naming-and-tagging#sample-naming-convention
## Données significatives
* Object/sujet `<obj>`: Le projet, le service ou le département, l'application...
* Centre de coût `<cc>`: Pour usage rapports financiers et refacturations
* Localisation `<loc>`: Le code pays ([ISO3166-1 alpha-2](https://fr.wikipedia.org/wiki/ISO_3166-1#Table_de_codage))
* Duration: `<dur>`: La date ISO-8601 YYYY-MM-DD (Date ISO 10c) ou YYYYMMDD (Date ISO 8n)
  * La date est omise quand la durée est indéterminée, ajoutée quand une date de fin est prévue. Comme la désignation est rarement modifiable, tant pis si cela change (prévoir plus large).
  * La date de création est inutile, les metadata d'Azure fournissent cette information.
  * La date de début d'utilisation prévue, sera dans un Tag (étiquette).

## Stratégies
Le 'container' de base est le groupe de ressources (Resource group). Mais nous avons la souscription qui va servir de 'container' de niveau supérieur, et encore les groupes de gestion ([Management groups](https://docs.microsoft.com/en-us/azure/governance/management-groups/overview)) qui peuvent regrouper des souscriptions, avec héritage hiérarchique cette fois.
* **Minimaliste**: Le moins de groupes de ressources possibles. Cela implique de regrouper toutes les ressources sous la même délégation d'usages et de droits, dans un seul et même 'container'.
  * Attention aux ressources temporaires, à mettre tout de même dans leur même 'container' 
* **Granulaire** (ou atomiste): Le nombre de groupes ressources nécessaires pour regrouper le plus petit 'container' possible pour gérer un service cohérent et de ressources inter-dépendantes. Et donc, le plus grand nombre de ressources.
* **intermédiaire**: Adaptation selon la situation, avec un regroupement de ressources parfois dans un seul 'container', mais pas systématiquement. Souvent, on veut partir minimaliste, et in fine, on se met à créer un nouveau 'container', mais qui comprendra les mêmes groupes assignés qu'un existant, sauf qu'on a pas pris le temps de le vérifier, et donc on perd un peu de minimalisme, mais c'est pas grave :)

## exemple
* **Resource group** (Groupe de ressources): `<loc>`-`<obj>`-`<cc>`-rg-_identifiant_`-YYYYMMDD`
  * Pour une organisation moins mondialisée, le premier rang sera plutôt l'objet (client ou projet ou application ou service).
  * _identifiant_: sera le plus explicite possible: "wordpress_URL", "webservices_X", "shares_bidule". Pour une stratégie minimaliste, ce sera plus le nom de l'équipe utilisatrice, que des services inclus.
    * Les espaces sont en réalité tolérés, mais pour faciliter l'écriture des scripts, les bannir!
    * Il est possible de remplacer le _ par MajMin pour SéparerLesMots
    * cf. https://docs.microsoft.com/fr-ch/azure/azure-resource-manager/management/resource-name-rules
  * La date de fin prévue (la plus probable) pour cette ressource, si elle est limitée dans le temps (durée d'un projet). 
    * C'est mieux de prendre de la marge pour la date de fin, car on ne peut généralement pas renommer. 
    * On peut ensuite scripter la détection des ressources non supprimées, passées de dates...
* **Virtual Network**: `<loc>`-vnet-_identifiant_
  * _identifiant_: Le réseau IP_CIDR, ex. 10.0.0.0_16
  * Le réseau étant utilisé par multiples objets et centres de couts, on peut omettre souvent `-`<obj>`-`<cc>`
  * `-YYYYMMDD` est souvent absent aussi
* **Subnet**: `<loc>`-snet-_identifiant_
  * _identifiant_: Le réseau IP_CIDR, ex. 10.0.0.0_24
* Pour les autres objets, réutiliser les autres "préfixes" prévus: https://docs.microsoft.com/en-us/azure/cloud-adoption-framework/ready/azure-best-practices/naming-and-tagging#recommended-resource-type-prefixes
  * Il est judicieux de répéter le type de l'objet dans le nom, pour les scripts et exports/rapports textes.
  * Simplement, l'utiliser en postfix et non préfix, mais le conserver devant la date de fin optionnelle.

# Convention pour les TAGs
## Format JSON (tuples)
Les tags sont des étiquettes saisies avec une paire de valeurs (tuple?):
* La première valeur est le nom de l'étiquette, et nous ne sommes plus censé en créer de nouvelles, sauf au début.
* La seconde valeur est le contenu de cette étiquette. NB. Il est donc possible de saisir plusieurs fois la même étiquette, avec des valeurs différentes (par exemple, une ressources utilisée par 2 localisations)

https://docs.microsoft.com/en-us/azure/cloud-adoption-framework/ready/azure-best-practices/naming-and-tagging#metadata-tags
## Exemple d'étiquettes (tags)
Comme le nom de l'étiquette est sélectionné dans une liste, on peut expliciter via une désignation plus complète, mais je propose les abréviations suivantes franco-anglaises compatibles:
* Tag=**loc**: Localisation, on peut reprendre le même code ISO-2, et ajouter la commune, si services localisés (+ "-`<Commune>`")
  * si les objets concernent un espace inter-nations, ajouter un codage région-zones: 
  * digital ex. cf. https://www.bfs.admin.ch/bfs/fr/home/bases-statistiques/stgb.assetdetail.7626604.html
  * code M49: https://unstats.un.org/unsd/methodology/m49/
* Tag=**cc**: Centres de coûts (le mandant)
  * interne et souvent existant dans l'organisation
* Tag=**obj**: idem
* Tag=**resp**: identifiant du service, département ou de la personne responsable, décideuse pour la ressource concernée
* Tag=**sup**: identifiant du service, département ou de la personne responsable du support technique, des SLAs, à avertir en cas de problèmes (souvent le support niveau 2)
* Tag=**sd**: identifiant du service desk qui assure l'assistance de premier niveau, en pensant aux hotlines rotatives 24/7 (en 3x8h) et donc via une identification unique pour un groupe de multiples hotlines (sur les 3 continents).
* Tag=**ed**: End Date - la date de fin au format YYYYMMDD ou bien YYYY-MM-DD c'est plus explicite.
* Tag=**sd**: Start Date - le début prévu d'utilisation de la ressource (et non la date de sa création)
* Tag= : non limitatif...

On peut voir que les tag sont souvent redondants avec la convention de nommage, mais cela peut permettre de détecter des erreurs et incohérences. On peut utiliser des "Policies" pour forcer la présence de certains tag à la création (Centre de cout par ex.)
