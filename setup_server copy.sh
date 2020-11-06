#!/bin/bash
echo "Checking if java is installed: "
check=$(dpkg-query -W -f='${Status}' openjdk-8-jre-headless 2>/dev/null | grep -c "ok installed")

if [[ $check -eq 1 ]]
then
	echo "Java is installed. Proceeding."
else
	echo "Java is NOT installed. Installing java"
	sudo apt-get -y install openjdk-8-jre-headless
fi

echo "Setup server using
1. Mojang server
2. Spigot server
Choice: "
read choice
if [[ $choice == 1 ]]
then
	echo "You have chosen to install Mojang server"
	wget -O server.jar https://bit.ly/351A5AC
	echo ""
	echo "Initialising server settings... "
	java -jar server.jar --initSettings >/dev/null
	echo "By changing the setting below to TRUE you are indicating your agreement to our EULA (https://account.mojang.com/documents/minecraft_eula)."
	sed -i "s/eula=false/eula=true/g" eula.txt
	echo "eula=false->true"
	sed -i "s/online-mode=true/online-mode=false/g" server.properties
	echo "online-mode changed from true to false"
	echo ""
	echo "Server setup complete. run by issuing the command: "
	echo "java -jar -Xms512M -Xmx2G -XX:+UseG1GC -jar server.jar --nogui"
else
	echo "You have chosen to install Spigot server"
	wget -O spigot.jar https://bit.ly/3k3gXXh
	echo ""
	echo "Initialising server settings... "
	java -jar spigot.jar >/dev/null
	echo "By changing the setting below to TRUE you are indicating your agreement to our EULA (https://account.mojang.com/documents/minecraft_eula)."
	sed -i "s/eula=false/eula=true/g" eula.txt
	echo "eula=false->true"
	sed -i "s/online-mode=true/online-mode=false/g" server.properties
	echo "online-mode changed from true to false"
	echo ""
	echo "Server setup complete. run by issuing the command: "
	echo "java -jar -Xms512M -Xmx2G -XX:+UseG1GC -jar spigot.jar --nogui"
fi
