---
title: Normal Mode
sort: 2
---
# Normal mode
Not using the "simple mode" makes the usage of the template a bit more verbose, but provides a lot more flexibility.
Usually "normal mode" is only necessary if a conflicting package needs to be imported, as the order of `\usepackage` statements matters, or somebody has special requirements, which deviate from the styleguide.

Let's start with the basic document structure.
All packages imports shown are not required, also the author highly recommends to use these.
The template bundles a complete biblatex style called "baarticle", which should be used to get the citations and bibliography right.
The package options are described in the "simple mode" [section](./simple).
```latex
\documentclass[first=firstname,last=lastname,company=comp,location=Dresden]{baarticle}
\usepackage[english,main=ngerman]{babel}
\usepackage[autostyle=true,german=quotes]{csquotes}
\usepackage[style=baarticle]{biblatex}
% Additional packages should probably go here
\usepackage{hyperref}

\addbibresource{document.bib}

\begin{document}
    \mktitle{
        title=Test Report,
        img=../empty.png,
        course=science,
        number=1234,
        corrector={corrector 1,corrector 2},
        themedate=\today,
        returndate=\today,
        type=thesis
    }
    \mkblocknotice{
        signature=../empty.png,
        date=\today,
        location=Dresden
    }
    \mkfrontmatter{
        \section*{Abkürzungsverzeichnis}
        \addcontentsline{toc}{section}{Abkürzungsverzeichnis}
    }
    % Content here
    \printbibliography[heading=bibintoc]
    \clearpage
    \mkaffirmation{
        signature=../empty.png,
        date=\today
    }
\end{document}
```
It should be obvious that it is possible to move different elements from the beginning and end of a paper around. Let's discuss the commands quickly:
- `\mktitle` creates a title page
    - `title` should be the title of the paper
    - `img` should be a path pointing to the logo of the university
    - `course` should be your course of studies
    - `number` should be your matriculation number
    - `corrector` should be a comma sperated list of correctors
    - `themedate` should be the date when the theme of the paper was announced
    - `returndate` should be the date when the paper is handed in
    - `type` defines the type of the paper. It should be one of `thesis`, `study` or `report`. Setting the `type` parameter is optional.
- `\mkblocknotice` creates a block notice
    - `signature` should be a path to an image of your signature
    - `date` should be the date when the paper is handed in
    - `location` should be the location of your company
- `\mkfrontmatter` creates the the table of contents, list of figures, abbreviations and tables
    - the first and only argument describes how to create the list of abbreviations. Per default no package is loaded, which can deal with abbreviations. You can choose a package you like.
    - instead of using `\mkfrontmatter` you can build the whole frontmatter yourself using standard LaTeX commands like `\tableofcontents,\listoffigures,\listoftables`
- `\mkaffirmation` creates the affirmation
    - `signature` should be a path to an image of your signature
    - `date` should be the date when the paper is handed in

## Using glossaries for the abbreviations
If you decide to use the glossaries package to manage abbreviations their default style needs to adjusted as outlined below.
```latex
\documentclass[first=firstname,last=lastname,company=comp,location=Dresden]{baarticle}
\usepackage[english,main=ngerman]{babel}
\usepackage[autostyle=true,german=quotes]{csquotes}
\usepackage[style=baarticle]{biblatex}
\usepackage{hyperref}
\usepackage[style=alttree,nogroupskip,nonumberlist,nopostdot,nolong,nosuper,nolist]{glossaries}

\setacronymstyle{long-short}
\renewcommand{\glossarysection}[2][]{}
\makenoidxglossaries

\begin{document}
    ...
    \mkfrontmatter{
        \singlespacing
        \section*{Abkürzungsverzeichnis}
        \addcontentsline{toc}{section}{Abkürzungsverzeichnis}
        \vspace{-1cm}
        \printnoidxglossaries
        \onehalfspacing
    }
    ...
\end{document}
```
