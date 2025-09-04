# A LaTeX template for DHSN Dresden

This repository contains a LaTeX template, which tries to follow the [DHSN Dresden Styleguide](https://www.ba-dresden.de/fileadmin/M3__BA_Dresden/downloads/zentrale-dokumente/Leitfaden_wissentschaftliche_Arbeiten.pdf) as close as possible.
**The template might do things wrong and there is no warranty. It is your own responsibility to check for correctness.**

## Enduser Documentation

[Go here please](https://ba-dresden.github.io/ba-latex-template/). :rocket: This README provides a development overview.

## Files

The source files are commented rather extensively.

- `baarticle.cls` describes the document class and provides everything related to styling and spacing. Also defines certain environments.
- `baarticle.bbx` describes the formatting of bibliography entries and formatting.
- `baarticle.cbx` provides the citation style and commands.
- `baarticle.dbx` adjusts the biblatex data model.
- `ngerman-ba.lbx` provides the required localization.

Modifications to the template can be tested by compiling the `minimal.tex` and `simple.tex` files. Some sort of unit tests are provided by the `test.tex` file, but LaTeX support for unit testing is very limited.

The documentation is build from the `docs` folder and served via GitHub Pages.

## Formatting

To ensure consistent formatting use the [`.editorconfig`](./.editorconfig) and [`.prettierrc`](./.prettierrc) files.

The following file types are formatted using Prettier:

- Markdown
- YAML
- Ruby
- HTML

All LaTeX related files are formatted using the `latexindent` module.

The following vs code extensions are helpful to format the files:

- [EditorConfig](https://marketplace.visualstudio.com/items?itemName=EditorConfig.EditorConfig)
- [Prettier](https://marketplace.visualstudio.com/items?itemName=esbenp.prettier-vscode)

Originally crafted by [Nuckal777](https://github.com/Nuckal777).
