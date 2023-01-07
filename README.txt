Description de l'application :
    L'application est une application de base de donnée permettant de recensenser les ordinateurs et disques appartenant
    au parc informatique. Il recense également les applications utilisées sur l'ensemble du parc informatique.

Description des serveurs (quels serveurs, que contiennent t’ils, à quoi servent t’ils,
quels sont les flux réseaux que l’on utilise sur ces serveurs) :
    Le serveur tourne sur un OS centos 7, sur le quel est installé un serveur MariaDB qui permet le stockage de la base
    de données.

Comment utiliser ces scripts pour créer les serveurs dans des machines virtuelles
(partez du principe qu’un hyperviseur est déjà installé, et la / les VM créés et
fonctionnelles dessus) :
    Afin de lancer l'ensemble des scripts nécessaire à l'installation des outis il suffit d'exectuter le script install.sh
    à l'aide de la commande :
        $ sh install.sh
    Celui-ci s'occupera de mettre à jour le système et lancera un par un les scripts nécessaire a l'installation de chaque outils.


/!\ Installation /!\

Avant de procéder à l'installation vérifiez la version de votre système l'installation étant légérement 
différente sous DEBIAN et RED HAT.


