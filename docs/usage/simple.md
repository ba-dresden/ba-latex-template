---
title: Simple Mode
sort: 1
---
# Simple mode
The template has a "simple mode", which loads a bunch of opinionated packages and provides the `basimple` environment, which configures everything, so you do not have to worry about anything.
The "simple mode" is enabled with the `simple` package option.
```latex
\documentclass[first=firstname,last=lastname,company=comp,location=Dresden,simple]{baarticle}

\begin{document}
    \begin{basimple}[
        img=images/logo.png,
        course=thecourse,
        title=The title,
        number=1234567,
        corrector={corrector1,corrector2},
        themedate=\today,
        returndate=\today,
        signature=images/signature.png,
        location=Dresden,
        type=thesis,
        assignment=somefile.pdf
    ]
        \section{Caption}
        Here is the content of paper.
        \clearpage
    \end{basimple}
\end{document}
```

```note
 The "simple" package option loads the pdfpages, babel, csquotes, biblatex, glossaries and hyperref packages.
```
Let's go through the other package options quickly:
- `first` should be your first name
- `last` should be your last name
- `company` should be the company you work for, in case the name contains spaces use `\space` to split the parts, e.g. `part1\space part2`
- `location` should be the location of university
- `linkcoloring` changes the text color of links, if `simple` is specified as well
- `noheader` removes the document title from the header
- `headertitle` takes an argument to overwrite the header with the new value

Let's also discuss the options of the `basimple` environment:
- `img` should be a path pointing to the logo of the university
- `course` should be your course of studies
- `title` should be the title of the paper
- `number` should be your matriculation number
- `corrector` should be a comma separated list of correctors
- `themedate` should be the date when the theme of the paper was announced
- `returndate` should be the date when the paper is handed in
- `signature` should be a path to an image of your signature
- `location` should be the location of your company
- `type` defines the type of the paper and influences the title page if set to `thesis`, `study` or `report`. Setting the `type` parameter is optional.
- `assignment` should point to a PDF file containing the assignment to write a thesis. It will include the first page of the given PDF file at the appropriate place. Setting the `assignment` parameter is optional.
- `blocknotice` defines whether a blocknotice should be included or not if set to `false`. One will be included per default. Setting the `blocknotice` parameter is optional.

To add an abstract to the paper define a macro called `\basimpleabstract` which replacement text is the abstract's content. The following should do it (the `\addcontentsline` is optional):
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
 Importing additional packages with `\usepackage` while in "simple mode" might not work. If you need to load additional packages consider using the [normal mode](normal.html).
```

## Basic functionality

Sections can be created using the `\section{title},\subsection{title},\subsubsection{title}` commands.
The section titles are automatically added to the table of contents.
If you do not want that use the starred version of the command, e.g. `\section*{title not in table of contents}`.
Footnotes can be created as usual with `\footnote{content}`.
Abbreviations are managed by the glossaries package.
To define an abbreviation use `\newacronym{identifier}{short-form}{long-form}` before `\begin{document}` and to refer to it use `\gls{identifier}`.
```latex
\documentclass[...]{baarticle}

\newacronym{HTTP}{HTTP}{Hypertext Transfer Protocol}
\begin{document}
    \begin{basimple}[...]
        \section{Caption}
        \gls{HTTP} is a protocol on the OSI-Layer 7.\footnote{Also note that...}
    \end{basimple}
\end{document}
```
It is possible to refer to certain sections using `\label{identifier}`, which marks a certain (sub-)section, and `\ref{identifier}`, which inserts the section number.
By the way these references are also clickable links.
```latex
\documentclass[...]{baarticle}

\begin{document}
    \begin{basimple}[...]
        \section{Caption 1}
        \label{important}
        Something important.
        \section{Caption 2}
        % Would render to "As seen in section 1."
        As seen in section \ref{important}.
    \end{basimple}
\end{document}
```
Images can be included with `\includegraphics`, which should be wrapped in a `bafigure` environment.
The number of a figure can be retrieved using `\ref{caption}` with the caption provided to the environment.
`\includegraphics` has a lot of optional arguments, e.g. for rotating and scaling images.
Take a look [here](https://latexref.xyz/_005cincludegraphics.html).
Tables should also be wrapped in a `batable` environment.
```latex
\documentclass[...]{baarticle}

\begin{document}
    \begin{basimple}[...]
        \begin{bafigure}{caption}
            \includegraphics{path/to/an/image.png}
        \end{bafigure}
        As seen in figure \ref{caption} ...
        \begin{batable}{caption}
            % The page width is roughly 14cm
            \begin{tabular}{|p{6cm}|p{8cm}|}
                \hline
                A & B\\\hline
                C & D\\\hline
            \end{tabular}
        \end{batable}
    \end{basimple}
