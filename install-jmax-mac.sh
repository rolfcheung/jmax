#!/bin/bash

# Check for brew
command -v brew >/dev/null 2>&1 || { echo >&2 "I require brew but it's not installed.  Installing it now.";
				     /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"; }

# Check for git
command -v git >/dev/null 2>&1 || { echo >&2 "I require git but it's not installed.  Installing it now.";
				    brew install git; }

# Check for emacs
command -v emacs >/dev/null 2>&1 || { echo >&2 "I require emacs but it's not installed.  Installing it now.";
				    brew install emacs --with-gnutls --with-imagemagick --with-librsvg --with-x11 --use-git-head --HEAD --with-cocoa; }

# Now clone jmax
if [ ! -d "jmax" ]; then
  git clone https://github.com/jkitchin/jmax.git
fi

echo "jmax is installed. To use it, run this command in your terminal."
echo "emacs -q -l `pwd`/jmax/init.el"
echo "or"
echo "run the jmax.sh script created in this directory as ./jmax.sh in the terminal."

echo "#!/bin/bash
emacs -q -l `pwd`/jmax/init.el
#end" > jmax.sh
chmod +x jmax.sh
#end
