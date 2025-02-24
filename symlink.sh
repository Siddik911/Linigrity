#You can track a file in a different directory (like your Fish configuration) using Git's symlink approach or 
#by using Git’s sparse-checkout feature in combination with a centralized dotfiles repository. 
#Here's how to do it without initializing a separate Git repository:


# Step 1: Create the dotfiles directory and initialize Git
mkdir ~/dotfiles
cd ~/dotfiles
git init

# Step 2: Move the config file to the new location
mv ~/.config/fish/config.fish ~/Desktop/Repos/Linigrity/config.fish

# Step 3: Create a symlink at the original location
ln -s ~/Desktop/Repos/Linigrity/config.fish ~/.config/fish/config.fish

# Step 4: Track and commit the file using Git
cd ~/dotfiles
git add config.fish
git commit -m "Track Fish config"
