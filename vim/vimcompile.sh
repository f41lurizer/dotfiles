sudo apt-get install liblua5.1-dev luajit libluajit-5.1 
./configure --with-compiledby=f41lurizer --with-features=huge --enable-multibyte --enable-rubyinterp --enable-pythoninterp --enable-python3interp --enable-luainterp --with-lua-prefix=/usr/include/lua5.1
make
sudo install

//good installation instructions for lua
https://otland.net/threads/configure-error-lua-header-not-found.116586/
