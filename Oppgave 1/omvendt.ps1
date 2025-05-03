try {
    # Les innholdet fra "file.txt" i mappen "Oppgave 1"
    $filSti = "oppgave 1/file.txt"
    # Sjekk om filen eksisterer
    if (Test-Path $filSti) {
        $inndataTekst = Get-Content $filSti

        # Sjekk om strengen er tom eller inneholder bare hvite mellomrom
       if (-not [string]::IsNullOrWhiteSpace($inndataTekst))
                 {
            # Omvend strengen og vis i tabellformat
            $tabell = @()
            $inndataTekst | ForEach-Object {
                $chars = $_.ToCharArray()
                [array]::Reverse($chars)
                $omvendtTekst = -join $chars
                $tabell  += [PSCustomObject]@{
                    "Opprinnelig tekst" = $_
                    "Omvendt tekst"     = $omvendtTekst
                }
            }
            $tabell  | Format-Table -AutoSize        

        } 
        else {
            Write-Host -ForegroundColor Red "Filen 'file.txt' er tom. Vennligst legg til data i filen og prøv igjen."
        }

    } 
    else {
        Write-Host -ForegroundColor Red "Filen 'file.txt' ble ikke funnet i mappen 'Oppgave 1'. Vennligst sjekk at filen eksisterer og prøv igjen."
    }

}

 catch
 
 {
    Write-Error  "En feil oppstod: $($_.Exception.Message)"
}
