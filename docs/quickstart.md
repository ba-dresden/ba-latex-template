---
title: Quick Start
sort: 1
---
# Quick Start
This quick start will outline a simple way to get started with this template and LaTeX.
For the most steps described below exist alternative solution.
You can check the other articles in this documentation for the alternatives.
This guide will also assume that the operating system used is Windows.

## Install LaTeX and Perl
Install [TexLive](https://www.tug.org/texlive/acquire-netinstall.html), a TeX distributions, which bundles compilers and packages the template needs, and [StrawberryPerl](http://strawberryperl.com/), which a tool you will use requires.
It might be a good idea to restart the computer.

## Download the template
The latest version of the template can be found on the [Releases](https://github.com/Nuckal777/ba-latex-template/releases) page.
Download it.
Create a directory, which will hold all the files required for your paper.
Put the content of template into that directory.
Create a file called `document.tex`. The directory structure should now look like the following.
```text
somedirectory
|-baarticle.bbx
|-baarticle.cbx
|-baarticle.cls
|-baarticle.dtx
|-document.tex
|-ngerman-ba.lbx
```

## Get the required images
You need an image of your signature.
Put it into the subfolder 'images' and call it `signature.png`.
```note
 If the image of your signature as an other file extension than png, use that one.
```
The directory should now look like this.
```text
somedirectory
|-baarticle.bbx
|-baarticle.cbx
|-baarticle.cls
|-baarticle.dtx
|-document.tex
|-ngerman-ba.lbx
|-images|-signature.png
|-images|-logo.png
```

## Build your first paper
Open the document.tex file in your favourite editor and copy the following code block.
```latex
\documentclass[first=firstname,last=lastname,company=comp,location=Dresden,simple]{baarticle}

\begin{document}
    \begin{basimple}[
        img=logo.png,
        course=thecourse,
        title=The title,
        number=1234567,
        corrector={corrector1,corrector2},
        themedate=\today,
        returndate=\today,
        signature=signature.png,
        location=Dresden
    ]
        \section{Caption}
        Here is the content of paper.
        \clearpage
    \end{basimple}
\end{document}
```
The only task left is to compile the document.
Open a command line in the working directory and execute `latexmk --pdf --interaction=nonstopmode document.tex`.
After running that command `document.pdf` is created along with a bunch of other files.
You can view the PDF-file in your favourite viewer.
Now you probably want inform yourself about the [simple mode](./usage/simple).

```tip
 Some PDF-viewers, like Adobe Reader, hold file locks. You need to close these before invoking latexmk. Otherwise compilation will fail.
```
