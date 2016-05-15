let fresh_plug_install = 0

if !filereadable(expand("~/.vim/autoload/plug.vim"))
  silent !echo "Installing Plug..."
  !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  let fresh_plug_install = 1
endif

if !filereadable(expand("~/.config/nvim/autoload/plug.vim"))
  silent !echo "Installing Plug..."
  !mkdir -p ~/.config/nvim/autoload
  !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  let fresh_plug_install = 1
endif
