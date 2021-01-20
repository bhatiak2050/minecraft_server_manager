#!/bin/bash

function edit_settings {
	echo "By changing the setting below to TRUE you are indicating your agreement to our EULA (https://account.mojang.com/documents/minecraft_eula)."
	sed -i "s/eula=false/eula=true/g" eula.txt
	# sed -i "s/online-mode=true/online-mode=false/g" server.properties
	sed -i "s/allow-flight=false/allow-flight=true/g" server.properties
	sed -i "s/snooper-enabled=true/snooper-enabled=false/g" server.properties
	if [[ $custom == 'y' ]]
	then
		sed -i "s/enable-command-block=false/enable-command-block=true/g" server.properties
	fi	
}

function install_normal {
	mkdir $dir
	cd $dir
	wget -O $jar $url
	echo ""
	echo "Initialising server settings... "
	java -jar $jar >/dev/null
	edit_settings
}

if [[ $1 == cli ]]
then
	echo "Usage: <Server type> <Version> <Name> <Custom map> [<Mod loader>]"
	echo "Server name will be the name of the directory where server will be installed."
	echo "Do not provide Mod loader argument for Spigot or paper servers."
	echo "Server type options: 1. Mojang, 2. Spigot, 3. Paper."
	echo "Mod loader options: 1. Forge, 2. Fabric, 3. Cancel"
fi

# Check if java is installed, if not install it
echo "Checking if java is installed: "
check=$(dpkg-query -W -f='${Status}' openjdk-11-jre-headless 2>/dev/null | grep -c "ok installed")

if [[ $check -eq 1 ]]
then
	echo "Java is installed. Proceeding."
else
	echo "Java is NOT installed. Installing java"
	sudo apt-get -y install openjdk-11-jre-headless
fi

# Selection of server type and version
if [[ $1 == "" ]]
then
	echo ""
	echo "Setup server using
1. Mojang server
2. Spigot server
3. Paper server
Choice: "
	read choice
else
	choice=$1
fi

if [[ $choice == 1 ]]
then
	echo "You have chosen to install Mojang server"
	if [[ $2 == "" ]]
	then
		echo "Enter version: "
		read version
	else
		version=$2
	fi

	if [[ $version == '1.16.5' ]]
	then
		url="https://launcher.mojang.com/v1/objects/1b557e7b033b583cd9f66746b7a9ab1ec1673ced/server.jar"
	elif [[ $version == '1.16.4' ]]
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
	elif [[ $version == '1.8.9' ]]
	then
		url="https://launcher.mojang.com/v1/objects/b58b2ceb36e01bcd8dbf49c8fb66c55a9f0676cd/server.jar"		
	else
		echo "You have entered an invalid entry, or a version less than 1.8.9 (not inc. 1.9.x). Please enter a version above 1.8.9."
		echo "Aborting"
		exit
	fi
	jar="server.jar"
elif [[ $choice == 2 ]]
then
	echo "You have chosen to install Spigot server"
	if [[ $2 == "" ]]
	then
		echo "Enter version: "
		read version
	else
		version=$2
	fi
	if [[ $version == '1.16.5' ]]
	then
		url="https://cdn.getbukkit.org/spigot/spigot-1.16.5.jar"
	elif [[ $version == '1.16.4' ]]
	then
		url="https://cdn.getbukkit.org/spigot/spigot-1.16.4.jar"
	elif [[ $version == '1.16.3' ]]
	then
		url="https://cdn.getbukkit.org/spigot/spigot-1.16.3.jar"
	elif [[ $version == '1.16.2' ]]
	then
		url="https://cdn.getbukkit.org/spigot/spigot-1.16.2.jar"
	elif [[ $version == '1.16.1' ]]
	then
		url="https://cdn.getbukkit.org/spigot/spigot-1.16.1.jar"
	elif [[ $version == '1.15.2' ]]
	then
		url="https://cdn.getbukkit.org/spigot/spigot-1.15.2.jar"
	elif [[ $version == '1.15.1' ]]
	then
		url="https://cdn.getbukkit.org/spigot/spigot-1.15.1.jar"
	elif [[ $version == '1.15' ]]
	then
		url="https://cdn.getbukkit.org/spigot/spigot-1.15.jar"
	elif [[ $version == '1.14.4' ]]
	then
		url="https://cdn.getbukkit.org/spigot/spigot-1.14.4.jar"
	elif [[ $version == '1.14.3' ]]
	then
		url="https://cdn.getbukkit.org/spigot/spigot-1.14.3.jar"
	elif [[ $version == '1.14.2' ]]
	then
		url="https://cdn.getbukkit.org/spigot/spigot-1.14.2.jar"
	elif [[ $version == '1.14.1' ]]
	then
		url="https://cdn.getbukkit.org/spigot/spigot-1.14.1.jar"
	elif [[ $version == '1.14' ]]
	then
		url="https://cdn.getbukkit.org/spigot/spigot-1.14.jar"
	elif [[ $version == '1.13.2' ]]
	then
		url="https://cdn.getbukkit.org/spigot/spigot-1.13.2.jar"
	elif [[ $version == '1.13.1' ]]
	then
		url="https://cdn.getbukkit.org/spigot/spigot-1.13.1.jar"
	elif [[ $version == '1.13' ]]
	then
		url="https://cdn.getbukkit.org/spigot/spigot-1.13.jar"
	elif [[ $version == '1.12.2' ]]
	then
		url="https://cdn.getbukkit.org/spigot/spigot-1.12.2.jar"
	elif [[ $version == '1.12.1' ]]
	then
		url="https://cdn.getbukkit.org/spigot/spigot-1.12.1.jar"
	elif [[ $version == '1.12' ]]
	then
		url="https://cdn.getbukkit.org/spigot/spigot-1.12.jar"
	elif [[ $version == '1.11.2' ]]
	then
		url="https://cdn.getbukkit.org/spigot/spigot-1.11.2.jar"
	elif [[ $version == '1.11.1' ]]
	then
		url="https://cdn.getbukkit.org/spigot/spigot-1.11.1.jar"
	elif [[ $version == '1.11' ]]
	then
		url="https://cdn.getbukkit.org/spigot/spigot-1.11.jar"
	else
		echo "You have entered an invalid entry, or a version less than 1.10 (for spigot). Please enter a version above 1.10."
		echo "Aborting"
		exit
	fi
	jar="spigot.jar"
