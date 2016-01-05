#!/bin/bash
#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir=`pwd`                   # dotfiles directory
olddir=~/dotfiles_old             # old dotfiles backup directory
files="emacs.d vimrc vim fonts bashrc dir_colors"    # list of files/folders to symlink in homedir

##########

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

echo "Updating submodules"
git submodule update --init
git submodule foreach git pull origin master
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
for file in $files; do
    echo "Moving any existing dotfiles from ~ to $olddir"
    mv ~/.$file ~/dotfiles_old/
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done

##update the font cache
#echo "Updating font cache"
#fc-cache -vf ~/.fonts
#echo "...done"
