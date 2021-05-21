---
title: Useful Packages
sort: 4
---
# Useful Packages
Below is a list of packages to consider if you need support for a certain task.
## Syntax Highlighting
Check out [listings](https://ctan.org/pkg/listings) and [minted](https://ctan.org/pkg/minted).
The templates author would slightly recommend to use minted, as listings struggles with UTF-8 encoded files and missing highlighting for some common markups such as YAML.
Minted's highlighting is also more semantic, but minted requires `pygments`, which in turn requires python to be available, and requires passing the `--shell-escape` or `-enable-write18` flag depending on the TeX distribution to the latex compiler.
## Drawing UML diagramms
Check out [pst-uml](https://ctan.org/pkg/pst-uml), [pgf-umlcd](https://ctan.org/pkg/pgf-umlcd) and [pgf-umlsd](https://ctan.org/pkg/pgf-umlsd).
Alternativly use any tool you like and include an image.
## Embedding or attaching files
Check out [attachfile2](https://ctan.org/pkg/attachfile2), [embedfile](https://ctan.org/pkg/embedfile) and [navigator](https://ctan.org/pkg/navigator).