else
	echo "You have chosen to install Paper server"
	if [[ $2 == "" ]]
	then
		echo "Enter version: "
		read version
	else
		version=$2
	fi
	if [[ $version == '1.16.5' ]]
	then
		url="https://papermc.io/api/v2/projects/paper/versions/1.16.5/builds/436/downloads/paper-1.16.5-436.jar"
	elif [[ $version == '1.15.2' ]]
	then
		url="https://papermc.io/api/v2/projects/paper/versions/1.15.2/builds/391/downloads/paper-1.15.2-391.jar"
	elif [[ $version == '1.14.4' ]]
	then
		url="https://papermc.io/api/v2/projects/paper/versions/1.14.4/builds/243/downloads/paper-1.14.4-243.jar"
	elif [[ $version == '1.13.2' ]]
	then
		url="https://papermc.io/api/v2/projects/paper/versions/1.13.2/builds/655/downloads/paper-1.13.2-655.jar"
	elif [[ $version == '1.12.2' ]]
	then
		url="https://papermc.io/api/v2/projects/paper/versions/1.12.2/builds/1618/downloads/paper-1.12.2-1618.jar"
	elif [[ $version == '1.11.2' ]]
	then
		url="https://papermc.io/api/v2/projects/paper/versions/1.11.2/builds/1104/downloads/paper-1.11.2-1104.jar"
	elif [[ $version == '1.10.2' ]]
	then
		url="https://papermc.io/api/v2/projects/paper/versions/1.10.2/builds/916/downloads/paper-1.10.2-916.jar"
	elif [[ $version == '1.9.4' ]]
	then
		url="https://papermc.io/api/v2/projects/paper/versions/1.9.4/builds/773/downloads/paper-1.9.4-773.jar"
	elif [[ $version == '1.8.8' ]]
	then
		url="https://papermc.io/api/v2/projects/paper/versions/1.8.8/builds/443/downloads/paper-1.8.8-443.jar"
	else
		echo "You have entered an invalid entry."
		echo "Aborting"
		exit
	fi	
	jar="paper.jar"
fi

if [[ $3 == "" ]]
then
	echo "Enter the name of the server: "
	read dir
else
	dir=$3
fi
if [[ $4 == "" ]]
then
	echo "Are you setting up a custom map? (y/n): "
	read custom
else
	custom=$4
fi


# Mods section
if [[ $choice == 1 ]]
then

	if [[ $5 == "" ]]
	then
		echo "Install mod loader?
