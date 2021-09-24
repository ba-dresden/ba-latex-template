---
title: Index
---
# BA Dresden LaTeX template

A template, which tries to follow the [BA Dresden Styleguide](https://www.ba-dresden.de/fileadmin/dresden/downloads/zentrale-dokumente/LEITFADEN_webv2.pdf) as close as possible.
Papers and bachelors theses using this template have already passed assessments.
Built with love and sane defaults by Nuckal777.
If this template served you well, do not forget to click the star button on [GitHub](https://github.com/nuckal777/ba-latex-template).
It will be appreciated.

```warning
 The template might do things wrong and there is no warranty. It is your own responsibility to check for correctness.
```

It gets as simple as shown below.
The code creates a document containing a title page, block notice, table of contents, figures, abbreviations, tables, a bibliography and an affirmation statement, while setting up correct spacing and page numbering.
Anyway the template is rather customizable, if desired.
Hooked? Head over to the [quick start](./quickstart).

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
