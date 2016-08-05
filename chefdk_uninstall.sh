# Chefdk uninstall
chef --version
  read -r -p "Do you want to uninstall? [y/N] " response
  if [[ $response =~ ^([yY][eE][sS]|[yY])$ ]]
  then
    sudo rm -rf /opt/chefdk
    cd /opt
    sudo pkgutil --forget com.getchef.pkg.chefdk
    sudo find /usr/bin -lname '/opt/chefdk/*' -delete
  else
      echo "nothing done"
  fi
  