1. Forge
2. Fabric
3. Cancel
Choice: "
		read ins_mods
	else
		ins_mods=$5
	fi

	# Forge
	if [[ $ins_mods == '1' ]]
	then
		install_normal
		furl=""
		if [[ $version == '1.16.5' ]]
		then
			furl="https://files.minecraftforge.net/maven/net/minecraftforge/forge/1.16.5-36.0.1/forge-1.16.5-36.0.1-installer.jar"
		elif [[ $version == '1.16.4' ]]
		then
			furl="https://files.minecraftforge.net/maven/net/minecraftforge/forge/1.16.4-35.1.37/forge-1.16.4-35.1.37-installer.jar"
		elif [[ $version == '1.16.3' ]]
		then
			furl="https://files.minecraftforge.net/maven/net/minecraftforge/forge/1.16.3-34.1.42/forge-1.16.3-34.1.42-installer.jar"
		elif [[ $version == '1.16.2' ]]
		then
			furl="https://files.minecraftforge.net/maven/net/minecraftforge/forge/1.16.2-33.0.61/forge-1.16.2-33.0.61-installer.jar"
		elif [[ $version == '1.16.1' ]]
		then
			furl="https://files.minecraftforge.net/maven/net/minecraftforge/forge/1.16.1-32.0.108/forge-1.16.1-32.0.108-installer.jar"
		elif [[ $version == '1.15.2' ]]
		then
			furl="https://files.minecraftforge.net/maven/net/minecraftforge/forge/1.15.2-31.2.47/forge-1.15.2-31.2.47-installer.jar"
		elif [[ $version == '1.15.1' ]]
		then
			furl="https://files.minecraftforge.net/maven/net/minecraftforge/forge/1.15.1-30.0.51/forge-1.15.1-30.0.51-installer.jar"
		elif [[ $version == '1.15' ]]
		then
			furl="https://files.minecraftforge.net/maven/net/minecraftforge/forge/1.15-29.0.4/forge-1.15-29.0.4-installer.jar"
		elif [[ $version == '1.14.4' ]]
		then
			furl="https://files.minecraftforge.net/maven/net/minecraftforge/forge/1.14.4-28.2.0/forge-1.14.4-28.2.0-installer.jar"
		elif [[ $version == '1.14.3' ]]
		then
			furl="https://files.minecraftforge.net/maven/net/minecraftforge/forge/1.14.3-27.0.60/forge-1.14.3-27.0.60-installer.jar"
		elif [[ $version == '1.14.2' ]]
		then
			furl="https://files.minecraftforge.net/maven/net/minecraftforge/forge/1.14.2-26.0.63/forge-1.14.2-26.0.63-installer.jar"
		elif [[ $version == '1.13.2' ]]
		then
			furl="https://files.minecraftforge.net/maven/net/minecraftforge/forge/1.13.2-25.0.219/forge-1.13.2-25.0.219-installer.jar"
		elif [[ $version == '1.12.2' ]]
		then
			furl="https://files.minecraftforge.net/maven/net/minecraftforge/forge/1.12.2-14.23.5.2854/forge-1.12.2-14.23.5.2854-installer.jar"
		elif [[ $version == '1.12.1' ]]
		then
			furl="https://files.minecraftforge.net/maven/net/minecraftforge/forge/1.12.1-14.22.1.2478/forge-1.12.1-14.22.1.2478-installer.jar"
		elif [[ $version == '1.12' ]]
		then
			furl="https://files.minecraftforge.net/maven/net/minecraftforge/forge/1.12-14.21.1.2387/forge-1.12-14.21.1.2387-installer.jar"
		elif [[ $version == '1.11.2' ]]
		then
			furl="https://files.minecraftforge.net/maven/net/minecraftforge/forge/1.11.2-13.20.1.2386/forge-1.11.2-13.20.1.2386-installer.jar"
		elif [[ $version == '1.11' ]]
		then
			furl="https://files.minecraftforge.net/maven/net/minecraftforge/forge/1.11-13.19.1.2189/forge-1.11-13.19.1.2189-installer.jar"
		elif [[ $version == '1.10.2' ]]
		then
			furl="https://files.minecraftforge.net/maven/net/minecraftforge/forge/1.10.2-12.18.3.2185/forge-1.10.2-12.18.3.2185-installer.jar"
		elif [[ $version == '1.10' ]]
		then
			furl="https://files.minecraftforge.net/maven/net/minecraftforge/forge/1.10-12.18.0.2000-1.10.0/forge-1.10-12.18.0.2000-1.10.0-installer.jar"
		elif [[ $version == '1.8.9' ]]
		then
			furl="https://files.minecraftforge.net/maven/net/minecraftforge/forge/1.8.9-11.15.1.2318-1.8.9/forge-1.8.9-11.15.1.2318-1.8.9-installer.jar"			
		else
			echo "Forge doesn't support $version"
			echo "Aborting"
		fi
		if [[ $furl != "" ]]
		then
			wget -O "forge_installer.jar" $furl
			java -jar forge_installer.jar --installServer 
			rm forge_installer.jar
			rm forge_installer.jar.log
			jar="forge*.jar"
		fi
	# Fabric
	elif [[ $ins_mods == '2' ]]
	then
		mkdir $dir
		cd $dir
		wget -O fabric-installer.jar https://maven.fabricmc.net/net/fabricmc/fabric-installer/0.6.1.51/fabric-installer-0.6.1.51.jar
		java -jar fabric-installer.jar server -mcversion $version -downloadMinecraft
		rm fabric-installer*.jar
		echo "Running Fabric for the first time, please wait..."
		java -jar fabric-server-launch.jar >/dev/null
		edit_settings
		jar="fabric-server-launch.jar"
	# No Mod
	else
		echo ""
		echo "Skipping mod installation"
		install_normal
	fi
else
	install_normal
fi
echo ""
echo "Server setup complete. run by issuing the command: "
echo "java -jar $jar --nogui"