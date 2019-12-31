read -p "Are you sure you want to do this?: (y/n) "  response

if [ $response != y ] 
then
    echo "exiting"
    exit 1
fi

echo "cloning oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
echo "cloning tpm"
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

sudo rm -rf ~/.vimrc > /dev/null 2>&1
sudo rm -rf ~/.zshrc > /dev/null 2>&1
sudo rm -rf ~/.tmux.conf > /dev/null 2>&1

SYMLINKS=()
ln -sf ~/.dotfiles/vimrc ~/.vimrc
SYMLINKS+=('.vimrc')
ln -sf ~/.dotfiles/tmux.conf ~/.tmux.conf
SYMLINKS+=('.tmux-conf')
ln -sf ~/.dotfiles/zshrc ~/.inputrc
SYMLINKS+=('zshrc')

source ~/.zshrc
tmux source ~/.tmux.conf
