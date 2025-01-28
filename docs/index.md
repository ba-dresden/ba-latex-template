---
title: Index
---
# DHSN Dresden LaTeX template

A template, which tries to follow the
[DHSN Dresden Styleguide](https://dresden.ba-sn.de/fileadmin/M3__BA_Dresden/downloads/zentrale-dokumente/Leitfaden_wissentschaftliche_Arbeiten.pdf)
as close as possible.
Papers and bachelors theses using this template have already passed assessments.
Built with love and sane defaults by [Nuckal777](https://github.com/Nuckal777).
Minor adjustments come from Steffen Greiffenberg [sgreiffenberg](https://github.com/sgreiffenberg).
If this template served you well, do not forget to click the star button on
[GitHub](https://github.com/ba-dresden/ba-latex-template).
It will be appreciated.

```warning
 The template might do things wrong and there is no warranty. It is your own responsibility to check for correctness.
```

It gets as simple as shown below.
The code creates a document containing a title page, block notice, table of contents, figures, abbreviations, tables,
a bibliography and an affirmation statement, while setting up correct spacing and page numbering.
Anyway the template is rather customizable, if desired.
Hooked? Head over to the [quick start](quickstart.md).

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
        type=thesis
    ]
        \section{Caption}
        Here is the content of paper.
        \clearpage
    \end{basimple}
\end{document}
```
