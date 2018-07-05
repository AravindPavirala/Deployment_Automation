#!/bin/sh

echo "Please choose below options:"
echo "Choose 1 : Create_Directory"
echo "Choose 2 : Grant_Access"
echo "Choose 3 : Hive DDL"
echo "Choose 4 : Implement Shell Scripts"
echo "Choose 5 : Above ALL"
while :
do
  read NUM
  case $NUM in
        1)
               read -p "Enter Directory Name: " dirname
        if [[ ! -d "$dirname" ]]
        then
        echo "Creating Directory now ...."
                mkdir $dirname
                echo "$dirname Directory created"
        else
                echo "Directory $dirname already exists"
        fi
               break
               ;;
        2)
                read -p "Enter Directory Name: " dirname
                read -p "Enter Permission to be granted Example: '755 / 700 / 600' : " permission
                chmod -R -f $permission $dirname
                echo "Granted Permission $dirname "
                break
                ;;
        3)
                read -p "Enter Database Name: " Database_name
                echo "Connecting Hive DDL Beeline"
                beeline -u "jdbc:hive2://ausplcdhedge03.us.dell.com:10000/$Database_name;principal=hive/_HOST@AMER.DELL.COM"
                break
                ;;
        4)
                read -p "Enter Name of the file to be moved: " file_name
                #if [ -f /home/aravind__kumar_pavir/destination/$file_name ] ; then cd /home/aravind__kumar_pavir/destination/
                #cp $file_name "$file_name_backup.$(date +%F_%R)"
                #echo "$file_name is backup is taken" ; 
                #else 
                #echo "no" ; fi
                scp /home/aravind__kumar_pavir/source/$file_name /home/aravind__kumar_pavir/destination/
                echo "$file_name is successfully moved to target path"
                break
                ;;
        5)
                read -p "Enter Directory Name: " dirname
                if [[ ! -d "$dirname" ]]
                then
                echo "Creating Directory now ...."
                mkdir $dirname
                echo "$dirname Directory created"
                chmod -R -f 755 $dirname
                echo "Granted Permission $dirname "
                read -p "Enter Database Name: " Database_name
                echo "Connecting Hive DDL Beeline"
                beeline -u "jdbc:hive2://ausplcdhedge03.us.dell.com:10000/$Database_name;principal=hive/_HOST@AMER.DELL.COM"
                read -p "Enter Name of the file to be moved: " file_name
                scp /home/aravind__kumar_pavir/source/$file_name /home/aravind__kumar_pavir/destination/
                echo "$file_name is successfully moved to target path"
                else
                echo "Directory $dirname already exists"
                fi
                break
                ;;
  esac
done
