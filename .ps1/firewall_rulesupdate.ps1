# Définir les ports utilisés par Overwatch 2
$ow2PortsTCP = @(
    1119,  # TCP pour le jeu
    6113,  # TCP pour le jeu
    80,    # TCP pour HTTP
    443    # TCP pour HTTPS
)

$ow2PortsUDP = @(
    5060,  # UDP pour le jeu
    5062,  # UDP pour le jeu
    6250,  # UDP pour le jeu
    3478,  # UDP pour le jeu
    3479,  # UDP pour le jeu
    3480   # UDP pour le jeu
)

# Liste des plages IP européennes à autoriser
$europeanIPRanges = @(
    "185.60.112.0/22",
    "185.60.116.0/22",
    "185.60.114.0/24",
    "37.244.28.0/22"
)

# Autoriser les plages IP européennes pour Overwatch 2
Write-Host "Autorisation des plages IP européennes pour Overwatch 2..."
foreach ($range in $europeanIPRanges) {
    foreach ($port in $ow2PortsTCP) {
        New-NetFirewallRule -DisplayName "Autoriser Européen TCP - Plage $range - Port $port" -Direction Inbound -RemoteAddress $range -Protocol TCP -LocalPort $port -Action Allow
    }
    foreach ($port in $ow2PortsUDP) {
        New-NetFirewallRule -DisplayName "Autoriser Européen UDP - Plage $range - Port $port" -Direction Inbound -RemoteAddress $range -Protocol UDP -LocalPort $port -Action Allow
    }
}

# Liste des plages IP à bloquer (Amérique du Nord et Asie)
$blockedIPs = @(
    "24.105.30.0/23",
    "137.221.104.0/24",
    "137.221.106.0/24",
    "137.221.105.0/24",
    "211.234.110.0/24",
    "182.162.0.0/24",
    "37.244.54.0/24"
)

# Bloquer les plages IP non européennes pour Overwatch 2
Write-Host "Blocage des plages IP non européennes pour Overwatch 2..."
foreach ($ip in $blockedIPs) {
    foreach ($port in $ow2PortsTCP + $ow2PortsUDP) {
        New-NetFirewallRule -DisplayName "Bloquer non-européen - Plage $ip - Port $port" -Direction Inbound -RemoteAddress $ip -Protocol TCP -LocalPort $port -Action Block
        New-NetFirewallRule -DisplayName "Bloquer non-européen - Plage $ip - Port $port" -Direction Inbound -RemoteAddress $ip -Protocol UDP -LocalPort $port -Action Block
    }
}

Write-Host "Les règles du pare-feu pour Overwatch 2 ont été appliquées avec succès."
