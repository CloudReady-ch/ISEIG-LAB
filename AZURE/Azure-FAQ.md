# FAQ Azure

# Open questions
## ADconnect
### Peut-on utiliser la même machine avec le service ADconnect pour connecter les 2 Cloud Azure et Office365 ?
* Bon en fait, M365 (ex O365) utilise ADD pour ses propres groupes (Azure Active Directory) et donc, ADconnect 
* Problème: Si tu espères pouvoir réutiliser tes groupes AD pour créer des équipes Teams, va falloir faire un script Powershell depuis un export de tes groupes AD, car ADconect ne va pas créer des groupes compatibles avec Teams (sauf erreur).
## Office 365
### Peux-t-on synchroniser 365 users-groups avec Azure AD ?
Sans passer par un double ADconect depuis un On-Premise AD
* 
### PowerShell pour office 365 ?
* [Manage Office 365 with Office 365 PowerShell](https://docs.microsoft.com/en-us/office365/enterprise/powershell/manage-office-365-with-office-365-powershell)

