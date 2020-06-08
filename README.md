# A LaTeX template for BA Dresden
This repository contains a LaTeX template, which tries to follow the [BA Dresden Styleguide](https://www.ba-dresden.de/fileadmin/dresden/downloads/zentrale-dokumente/LEITFADEN_webv2.pdf) as close as possible.
__The template might do things wrong and there is no warranty. It is your own responsibility to check for correctness.__ Anyway, we try to make the template as good as possible. Papers using this template have already passed assessments.
## Table of Contents
- Motivation
- Usage
  - General usage information
  - Copy and Paste
  - Git repository template
  - Git submodule
- Macro reference
- Issues

## Motivation
Some general information about LaTeX, why you should use it for writing scientific papers, how to install and use it can be found [here](https://www.latex-project.org/about/) and [here](https://en.wikibooks.org/wiki/LaTeX/Introduction). For newcomers LaTeX might be overwhelming. Some arguments to justify the effort to get into LaTeX are listed below. A little preview can be found in example.pdf.

One major advantage is consistent formatting. If the template is correct, there cannot be any formatting errors. Following the styleguide, using correct spelling and grammar make up more than a half of the BA's assessment, you can basically pass any required scientific work without content but correct formatting.

One rule, which easily creates violations of the styleguide is that every citation after the first has to replace the author and year with "ebenda". You might do it once right and start copying blocks of text around later. Obviously, this will move citations and if inattentive violate the rule.

Moreover, this template sorts the abbreviations and provides the full term on the first occurrence automatically, creates compliant bibliography, creates compliant references on images and so on. It also includes additional style definitions (HCL and INI) for source code listings.

Additionally LaTeX can easily be used with version control systems. This makes working in a group super easy, because LaTeX separates the document's content from it's design (ever tried to merge 5 different styled word documents?). Furthermore, there are not a hundred different versions of you paper floating around. General tips and workflow recommendations about LaTeX with Git can be found is [this](https://stackoverflow.com/questions/6188780/git-latex-workflow) question on StackOverflow. If you are using GitHub reviews could be made via pull requests.

Unfortunately, the BA styleguide makes the usage of LaTeX unnecessarily hard. There is no style included in LaTeX, which fulfills the requirements of the BA. Thats why is repository has to exist.

## Usage
There are three options to use this repository:
- Copy and Paste (really simple but lacks a lot of utility features)
- GitHub repository template (still simple, allows your paper to be versioned with Git)
- Git submodule (advanced, but enables sort of a "autoupdate" and "customize" the template feature)

### General usage information
The main content of the paper should be placed in the definition of \bacontent. To split the content across multiple files, the usage of \include is recommended. The listingsext.tex should be used with \input in the definition of \bapredoc. The template uses the [glossaries package](https://ctan.org/pkg/glossaries) for the management of abbreviations. These have to defined with \newacronym in \bapredoc and referred to with \gls in \bacontent. The content of the abstract is definied in \baabstract. If you do not need an abstract, delete the whole command definition

For indirect citations use \vglcite and for direct citations use \bacite. Information about literature should be placed in a file called "document.bib". Use \bafigure for graphics and \batable for tables.

\basignature should point to an image with contains your signature. \baimg should point to an image, which is displayed on the title page. Use \par\noindent to get compliant paragraphs.

This repository includes a preconfigured SConstruct.py file to compile documents with [scons](https://scons.org/). Other build systems can be used too ([latexmk](https://mg.readthedocs.io/latexmk.html) is know to work). If you like to use [scons](https://scons.org/), read their documentation regarding the installation and usage.

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
- ```\bacite[PAGE]{SOURCE}``` creates a reference for a direct citation. Behaves like other biblatex cite commands.
  - SOURCE: identifier of the source as specified in the bibliography file
  - PAGE: pages which are referenced (optional)
- ```\vglcite[PAGE]{SOURCE}``` creates a reference for an indirect citation. Behaves like other biblatex cite commands.
  - SOURCE: identifier of the source as specified in the bibliography file
  - PAGE: pages which are referenced (optional)
- ```\bafigure[SOURCE]{NAME}{CONTENT}``` creates a frame and label around CONTENT and adds an entry to the list of figures
  - NAME: name of the figure
  - CONTENT: actual figure, e.g. ```\includegraphics``` or ```\begin{pspicture}..\end{pspicture}```
  - SOURCE: source of the figure. If omitted the author is consider as the source. (optional)
- ```\batable[SOURCE]{NAME}{CONTENT}``` puts CONTENT in a table environment and adds an entry to the list of table
  - NAME: name of the figure
  - CONTENT: actual table, e.g. ```\begin{tabular}..\end{tabular}```
  - SOURCE: source of the table. If omitted the author is consider as the source. (optional)

## Issues
If you encounter a problem or have a question, which __are related to the template__, feel free to open an Issue or provide a fix via a pull request.

__Happy Writing__