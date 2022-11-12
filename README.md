# Linux Dotfiles
This repository contains a number of configuration files I like to have setup on every Linux installation, as well as a bash script to get everything linked to my home directory ✨ ***automagically*** ✨

## Repository Contents
I'm sure you already know what most of these files do, but just in case, here's a little rundown.

🔗 **.gitconfig**  
Config file for git, a version control tool. You *might* have heard of it.

🌍 **.myenv**  
A file for configuring environment variables and other bash settings (see **setup.sh** description for more info).

🗂️ **.tmux.conf**  
Config file for tmux, a great multi-tasking tool for having multiple 'windows' in a command line environment.

✏️ **.vimrc**  
Config file for vim, a text editor which has famously been trapping people in their CLI since 1991.

✨ **setup.sh**  
A bash script which sets-up all of the config files in the users home directory.  
It does this by creating symbolic links for each of the config files and includes the .myenv file in the .profile file (.profile is run on bash startup, so this allows the .myenv file to be executed on startup for every new shell instance).  
