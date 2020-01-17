#!/bin/sh

force=0
cwd=`pwd`

while test -n "$1"; do
  case $1 in
    -f)
      force=1
      ;;
    -*)
      echo "Error: unknown option $1"
      exit 1
      ;;
  esac
  shift
done

if test ! -d ~/.vim; then
  echo "Note: Creating ~/.vim directory"
  mkdir ~/.vim
  if test $? -ne 0; then
    echo "Error: failed to create ~/.vim"
    exit 1
  fi
else
  echo "Note: ~/.vim directory exists"
fi

for dir in ftdetect syntax indent; do
  if test ! -d ~/.vim/${dir}; then
    mkdir -p ~/.vim/${dir}
    if test $? -ne 0; then
      echo "Error: failed to create directory ~/.vim/${dir}"
      exit 1
    fi
  fi
done

for dir in ftdetect syntax indent; do
  if test -f ~/.vim/${dir}/portable-stimulus.vim && 
     test ! -L ~/.vim/${dir}/portable-stimulus.vim; then
     if test $force -eq 1; then
        echo "Note: removing existing file ~/.vim/${dir}/portable-stimulus.vim"
        rm ~/.vim/${dir}/portable-stimulus.vim
     else
        echo "Error: file ~/.vim/${dir}/portable-stimulus.vim exists"
        exit 1
     fi
  elif test -L ~/.vim/${dir}/portable-stimulus.vim; then
     echo "Note: removing old link ~/.vim/${dir}/portable-stimulus.vim"
     rm ~/.vim/${dir}/portable-stimulus.vim
  fi

  echo "Note: linking ~/.vim/${dir}/portable-stimulus.vim"
  ln -s ${cwd}/${dir}/portable-stimulus.vim ~/.vim/${dir}/portable-stimulus.vim
  if test $? -ne 0; then
    echo "Error: link failed"
    exit 1
  fi
done


