#if [[ "$OSTYPE" == "linux-gnu" ]]; then
  export NGINX_DIR="/etc/nginx"
#elif [[ "$OSTYPE" == "darwin" ]]; then
#fi
  # Teste
#elif [[ "$OSTYPE" == "cygwin" ]]; then
  #POSIX compatibility layer and Linux environment emulation for Windows
#elif [[ "$OSTYPE" == "msys" ]]; then
    # Lightweight shell and GNU utilities compiled for Windows (part of MinGW)
#elif [[ "$OSTYPE" == "win32" ]]; then
    # I'm not sure this can happen.
#elif [[ "$OSTYPE" == "freebsd" ]]; then
    # ...
#else
    # Unknown

sudo chmod -R 777 "$NGINX_DIR"
if [[ -f "$NGINX_DIR/nginx.conf" ]]; then
  rm -rf "$NGINX_DIR/nginx.conf"
  ln -s "$DOTFILES_PATH/app/nginx/nginx.conf" "$NGINX_DIR/nginx.conf"
  ln -s "$DOTFILES_PATH/app/nginx/uol" "$NGINX_DIR/uol"
fi


if [[ -f "uol.sh" ]]; then
    source uol.sh
fi
