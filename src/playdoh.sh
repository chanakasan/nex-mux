#!/usr/bin/env bash

main() {
  local wd=$HOME/playDoh
  cd $wd
  tmux-aoc "play"
}

main
