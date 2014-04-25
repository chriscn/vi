:: download pathogen files
mkdir %userprofile%\vimfiles\autoload
powershell -ExecutionPolicy "Bypass" -command "Invoke-WebRequest -Uri 'https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim' -OutFile '%userprofile%\vimfiles\autoload\pathogen.vim'"

:: create symbol link
mklink %userprofile%\_vimrc %~dp0_vimrc
if not "%~dp0"=="%userprofile%\vimfiles\" (
    mklink %userprofile%\vimfiles %~dp0
)
