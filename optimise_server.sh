echo ""
echo "Optimize your:
1. Spigot server
2. Paper server
Enter your choice: "
read choice

if [[ $choice == 1 || $choice == 2 ]]
then
    sed -i "s/view-distance=10/view-distance=4/g" server.properties
    sed -i "s/mob-spawn-range: 8/mob-spawn-range: 3/g" spigot.yml
    sed -i "s/period-in-ticks: 600/period-in-ticks: 400/g" bukkit.yml
    sed -i "s/tick-inactive-villagers: true/tick-inactive-villagers: false/g" spigot.yml
    sed -i "s/exp: 3.0/exp: 6.0/g" spigot.yml
    sed -i "s/item: 2.5/item: 4.0/g" spigot.yml
fi
if [[ $choice == 2 ]]
else
    sed -i "s/max-auto-save-chunks-per-tick: 24/max-auto-save-chunks-per-tick: 6/g" paper.yml
    sed -i "s/max-entity-collisions: 8/max-entity-collisions: 2/g" paper.yml
    sed -i "s/optimize-explosions: false/optimize-explosions: true/g" paper.yml
    sed -i "s/container-update-tick-rate: 1/container-update-tick-rate: 3/g" paper.yml
    sed -i "s/prevent-moving-into-unloaded-chunks: false/prevent-moving-into-unloaded-chunks: true/g" paper.yml
    sed -i "s/use-faster-eigencraft-redstone: false/use-faster-eigencraft-redstone: true/g" paper.yml
    sed -i "s/armor-stands-tick: true/armor-stands-tick: false/g" paper.yml
    sed -i "s/per-player-mob-spawns: false/per-player-mob-spawns: true/g" paper.yml;
    sed -i "s/anti-xray: false/anti-xray: true/g" paper.yml;
fi