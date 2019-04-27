#!/usr/bin/env bash
set -eu

readonly TOOLDIR=$(dirname $(readlink -e $0))

fzfer run ${TOOLDIR}/snippet.yml \
  | perl ${TOOLDIR}/lib/extract_lines.pl \
  | pbcopy

