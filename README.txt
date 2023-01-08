Description de l'application :

L'application est une base de données MariaDB en Python qui permet de recenser les ordinateurs et disques appartenant à un parc informatique, ainsi que les applications utilisées sur l'ensemble du parc.

Description des serveurs :

Les serveurs tournent sous CentOS et Debian, et sont équipés d'un serveur MariaDB pour le stockage de la base de données.

Comment utiliser ce script pour installer l'application sur les machines virtuelles :

Avant de procéder à l'installation, vérifiez la version de votre système (RedHat ou Debian) car l'installation est légèrement différente sous Debian. 
Pour ce faire, exécutez la commande suivante : cat /etc/os-release. 
Sous Debian, connectez vous en root avec la commande : sudo -s
Sous RedHat, avec un compte utilisateur avec des privilèges superviseur (le compte root par défaut)

Donnez les droits d'execution sur le fichier script : chmod +x nom_script

Ensuite, lancez le script d'installation : sh install.sh.
