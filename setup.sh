# link nvim folder
[ -d $HOME/.config/nvim ]  || mkdir -p $HOME/.config/nvim
ln -sf $(realpath nvim/init.vim) $HOME/.config/nvim/

# install vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
           https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
