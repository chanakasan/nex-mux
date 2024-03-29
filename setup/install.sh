#!/bin/bash

set -e

main() {
  local title="Nex Mux"
  local dir_name="nex-mux"
  local start_text='__nex_mux_start'
  local end_text='__nex_mux_end'
  local bashrc="$HOME/.bashrc"
  local nex_mux_path=$(get_root_path)/$dir_name
  echo " Installing - $title"
  remove_from_bashrc
  copy_to_bashrc
  print_done
}

print_done() {
  echo ""
  echo " done"
  echo " Please reload bashrc"
  echo " source ~/.bashrc"
  echo ""
}

get_root_path() {
  local user=$(whoami)
  if [ "$user" = "codespace" ]; then
    echo /workspaces/.codespaces/.persistedshare
  else
    echo $HOME/dotfiles
  fi
}

remove_from_bashrc() {
  sed -i '/#'$start_text'/,/#'$end_text'/{d}' $bashrc
}

copy_to_bashrc() {
  echo "" >> $bashrc
  echo "#$start_text" >> $bashrc
  echo 'export nex_mux_path='$nex_mux_path >> $bashrc
  echo 'export PATH=$nex_mux_path/bin:$PATH' >> $bashrc
  echo 'source $nex_mux_path/bash/main.sh' >> $bashrc
  echo "#$end_text" >> $bashrc
  echo "" >> $bashrc
}

# _end_
main
