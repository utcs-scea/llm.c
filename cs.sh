#!/bin/bash
# find -name "*.py"     is different from   find -name *.py
rm -rf tags
rm -rf cscope.files cscope.out cscope.in.out cscope.po.out

#ctags -R
#ctags -R --fields=+iaS --extra=+q --language-force=C++ 
ctags -R \
    --exclude=dev \
    --exclude=doc \
    --exclude=train_gpt2.c \
    --exclude=test_gpt2.c \
    --exclude=build
find . \
    -path ./dev -prune -o \
    -path ./doc -prune -o \
    -path ./build -prune -o \
    -path ./train_gpt2.c -prune -o \
    -path ./test_gpt2.c -prune -o \
    -name "*.cu" -or -name "*.cuh" -or -name "*.h" -or -name "*.hh" -or -name "*.c" -or -name "*.cc" -or -name "*.cxx" -or -name "*.py" -or -name "*.cpp" -or -name "SConstruct" -or -name "SConscript" -or -name "*.def" > cscope.files
cscope -bkq -i cscope.files 
