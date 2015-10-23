SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd ${SCRIPT_DIR}

mkdir ~/.fonts
git clone https://github.com/powerline/fonts
./fonts/install.sh
rm -fR fonts

cd ${OLDPWD}

echo "Please enter terminal config and select one of the powerline fonts that should be appear"
echo 'Just for information, monospace in ubuntu is DejaVu Sans Mono" "Book"'
echo 'You can use fc-match <font> to know matched fonts'
