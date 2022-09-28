mv .bashrc .bashrc_bu
ln -s .dotfiles/bashrc .bashrc
ln -s .dotfiles/bash_aliases .bash_aliases
ln -s .dotfiles/bash_profile .bash_profile
ln -s .dotfiles/xinitrc .xinitrc
ln -s .dotfiles/vim .vim
ln -s .dotfiles/vimrc .vimrc
ln -s .dotfiles/screenrc .screenrc
ln -s .dotfiles/tmux.conf .tmux.conf
ln .dotfiles/.config/i3/config .config/i3/config
ln .dotfiles/.config/i3/i3status.conf .config/i3/i3status.conf
mkdir .config/coc
ln .dotfiles/coc-settings.json .config/coc/
mkdir -p .config/nvim/ftplugin
ln .dotfiles/config/nvim/ftplugin/* .config/nvim/ftplugin/
ln .dotfiles/config/nvim/init.vim .config/nvim/init.vim

# ln -s .dotfiles/ipython_config.py .ipython_config.py
