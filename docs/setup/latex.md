---
title: LaTeX
sort: 1
---
# LaTeX Setup

```tip
There is a version of this template ready for the overleaf online-editor. You can find it [here](https://github.com/n3rdc4ptn/ba-latex-template-overleaf). You can skip the whole local setup, if you choose to use overleaf. Take care regarding confidential topics.
```

## TeX System

You need to install a TeX distribution.

### Windows

There are two notable TeX distributions for windows. [TexLive](https://www.tug.org/texlive/acquire-netinstall.html) and [MikTeX](https://miktex.org/download). MikTex only installs a very basic TeX system. Additional packages required by the template will be installed via a package manager. MikTeX is capable of upgrading its installation and packages. The template author uses MikTeX. TexLive includes a lot of packages and requires therefore more disk space than MikTeX, but it is harder for the user to break comparing to MikTeX, because TeXLive is not as flexible as MikTeX. The template should work with either.

### MacOS

There is [MacTex](https://tug.org/mactex/), which is comparable to TeXLive. [MikTeX](https://miktex.org/download) is also available for MacOS.

### Linux

Kindly ask your package manager. Most linux distributions bundle [TexLive](https://www.tug.org/texlive/acquire-netinstall.html). [MikTeX](https://miktex.org/download) is also available for Linux.

## Editor

Next you need an editor. There is bunch of choices, starting from plain notepad upto "IDE's", like TeXMaker. Some programs are presented [here](https://beebom.com/best-latex-editors/). The templates author uses [VSCode](https://code.visualstudio.com/) with the LaTeX Workshop extension.

## Compilation

To get a PDF file from LaTeX code compilation is required. To compile the document multiple programs have to be invoked. There exist multiple options to automate that process. The author strongly recommends to use `latexmk`, as it is easiest to install and use. `latexmk` is already inculded in TeXLive. If you use MikTeX, you have to install the `latexmk` package from the MikTex Console. `latexmk` requires Perl, which is not availble per default on Windows. You might want to install [StrawberryPerl](http://strawberryperl.com/).

```note
 Other ways to compile documents include invoking the required programs by hand, creating a Makefile, using the SCons build system or letting the editor compile the document if supported.
```
