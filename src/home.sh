#!/usr/bin/env bash

main() {
  local wd=$HOME
  cd $wd
  tmux-aoc "home"
}

main
