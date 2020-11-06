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

echo ""
echo "Setup server using
1. Mojang server
2. Spigot server
Choice: "
read choice
if [[ $choice == 1 ]]
then
	echo "You have chosen to install Mojang server"
	echo "Enter version: "
	read version
	echo "$version"
	if [[ $version == '1.16.4' ]]
	then
		url="https://launcher.mojang.com/v1/objects/35139deedbd5182953cf1caa23835da59ca3d7cd/server.jar"
	elif [[ $version == '1.16.3' ]]
	then
		url="https://launcher.mojang.com/v1/objects/f02f4473dbf152c23d7d484952121db0b36698cb/server.jar"
	elif [[ $version == '1.16.2' ]]
	then
		url="https://launcher.mojang.com/v1/objects/c5f6fb23c3876461d46ec380421e42b289789530/server.jar"
	elif [[ $version == '1.16.1' ]]
	then
		url="https://launcher.mojang.com/v1/objects/a412fd69db1f81db3f511c1463fd304675244077/server.jar"
	elif [[ $version == '1.16' ]]
	then
		url="https://launcher.mojang.com/v1/objects/a0d03225615ba897619220e256a266cb33a44b6b/server.jar"
	elif [[ $version == '1.15.2' ]]
	then
		url="https://launcher.mojang.com/v1/objects/bb2b6b1aefcd70dfd1892149ac3a215f6c636b07/server.jar"
	elif [[ $version == '1.15.1' ]]
	then
		url="https://launcher.mojang.com/v1/objects/4d1826eebac84847c71a77f9349cc22afd0cf0a1/server.jar"
	elif [[ $version == '1.15' ]]
	then
		url="https://launcher.mojang.com/v1/objects/e9f105b3c5c7e85c7b445249a93362a22f62442d/server.jar"
	elif [[ $version == '1.14.4' ]]
	then
		url="https://launcher.mojang.com/v1/objects/3dc3d84a581f14691199cf6831b71ed1296a9fdf/server.jar"
	elif [[ $version == '1.14.3' ]]
	then
		url="https://launcher.mojang.com/v1/objects/d0d0fe2b1dc6ab4c65554cb734270872b72dadd6/server.jar"
	elif [[ $version == '1.14.2' ]]
	then
		url="https://launcher.mojang.com/v1/objects/808be3869e2ca6b62378f9f4b33c946621620019/server.jar"
	elif [[ $version == '1.14.1' ]]
	then
		url="https://launcher.mojang.com/v1/objects/ed76d597a44c5266be2a7fcd77a8270f1f0bc118/server.jar"
	elif [[ $version == '1.14' ]]
	then
		url="https://launcher.mojang.com/v1/objects/f1a0073671057f01aa843443fef34330281333ce/server.jar"
	elif [[ $version == '1.13.2' ]]
	then
		url="https://launcher.mojang.com/v1/objects/3737db93722a9e39eeada7c27e7aca28b144ffa7/server.jar"
	elif [[ $version == '1.13.1' ]]
	then
		url="https://launcher.mojang.com/v1/objects/fe123682e9cb30031eae351764f653500b7396c9/server.jar"
	elif [[ $version == '1.13' ]]
	then
		url="https://launcher.mojang.com/v1/objects/d0caafb8438ebd206f99930cfaecfa6c9a13dca0/server.jar"
	elif [[ $version == '1.12.2' ]]
	then
		url="https://launcher.mojang.com/v1/objects/886945bfb2b978778c3a0288fd7fab09d315b25f/server.jar"
	elif [[ $version == '1.12.1' ]]
	then
		url="https://launcher.mojang.com/v1/objects/561c7b2d54bae80cc06b05d950633a9ac95da816/server.jar"
	elif [[ $version == '1.12' ]]
	then
		url="https://launcher.mojang.com/v1/objects/8494e844e911ea0d63878f64da9dcc21f53a3463/server.jar"
	elif [[ $version == '1.11.2' ]]
	then
		url="https://launcher.mojang.com/v1/objects/f00c294a1576e03fddcac777c3cf4c7d404c4ba4/server.jar"
	elif [[ $version == '1.11.1' ]]
	then
		url="https://launcher.mojang.com/v1/objects/1f97bd101e508d7b52b3d6a7879223b000b5eba0/server.jar"
	elif [[ $version == '1.11' ]]
	then
		url="https://launcher.mojang.com/v1/objects/48820c84cb1ed502cb5b2fe23b8153d5e4fa61c0/server.jar"
	elif [[ $version == '1.10.2' ]]
	then
		url="https://launcher.mojang.com/v1/objects/3d501b23df53c548254f5e3f66492d178a48db63/server.jar"
	elif [[ $version == '1.10.1' ]]
	then
		url="https://launcher.mojang.com/v1/objects/cb4c6f9f51a845b09a8861cdbe0eea3ff6996dee/server.jar"
	elif [[ $version == '1.10' ]]
	then
		url="https://launcher.mojang.com/v1/objects/a96617ffdf5dabbb718ab11a9a68e50545fc5bee/server.jar"
	else
		echo "You have entered an invalid entry, or a version less than 1.10. Please enter a version above 1.9."
		echo "Aborting"
		exit
	fi
	echo "$url"
	jar="server.jar"
else
	echo "You have chosen to install Spigot 1.16.4 server"
	url="https://bit.ly/3k3gXXh"
	jar="spigot.jar"
fi

echo "Enter the name of the server: "
read dir
echo "Are you setting up a custom map? (y/n): "
read custom

mkdir $dir
cd $dir

wget -O $jar $url

echo ""
echo "Initialising server settings... "
java -jar $jar --initSettings >/dev/null
echo "By changing the setting below to TRUE you are indicating your agreement to our EULA (https://account.mojang.com/documents/minecraft_eula)."
sed -i "s/eula=false/eula=true/g" eula.txt
echo "eula=false->true"
sed -i "s/online-mode=true/online-mode=false/g" server.properties
echo "online-mode=true->false"
sed -i "s/snooper-enabled=true/snooper-enabled=false/g" server.properties
if [[ $custom == 'y' ]]
then
	sed -i "s/enable-command-block=false/enable-command-block=true/g" server.properties
fi
echo ""
echo "Server setup complete. run by issuing the command: "
echo "java -jar -Xms512M -Xmx2G -XX:+UseG1GC -jar $jar --nogui"