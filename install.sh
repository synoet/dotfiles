STOW_FOLDERS="i3,kitty,nvim,polybar,private,rofi,tmux,wallpapers,xorg,zathura,zsh"

DOTFILES=$HOME/dotfiles

echo "Stowing dotfiles \n"

pushd $DOTFILES
for folder in $(echo $STOW_FOLDERS | sed "s/,/ /g")
do
    echo "Clearing $folder"
    stow -D $folder
    echo "Stowing $folder"
    stow $folder
done
popd
