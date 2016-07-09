mkdir -p ~/.vim/autoload ~/.vim/bundle &&
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim &&
cd ~/.vim/bundle &&
git clone https://github.com/tpope/vim-sensible.git &&
git clone https://github.com/scrooloose/nerdtree.git &&
git clone https://github.com/vim-scripts/AutoComplPop.git

sudo apt-get install ctags &&
git clone https://github.com/majutsushi/tagbar.git 
git clone https://github.com/scrooloose/syntastic.git
