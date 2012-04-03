export BROWSER=google-chrome
export EDITOR=vim
export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus

# local installation
local_install_root=$HOME/app

# programs
file=$local_install_root/PATH
test ! -s $file -o $local_install_root -nt $file && cat > $file <<EOF
export PATH=$(
  find -L $local_install_root -type d -name bin | fgrep -v "$GEM_HOME/gems" |
  tr '\n' ':' | sed 's,:$,,'
):\$PATH
export MANPATH=$(
  find -L $local_install_root -type d -name man | tr '\n' ':' | sed 's,:$,,'
):\$MANPATH
EOF
source $file
export PATH=$HOME/bin:$PATH
