# Minecraft Server Manager [CLI] [bash]

This is a script I made that will allow the user to easily and automatically create minecraft server instances.

## Features:
- Support for multiple versions from **1.16.x** to **1.10.x** and **1.8.9**.
- Support for **Mojang**, **Spigot** and **Paper** servers.
- Support for **Forge** and **Fabric** mod loaders.
- CLI interface for programmatic access.

### CLI Usage
`$ <Server type> <Version> <Name> <Custom map> [<Mod loader>]`

- Server name will be the name of the directory where server will be led.
- NOTE: Do not provide Mod loader argument for Spigot or paper servers.
