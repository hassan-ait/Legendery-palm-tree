# Definer katalogen som skal søkes i
$mappe = "Oppgave 3"

# Definer filtype .txt og ord "Sommer"
$Filtype = "*.txt"
$Ord = "Sommer"

# Finn alle filer i katalogen og undermapper som matcher filtypen
$Filer = Get-ChildItem -Path $mappe -Recurse -Filter $FilType

# Filtrer filene basert på  ord "sommer" i innholdet
$resultatFiler = $filer | Where-Object {
    Select-String -Path $_.FullName -Pattern $Ord
}

# Tell antall filer som inneholder ordet "sommer"
$antallfiler = $resultatFiler.Count


# Skriv ut resultatene
Write-Host -ForegroundColor Green "Antall filer som innholder ord'$Ord' og filtypen '$filType': $antallfiler"
Write-Host "Filer":
$resultatFiler | ForEach-Object { Write-Host $_.FullName }



