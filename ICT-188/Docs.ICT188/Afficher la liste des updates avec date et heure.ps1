# Ce script affiche la liste des updates d'une machine Windows, avec date et heure. Merci à la contribution de Daniel à ce sujet durant le test
$Session = New-Object -ComObject "Microsoft.Update.Session"
$Searcher = $Session.CreateUpdateSearcher()
$historyCount = $Searcher.GetTotalHistoryCount()
$Searcher.QueryHistory(0, $historyCount) | Select-Object Title, Date, @{name="Operation"; expression={switch($_.operation){ 1 {"Installation"}; 2 {"Uninstallation"}; 3 {"Other"}}}}
# NB: Pour activer l'autorisation de script sur un PC Windows, il faut exécuter: Set-ExecutionPolicy Unrestricted
