#!/usr/bin/env bash

main() {
  local wd=$HOME/anything
  cd $wd
  tmux-aoc "anything"
}

main

