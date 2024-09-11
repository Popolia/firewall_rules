# Autoriser les serveurs européens
Write-Host "Autorisation des serveurs européens..."

New-NetFirewallRule -DisplayName "Autoriser 185.60.112.0/22" -Direction Inbound -RemoteAddress 185.60.112.0/22 -Action Allow
New-NetFirewallRule -DisplayName "Autoriser 185.60.116.0/22" -Direction Inbound -RemoteAddress 185.60.116.0/22 -Action Allow
New-NetFirewallRule -DisplayName "Autoriser 185.60.114.0/24" -Direction Inbound -RemoteAddress 185.60.114.0/24 -Action Allow
New-NetFirewallRule -DisplayName "Autoriser 37.244.28.0/22" -Direction Inbound -RemoteAddress 37.244.28.0/22 -Action Allow

# Bloquer les serveurs américains
Write-Host "Blocage des serveurs américains..."

New-NetFirewallRule -DisplayName "Bloquer 24.105.30.0/23" -Direction Inbound -RemoteAddress 24.105.30.0/23 -Action Block
New-NetFirewallRule -DisplayName "Bloquer 137.221.104.0/24" -Direction Inbound -RemoteAddress 137.221.104.0/24 -Action Block
New-NetFirewallRule -DisplayName "Bloquer 137.221.106.0/24" -Direction Inbound -RemoteAddress 137.221.106.0/24 -Action Block
New-NetFirewallRule -DisplayName "Bloquer 137.221.105.0/24" -Direction Inbound -RemoteAddress 137.221.105.0/24 -Action Block

# Bloquer les serveurs asiatiques
Write-Host "Blocage des serveurs asiatiques..."

New-NetFirewallRule -DisplayName "Bloquer 211.234.110.0/24" -Direction Inbound -RemoteAddress 211.234.110.0/24 -Action Block
New-NetFirewallRule -DisplayName "Bloquer 182.162.0.0/24" -Direction Inbound -RemoteAddress 182.162.0.0/24 -Action Block
New-NetFirewallRule -DisplayName "Bloquer 37.244.54.0/24" -Direction Inbound -RemoteAddress 37.244.54.0/24 -Action Block

Write-Host "Les règles du pare-feu ont été appliquées avec succès."