\end{document}
```
An appendix can be created using the `baappx` environment, which will also create an overview of all appendix entries.
Most environments introduced by this template feature some customization options, which are described in the [environments](./environments) section.
```latex
\documentclass[...]{baarticle}

\begin{document}
    % lots of content
    \begin{basimple}[...]
        \begin{baappx}
            \begin{bafigure}{caption}
                \includegraphics{path/to/an/image.png}
            \end{bafigure}
        \end{baappx}
    \end{basimple}
\end{document}
```
It is worthwhile to split up larger documents into multiple files.
You can put each chapter into a separate `.tex` file and join them in the main file using `\include{path/to/the/file}`.
Given the following file tree:
```text
somedirectory
|-baarticle.bbx
|-baarticle.cbx
|-baarticle.cls
|-baarticle.dtx
|-chapter1.tex
|-chapter2.tex
|-chapter3.tex
|-document.tex
|-ngerman-ba.lbx
```
This should work.
```latex
\documentclass[...]{baarticle}

\begin{document}
    \begin{basimple}[...]
        % leaving out the file extension is required for \include
        \include{chapter1}
        \include{chapter2}
        \include{chapter3}
    \end{basimple}
\end{document}
```

## Citations and bibliography
The template uses the biblatex package to deal with the bibliography and citations and provides customized styles for it, which are automatically loaded in simple mode.
Biblatex own its own has a load functionality, so feel free to consult their [documentation](https://ctan.mc1.root.project-creative.net/macros/latex/contrib/biblatex/doc/biblatex.pdf) and [cheatsheet](http://tug.ctan.org/info/biblatex-cheatsheet/biblatex-cheatsheet.pdf).

At first it is required to set up a bibliography database.
One needs to create a file with the `.bib` extension in the file tree.
```text
somedirectory
|-baarticle.bbx
|-baarticle.cbx
|-baarticle.cls
|-baarticle.dtx
|-document.bib
|-document.tex
|-ngerman-ba.lbx
```
That biliography file needs to be included in the main file before `\begin{document}` using `\addbibresource{document.bib}`.
Such file consists of multiple entries, which each requiring a type and a citekey.
This template covers the `@article`, `@book`, `@online`, `@collection`, `@incollection`, `@unpublished` with attributes as shown below.
```text
// cloudcomp is the citekey for this entry
@book{cloudcomp,
    author = {John W. Rittinghouse and James F. Ransome},
    title = {Cloud Computing},
    subtitle = {Implementation, Management and Security},
    location = {Boca Raton},
    year = {2018}
}
@article{clouderp,
    author = {Mohamed A. Abd Elmonem and Eman S. Nasr and Mervat H. Geith},
    title = {Benefits and challenges of cloud ERP systems},
    subtitle = {A systematic literature review},
    journal = {Future Computing and Informatics Journal},
    number = {1},
    year = {2016},
    pages = {1-9}
}
@online{itmgmtdef,
    author = {Olaf Resch},
    title = {IT-Management},
    subtitle = {...},
    url = {...},
    urldate = {2020-05-23},
    year = {2019}
}
// @collection and @incollection usally go together
@collection{reinheimercloud,
    title = {Cloud Computing},
    subtitle = {Die Infrastruktur der Digitalisierung},
    location = {Wiesbaden},
    year = {2018},
    publisher = {Stefan Reinheimer}
}
@incollection{hentschelcloud,
    author = {Raoul Hentschel and Christian Leyh},
    title = {Cloud Computing},
    subtitle = {Status quo, aktuelle Entwicklungen und Herausforderungen},
    // notice the crossref to the collection
    crossref = {reinheimercloud},
    pages = {3-30}
}
@unpublished{internal,
    author = { {Company with spaces in the name} },
    title = {Top Secret},
    year = {2021}
}
```
```warning
 Additional attributes should not be required and may use a wrong formatting. The same holds true for other entry types. Be aware.
```
Now one can create references in the `.tex` file.
Referring to sources in the text can be achieved with the `\bacite{citekey}` command for direct citations and the `\vglcite{citekey}` command for indirect citations.
`\enquote{content}` puts its argument in quotation marks.
The optional numbers given to the cite commands in the brackets describe the pages, where the information can be found in the sources.
Footnotes for citations and the final bibliography are generated automatically.
In case one needs to chain multiple cite commands one after another, they should be separated using `\textsuperscript{,}`.
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
