## Prérequis:

- firewall_rules:

  [![Télécharger le fichier](https://github.com/user-attachments/assets/4c318b41-f48c-4751-8fa6-2265e0156ff1)](https://github.com/Popolia/firewall_rules/archive/refs/heads/main.zip)

- Extraire l'archive.

- Mise à jour bêta du .exe si le .exe ne fonctionne pas faire la manipe avec le fichier en .ps1

## comment èxécuter firewall_rules:

a. Ouvrir PowerShell en tant qu'administrateur:

    Clique sur le menu Démarrer, tape "PowerShell", puis fais un clic droit sur Windows PowerShell 
    et sélectionne Exécuter en tant qu'administrateur.

b. Autoriser l'exécution des scripts PowerShell

Par défaut, l'exécution des scripts PowerShell est désactivée. Tu dois donc modifier cette politique
avant de pouvoir exécuter le script :

powershell

`Set-ExecutionPolicy RemoteSigned`

Ensuite, tape `Y` pour confirmer.

c. Exécuter le script

voir photo (mais le fichier comme sur la photo)

![image](https://github.com/user-attachments/assets/d342cf9b-fdd0-4382-8d58-faec459a7479)

    Navigue dans le dossier Téléchargements avec la commande cd dans PowerShell :

powershell ( `C:` est la lettre du lecteur si vous c'est `D:` mettre `D:`)

`cd C:\Users\Admin\Downloads`

    Exécuter le script :

Ensuite, exécute le script en tapant :

powershell

`.\firewall_rules.ps1`

Le script va alors appliquer les règles pour autoriser les adresses IP européennes et 
bloquer les adresses IP américaines et asiatiques.

3. Vérifie les règles appliquées

Après l'exécution du script, tu peux vérifier que les règles du pare-feu sont bien en place :

    Ouvre Windows Defender Firewall dans le Panneau de configuration.

    Dans la section Règles de connexion entrantes,
    tu devrais voir les règles que tu viens de créer avec le script,
    comme "Autoriser 185.60.112.0/22" ou "Bloquer 24.105.30.0/23".


## Note:

Première : firewall_rules.ps1

`Les règles du pare-feu autorisent les adresses IP européennes,
bloquent les adresses IP américaines et asiatiques.`

classique ca etais fait en quelque minute .

l'autre pars contre :  firewall_rulesupdate.ps1  est la deuxieme  vertion , plus complexe .

**Résumé de la vertion firewall_rulesupdate.ps1 ** (la Configuration du Pare-feu pour Overwatch 2)

**Objectif **: Nous voulons configurer le pare-feu pour permettre à Overwatch 2 de fonctionner correctement ,
tout en limitant les connexions aux serveurs européens uniquement.

    **Ports utilisés : **Overwatch 2 utilise des ports spécifiques pour le jeu et pour les connexions Internet :

        Ports **TCP **(pour le jeu et les connexions HTTP/HTTPS) : 1119, 6113, 80, 443

        Ports **UDP **(pour le jeu) : 5060, 5062, 6250, 3478, 3479, 3480

    Plages IP européennes autorisées : Nous autorisons les connexions provenant des adresses IP 
    des serveurs européens de Blizzard. Ces adresses sont :

>         185.60.112.0/22
>         185.60.116.0/22
>         185.60.114.0/24
>         37.244.28.0/22

    Bloquer d'autres régions : Nous bloquons les connexions provenant des plages IP non européennes ,
    pour empêcher les connexions de régions comme l'Amérique du Nord et l'Asie.

    Vérification et mise à jour : Il est important de vérifier régulièrement les informations sur les plages IP et
    les ports pour s'assurer que la configuration reste correcte et que les connexions au jeu ne sont pas interrompues.

d'après se que j'ai vue est en se basant sur les donnés de arin en WHOIS et RDAP  ,
qui sont deux protocoles utilisés pour obtenir des informations sur les noms de domaine et les adresses IP.(ARIN = American registry for internet Number) 
pour exemple : 

185.60.112.0/22
qui est du coup  le Réseau : 185.60.112.0 - 185.60.115.255
qui est du coup
US-BLIZZARD1-20140610

Inscription
mar. 10 juin 2014 09:26:59 GMT (mardi 10 juin 2014 heure locale)

Dernière modification
mar. 26 juin 2018 07:22:43 GMT (mardi 26 juin 2018 heure locale)

Donc en therme de changement on n'est plutôt stable cars ca indique  que Blizzard qui possède cet enregistrement n'a pas eu besoin de mettre à jour ses informations ou que les informations sont toujours d'actualité.

## Pour la vertion manuel:

 Bloquer la connexion :

`Ouvrez le Pare-feu Windows avec fonctions avancées en recherchant « Pare-feu Windows » dans le menu Démarrer et en sélectionnant « Pare-feu Windows avec fonctions avancées ».`

`Accédez aux Règles de trafic entrant ou sortant selon ce que tu veux bloquer.`

`Créez une nouvelle règle : Clique sur « Nouvelle règle » et choisi « Personnalisé ».`

`Défini les conditions : Choisi « Cette IP spécifique » et entre l’adresse IP que tu souhaites bloquer.`

`Configurez l’action : Choisi « Bloquer la connexion ».`

Pour autoriser , je vais me répéter mais c'est pour etre sure que vous avez bien comprit :

    Ouvrir le Pare-feu Windows avec fonctions avancées :

        Clique sur le bouton Démarrer.
        Tape "Pare-feu Windows" dans la barre de recherche.
        Sélectionne "Pare-feu Windows avec fonctions avancées" dans les résultats.

    Accéder aux règles de trafic :

        Dans la fenêtre du Pare-feu Windows avec fonctions avancées, choisissez :

            Règles de trafic entrant (pour autoriser des connexions vers votre ordinateur).

            Règles de trafic sortant (pour autoriser des connexions sortantes vers une adresse IP externe).

    Créer une nouvelle règle :

        Clique sur Nouvelle règle dans le panneau de droite.
        Dans l’assistant de création de règle, sélectionne Personnalisé, puis clique sur Suivant.

    Définir les conditions de la règle :

        Choisis Tous les programmes ou spécifiez un programme particulier si nécessaire.
        Clique sur Suivant jusqu’à l’écran Adresse IP.

    Spécifie l'adresse IP à autoriser :

        Pour autoriser une adresse IP spécifique :

            Dans la section Adresse IP distante, choisissez Ces adresses IP spécifiques.
            Clique sur Ajouter et entrez l’adresse IP que vous souhaitez autoriser.
            Une fois que vous avez ajouté l’IP, clique sur Suivant.

    Configurer l'action :

        Sélectionne Autoriser la connexion, puis cliquez sur Suivant.

    Choisir le profil réseau :

        Sélectionne les profils (Domaine, Privé, Public) auxquels la règle doit s'appliquer, puis clique sur Suivant.

    Nommer la règle :

        Donnez un nom à la règle (par exemple, "Autoriser IP spécifique") pour la retrouver facilement.
        Cliquez sur Terminer.

Votre règle est maintenant active, et l’adresse IP spécifiée est autorisée.

