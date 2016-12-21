SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd ${SCRIPT_DIR}

mkdir ~/.fonts
git clone https://github.com/powerline/fonts
./fonts/install.sh
rm -fR fonts

# Installing awesome terminal fonts
git clone https://github.com/gabrielelana/awesome-terminal-fonts
cp awesome-terminal-fonts/build/* ~/.fonts/
fc-cache -fv ~/.fonts
[ ! -d ~/.config/fontconfig/conf.d ] && mkdir -p ~/.config/fontconfig/conf.d
cp awesome-terminal-fonts/config/10-symbols.conf ~/.config/fontconfig/conf.d
rm -fR awesome-terminal-fonts

cd ${OLDPWD}

echo "Please enter terminal config and select one of the powerline fonts that should be appear"
echo 'Just for information, monospace in ubuntu is DejaVu Sans Mono" "Book"'
echo 'You can use fc-match <font> to know matched fonts'
