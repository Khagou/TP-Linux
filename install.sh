set -x

cat /etc/os-release | grep debian

if [[ $? -eq 1 ]]; then
# Installation Python + MariaBD
echo "Install RED HAT"
yum groupinstall "Development tools" -y
yum install wget -y

wget https://downloads.mariadb.com/MariaDB/mariadb_repo_setup
chmod +x mariadb_repo_setup
./mariadb_repo_setup

yum install python3-devel -y
yum install MariaDB-devel -y

yum install epel-release -y
yum install MariaDB-server -y 
pip3 install mariadb==1.0.11 

rm -f mariadb_repo_setup

systemctl start mariadb.service

else

# Installation Python + MariaBD
echo "install DEBIAN"
sudo apt install gcc -y
sudo apt install openssl -y
sudo apt install python3-dev -y 
sudo apt install Mariadb-server -y 
sudo apt install libmariadb3 libmariadb-dev -y
sudo apt install python3-pip -y
sudo pip3 install mariadb==1.0.11 

sudo systemctl start mariadb.service

fi

# Téléchargement du projet
cd /root/
mkdir temp
cd temp/
wget --no-check-certificate 'https://docs.google.com/uc?export=download&id=1v-6MUPYpwEiiwxMAukpC4CPfMoGKeY54' -O tp-sql.tar.gz
tar zxf tp-sql.tar.gz --directory $HOME
cd

#configuration mariadb
#Construction de la bdd
mysql < tp-sql/create_structure.sql

#Alimentation données
#table machines 
grep -v '^[[:space:]]*$' tp-sql/app-python/machines.txt > $HOME/temp/newfile.txt

mysql parc_informatique -e "load data local infile 'temp/newfile.txt' into table machines columns TERMINATED BY ',' lines terminated by '\n' (nom, ip, nombre_cpu, taille_ram, @dummy, os, version);"

#table applications
mysql parc_informatique -e "load data local infile 'tp-sql/app-python/applications.txt' into table applications columns TERMINATED BY ',' (nom, editeur, version);"

#CRéation utilisateur
mysql -e "CREATE USER 'user'@'localhost' IDENTIFIED BY 'user';"
mysql -e "GRANT ALL PRIVILEGES ON parc_informatique.* TO 'user'@'localhost'  WITH GRANT OPTION;"

#modification du fichier config.py
cd tp-sql/app-python
sed -i 's/admin/user/g' config.py
sed -i "s/: 'password'/: 'user'/g" config.py
cd

#creation de user local sans pwd
useradd user
passwd -d user

#Copier le dossier dans le rép : BIN
cp -R tp-sql /bin

#connexion user et lancement apply
su user

#executer le programme manuellement
python3 /bin/tp-sql/app-python/main.py

fi