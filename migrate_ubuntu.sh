INSTALL_TERMINAL=1

DEPS='tmux git curl zsh gcc nodejs npm'

apt update
apt install -y $DEPS

snap install nvim --classic

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
. "$HOME/.cargo/env"

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting


curl -O https://dl.google.com/go/go1.22.2.linux-amd64.tar.gz
rm -rf /usr/local/go && tar -C /usr/local -xzf go1.22.2.linux-amd64.tar.gz

git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

git clone https://github.com/mikeyQwn/dotfiles --depth 1
cp -r dotfiles/nvim/ ~/.config/
cp -r dotfiles/.tmux.conf ~/
cp -r dotfiles/.zshrc ~/


if [ $INSTALL_TERMINAL ]; then
    DEPS_TERMINAL='cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3'
    apt install -y $DEPS_TERMINAL
    cargo install alacritty
fi
