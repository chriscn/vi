mkdir $env:USERPROFILE\vimfiles\autoload
Invoke-WebRequest -Uri "https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim" -OutFile "$env:USERPROFILE\vimfiles\autoload\pathogen.vim"