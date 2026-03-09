# c-terminal

![Build Status](https://github.com/monakaibrahim-cmyk/c-terminal/actions/workflows/build.yml/badge.svg?branch=windows)

Simple Terminal with minimal Commands.

## Building

**WSL**
```
1. git clone https://github.com/monakaibrahim-cmyk/c-terminal.git
2. cd c-terminal
3. mkdir build
4. cmake -DCMAKE_TOOLCHAIN_FILE=../mingw-toolchain.cmake -B build
5. make -C Build
```

**WINDOWS**
```
1. git clone https://github.com/monakaibrahim-cmyk/c-terminal.git
2. cd c-terminal
3. mkdir build
4. cmake -B build
5. cmake --build build
```
