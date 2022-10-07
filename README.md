# A LaTeX template for BA Dresden
This repository contains a LaTeX template, which tries to follow the [BA Dresden Styleguide](https://www.ba-dresden.de/fileadmin/dresden/downloads/zentrale-dokumente/LEITFADEN_webv2.pdf) as close as possible.
__The template might do things wrong and there is no warranty. It is your own responsibility to check for correctness.__

## Enduser Documentation

[Go here please](https://github.com/ba-dresden/ba-latex-template/blob/rewrite/docs/index.md). :rocket: This readme provides a development overview.

## Files

The source files are commented rather extensively.
- `baarticle.cls` describes the doument class and provides everything related to styling and spacing. Also defines certain environments.
- `baarticle.bbx` describes the formatting of bibliography entries and formatting.
- `baarticle.cbx` provides the citation style and commands.
- `baarticle.dbx` adjusts the biblates data model.
- `ngerman-ba.lbx` provides the required localization.

Modifications to the template can be tested by compiling the `minimal.tex` and `simple.tex` files. Some sort of unit tests are provided by the `test.tex` file, but LaTeX support for unit testing is very limited.

The documentation is build from the `docs` folder and served via GitHub Pages.

Originally crafted by [Nuckal777](https://github.com/Nuckal777).
