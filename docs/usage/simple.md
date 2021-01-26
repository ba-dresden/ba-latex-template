---
title: Simple Mode
sort: 1
---
# Simple mode
The template has a "simple mode", which loads a bunch of opinionated packages and provides the `basimple` environment, which configures everything, so you do not have to worry about anything. The "simple mode" is enabled with the `simple` package option.
```latex
\documentclass[first=firstname,last=lastname,company=comp,location=Dresden,simple]{baarticle}

\begin{document}
    \begin{basimple}[
        img=../empty.png,
        course=thecourse,
        title=The title,
        number=1234567,
        corrector={corrector1,corrector2},
        themedate=\today,
        returndate=\today,
        signature=../empty.png,
        location=Dresden,
        type=thesis
    ]
        \section{Caption}
        Here is the content of paper.
        \clearpage
    \end{basimple}
\end{document}
```

```note
 The "simple" package option loads the babel, csquotes, biblatex, glossaries and hyperref packages.
```
Let's go through the other package options quickly:
- `first` should be your first name
- `last` should be your last name
- `company` should be the company you work for, in case the name contains spaces use `\space` to split the parts, e.g. `part1\space part2`
- `location` should be the location of university

Let's also discuss the options of the `basimple` environment:
- `img` should be a path pointing to the logo of the university
- `course` should be your course of studies
- `title` should be the title of the paper
- `number` should be your matriculation number
- `corrector` should be a comma sperated list of correctors
- `themedate` should be the date when the theme of the paper was announced
- `returndate` should be the date when the paper is handed in
- `signature` should be a path to an image of your signature
- `location` should be the location of your company
- `type` defines the type of the paper and influences the title page if set to `thesis`, `study` or `report`. Setting the `type` parameter is optional.

To add an abstract to the paper define a macro called `\basimpleabstract` which replacement text is the abtract's content. The following should do it (the `\addcontentsline` is optional):
```latex
\documentclass[...,simple]{baarticle}

\newcommand{\basimpleabstract}{
    % if you want to add the abstract to the table of contents
    \addcontentsline{toc}{section}{Abstract}
    content of the abstract
}
\begin{document}
    ...
\end{document}
```

The example document given can be compiled, with `latexmk --pdf --interaction=nonstopmode file.tex` for example.
```warning
 Importing additional packages with `\usepackage` while in "simple mode" might not work. If you need to load additional packages consider not using the "simple mode".
```

## A little walkthrough

Sections can be created using the `\section{title},\subsection{title},\subsubsection{title}` commands. The section titles are automatically added to the table of contents. If you do not want that use the starred version of the command, e.g. `\section*{title not in table of contents}`.

Refering to sources can be achieved with the `\bacite{source}` command for direct citations and the the `\vglcite{source}` command for indirect citations. You need to provide LaTeX with a list of used sources. Therefore you have to create a file with the `.bib` extension, e.g. `document.bib`, and fill it with information regarding your sources.
```text
@book{cloudcomp,
	author = {John W. Rittinghouse and James F. Ransome},
	title = {Cloud Computing},
	subtitle = {Implementation, Management and Security},
	location = {Boca Raton},
	year = {2018}
}
```
Now one can create references in the `.tex` file. `\enquote{content}` puts its argument in quotation marks. The numbers given to the cite commands in the brackets describe the pages, where the information can be found in the sources.
```latex
\documentclass[...]{baarticle}

\addbibresource{document.bib}
\begin{document}
    \begin{basimple}[...]
        \section{Caption}
        indirect citation.\vglcite[17-21]{cloudcomp}\enquote{direct citation}\bacite[29]{cloudcomp}
    \end{basimple}
\end{document}
```
To get a grasp on what else is possible with biblatex consult their [documentation](https://ctan.mc1.root.project-creative.net/macros/latex/contrib/biblatex/doc/biblatex.pdf) and [cheatsheet](http://tug.ctan.org/info/biblatex-cheatsheet/biblatex-cheatsheet.pdf).

Abbreviations are managed by the glossaries package. To define an abbreviation use `\newacronym{identifier}{short-form}{long-form}` and to refer to it use `\gls{identifier}`.
```latex
\documentclass[...]{baarticle}

\newacronym{HTTP}{HTTP}{Hypertext Transfer Protocol}
\begin{document}
    \begin{basimple}[...]
        \section{Caption}
        \gls{HTTP} is a protocol on the OSI-Layer 7.
    \end{basimple}
\end{document}
```
Images can be inculded with `\includegraphics`, which should be wrapped in a `bafigure` environment. The number of a figure can be retrieved using `\ref{caption}` with the caption provided to the environment. Tables should also be wrapped in a `batable` environment.
```latex
\documentclass[...]{baarticle}

\begin{document}
    \begin{basimple}[...]
        \begin{bafigure}{caption}
            \includegraphics{path/to/an/image.png}
        \end{bafigure}
        As seen in figure \ref{caption} ...
    \end{basimple}
\end{document}
```
It is worthwhile to split up larger documents into mulitple files. You can put each chapter into a separat `.tex` file and join them in the main file using `\include{path/to/the/file}`. Assuming the files are in the same directory the following works.
```latex
\documentclass[...]{baarticle}

\begin{document}
    \begin{basimple}[...]
        \include{chapter1}
        \include{chapter2}
        \include{chapter3}
    \end{basimple}
\end{document}
```

## Using non ascii symbols with pdflatex

To use non ascii symbols, you need to save the `*.tex` and `*.bib` files in the UTF-8 encoding and import the inputenc package.
```latex
\usepackage[utf8]{inputenc}
```
