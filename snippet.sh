#!/usr/bin/env bash
set -eu

function readlink_e() {
  local p
  if ! p=$(readlink -e "$1" 2>/dev/null); then
    p="$1"
    while [[ -L "$p" ]]; do
      p=$(readlink "$p")
    done
  fi
  echo $p
}


readonly TOOLDIR=$(dirname $(readlink_e $0))

fzfer run ${TOOLDIR}/snippet.yml \
  | perl ${TOOLDIR}/lib/extract_lines.pl \
  | pbcopy

