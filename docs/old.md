---
title: Pre-rewrite Docs
---
# Pre-rewrite Documentation
```note
 This is just a copy of old readme file. You should consider upgrading to the rewritten version for serveral reasons. Firstly the new version can compiled using the standard pdflatex. Secondly `bafigure` and `batable` are now environments with customizable placement and labels. Additional some not strictly required packages have been removed and the usage and extension got overall easier. Also the new version fixes a bug regarding the bibliography.
```
## Usage
There are three options to use this repository:
- Copy and Paste (really simple but lacks a lot of utility features)
- GitHub repository template (still simple, allows your paper to be versioned with Git)
- Git submodule (advanced, but enables sort of a "autoupdate" and "customize" the template feature)

### General usage information
The main content of the paper should be placed in the definition of \bacontent. To split the content across multiple files, the usage of \include is recommended. The listingsext.tex should be used with \input in the definition of \bapredoc. The template uses the [glossaries package](https://ctan.org/pkg/glossaries) for the management of abbreviations. These have to defined with \newacronym in \bapredoc and referred to with \gls in \bacontent. The content of the abstract is definied in \baabstract. If you do not need an abstract, delete the whole command definition.

For indirect citations use \vglcite and for direct citations use \bacite. Information about literature should be placed in a file called "document.bib". Use \bafigure for graphics and \batable for tables.

\basignature should point to an image with contains your signature. \baimg should point to an image, which is displayed on the title page. Use \par\noindent to get compliant paragraphs.

### Copy and Paste
Download the files you need:
- template.tex for the template
- vars.tex to adjust the template for your paper
- listingsext.tex if you need support for HCL and INI with the "listings" package
- SConstruct.py if you need something to compile your document

Put all of them in one directory. Create a document.tex file with the following content below. Customize the vars.tex to your liking.
```latex
\input{vars.tex}
\input{template.tex}
```
Compilation can now be done by executing ```scons``` in a terminal.

### GitHub repository template
A guide to create a repository from a template can be found [here](https://help.github.com/en/github/creating-cloning-and-archiving-repositories/creating-a-repository-from-a-template). The initialization of a document.tex file is required and can be done with the steps described in the "Copy and Paste" section. __You might have to create a private repository or are not allowed to use GitHub at all for your paper.__ Compilation can now be done by executing ```scons``` in a terminal.

### Git submodule
Read about [submodules](https://git-scm.com/book/en/v2/Git-Tools-Submodules). Create an empty repository and add this one as a submodule. Create a document.tex in the main repository. Inputs have to respect the nested folder. Please replace "folder" with the actual directory.
```latex
% You should create a custom branch in the submodule to rely on the import below
% Otherwise should copy the content of vars.tex into document.tex and customize them straight in the document.tex file
\input{folder/vars.tex}
\input{folder/template.tex}
```
Compilation can now be done by executing ```scons -f folder/SConstruct.py``` in a terminal. This approach allows you to always use the newest version of the template by executing ```git pull``` in the submodule's directory. You can receive notifications when the template's repository is updated by clicking on the "watch" button.

### Compilation

The template needs to compiled with ```xelatex``` instead of ```pdflatex```, which should be the default for most editors. Please search the internet on how to change the compiler in your favourite editor.

> This caused by import of the [pst-uml](https://ctan.org/pkg/pst-uml) package with allows setting UML-diagrams through [pstricks](https://ctan.org/pkg/pstricks-base). Otherwise additional packages would need to be included or additional programs need to be invoked during the compilation.

Generally speaking, the compilation is not done with invoking ```xelatex``` once. To be safe the document should be passed through ```xelatex -> biber -> xelatex -> xelatex``` in that order. ```biber``` is required to make citations work. This chain may be become longer, if you have special needs (e.g. sorting the glossary externally with ```makeglossaries```).

To reduce the burden of maintaining the compilation toolchain, one might use build systems. This repository includes a preconfigured SConstruct.py file to compile this template with [scons](https://scons.org/). Other build systems can be used too ([latexmk](https://mg.readthedocs.io/latexmk.html) with the flag ```--xelatex``` is know to work). If you like to use [scons](https://scons.org/), read their documentation regarding the installation and usage. Usally ```scons -f pathto/SConstruct.py thetexfile.tex``` is sufficient.

## Macro reference

### Expected predefined macros
- ```\bafirstname``` should evaluate to the author's first name/s.
- ```\balastname``` should evaluate to the author's last name.
- ```\banumber``` should evaluate to the author's matriculation number.
- ```\bacourse``` should evaluate to the author's course of studies.
- ```\bacorrector``` should evaluate to a comma separated list of all correctors.
- ```\bacompany``` should evaluate to the name of the company the author works at.
- ```\bacompanyplace``` should evaluate to the post code and city of the company the author works at.
- ```\basignature``` should evaluate to a path relative to the final documents root documents, which contains an image of the author's signature.
- ```\baimg``` should evaluate to a path relative to the final documents root documents, which contains the logo of the BA, which can be found [here](https://www.ba-dresden.de/die-akademie/zentrale-einrichtungen/marketing-pr-kommunikation).
- ```\batitle``` should evaluate to the title of the paper.
- ```\bathemedate``` should evaluate to the date, when the paper was announced.
- ```\bareturndate``` should evaluate to the date, when the paper was handed in.
- The content of ```\bapredoc``` is placed before the ```\begin{document}...\end{document}``` block inside the template. That is usefull for stuff, which cannot reside inside that block. A common usecase is the definition of abbreviations with ```\newacronym```.
- ```\bacontent``` should evaluate to the actual content of the paper. It is recommend to use ```\include``` to split the actual content across multiple files.

### Optional predefined macros
- ```\baabstract``` can evaluate to the abstract of the paper. If no abstract is required the macro definition should be deleted as leaving it empty results in an empty abstract.

### Utility macros
These should be used within the ```\bacontent``` macro.
- ```\bacite[PAGE]{SOURCE}``` creates a reference for a direct citation. Behaves like other biblatex cite commands.
  - SOURCE: identifier of the source as specified in the bibliography file
  - PAGE: pages which are referenced (optional)
- ```\vglcite[PAGE]{SOURCE}``` creates a reference for an indirect citation. Behaves like other biblatex cite commands.
  - SOURCE: identifier of the source as specified in the bibliography file
  - PAGE: pages which are referenced (optional)
- ```\bafigure[SOURCE]{NAME}{CONTENT}``` creates a frame and label around CONTENT and adds an entry to the list of figures
  - NAME: name of the figure
  - CONTENT: actual figure, e.g. ```\includegraphics``` or ```\begin{pspicture}..\end{pspicture}```
  - SOURCE: source of the figure. If omitted the author is considered as the source. (optional)
- ```\batable[SOURCE]{NAME}{CONTENT}``` puts CONTENT in a table environment and adds an entry to the list of table
  - NAME: name of the figure
  - CONTENT: actual table, e.g. ```\begin{tabular}..\end{tabular}```
  - SOURCE: source of the table. If omitted the author is considered as the source. (optional)

## Example

```latex
\newcommand{\bafirstname}{Firstname}
\newcommand{\balastname}{Lastname}
\newcommand{\banumber}{1337}
\newcommand{\bacorrector}{Corrector1,Corrector2}
\newcommand{\bacompany}{Company}
\newcommand{\bacompanyplace}{12345 Somewhere}
\newcommand{\bacourse}{Something}
% Own signature
\newcommand{\basignature}{empty.png}
% BA logo
\newcommand{\baimg}{empty.png}
% city of BA
\newcommand{\baplace}{Somewhere}
% title
\newcommand{\batitle}{title of the paper}
% day when the title of the paper was announced
\newcommand{\bathemedate}{1. Januar 1990}
% day when the paper was finished
\newcommand{\bareturndate}{1. Februar 1990}
\newcommand{\bapredoc}{
    % define a new abbreviation
    \newacronym{HTTP}{HTTP}{Hypertext Transfer Protocol}
}
% abstract
% to remove the abstract page, delete the whole \baabstract definition
\newcommand{\baabstract}{
    That is the abstract.
}
% content of the paper
\newcommand{\bacontent}{
    \section{One Section}
    % \gls expands a abbreviation definition
    SomeContent abc def ghi jkl 1957 \gls{HTTP}.
    \subsection{Nested section}
    This one is nested\vglcite[11-13]{example} 37€.
    \bafigure[eine besondere Quelle]{Der Name}{Inhalt der Figur}
    \clearpage
}
\input{pathtotemplate/template.tex}
```