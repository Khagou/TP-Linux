Description de l'application :
    L'application est une application de base de donnée SQL en Python permettant de recensenser les ordinateurs et disques appartenant à un parc informatique. Il recense également les applications utilisées sur l'ensemble du parc.

Description des serveurs (quels serveurs, que contiennent t’ils, à quoi servent t’ils, quels sont les flux réseaux que l’on utilise sur ces serveurs) :
    Les serveurs tournent sous centos et debian, sur les quels est installé un serveur MariaDB qui permet le stockage de la base de données.

Comment utiliser ces scripts pour créer les serveurs dans des machines virtuelles (partez du principe qu’un hyperviseur est déjà installé, et la / les VM créés et fonctionnelles dessus) :
    Avant de procéder à l'installation vérifiez la version de votre système l'installation étant légérement 
    différente sous DEBIAN.

    1) afin de savoir quel système vous utilisez:
        cat /etc/os-release
    2) /!\ sous Debian il faut ce connecter en root avant de lancer le script:
        sudo -s
    3) lancez ensuite le scrypt d'installation (sous CentOS vous pouvez directement lancer l'installation en sautant l'étape précédente pour ce connecter en root):
        sh install.sh





