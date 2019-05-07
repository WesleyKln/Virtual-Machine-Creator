<img src="https://cdn-images-1.medium.com/max/800/1*FIjDPNm9zRO_ESbUiGmCXA.png" width="200px">

# Virtual Machine Creator

Ce script permet de créer une Machine Virtuelle sur Linux (base Ubuntu/Xenial64) en un seul clic ( enfin presque.. c'est plutôt deux, mais c'est tout comme :smiley:) !
> *Au cours du processus, vous pourrez choisir votre propre adresse ip, le nom du dossier synchronisé ainsi que le nom de la VM. Le script permet également de récupérer automatiquement la dernière version stable d'Adminer pour MySQL ainsi que le Normalize.css.*

#### Pré-requis :
- *VirtualBox*
- *Vagrant*

## Procédure d'installation :
- Ouvrir un terminal et se placer à la racine d'un nouveau dossier avant de lancer cette commande : `git clone https://github.com/WesleyKln/VirtualMachineCreator.git .`
- Lancer le script `VirtualMachineCreator.sh` que vous venez de récupérer avec la commande `bash VirtualMachineCreator.sh` et attendre d'avoir switché dans le terminal de la VM.
- Aller dans `/var/www/html/` et lancer le script `startInstall.sh` pour procéder à l'installation de tous les services nécessaires (Apache 2, PHP 7.2 et MySQL). Vous noterez au passage la présence dans ce même dossier du fichier PHP Adminer, un SGBD pour gérer vos Databases.
- C'est tout ! Have fun :facepunch:
