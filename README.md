# A LaTeX template for BA Dresden
This repository contains a LaTeX template, which tries to follow the [BA Dresden Styleguide](https://www.ba-dresden.de/fileadmin/dresden/downloads/zentrale-dokumente/LEITFADEN_webv2.pdf) as close as possible.
__The template might do things wrong and there is no warranty. It is your own responsibility to check for correctness.__ Anyways we try to make the template as good as possible. Papers using this template have already passed assesments.
## Table of Contents
- Motivation
- Usage
  - Copy and Paste
  - Git repository template
  - Git submodule
- Issues

## Motivation
Some general information about LaTeX, why you should use it for writing scientific papers, how to install and use it can be found [here](https://www.latex-project.org/about/) and [here](https://en.wikibooks.org/wiki/LaTeX/Introduction). For newcomers LaTeX might be overwhelming. Some arguments to justify the effort to get into LaTeX are listed below. A little preview can be found in example.pdf.

One major advantage is consistent formating. If the template is correct, there cannot be formating errors. Because following the styleguide, using correct spelling and grammar make up more than a half of the BA assesment, you can basically pass any required scientific work without content but correct formating.

One rule, which easily creates violations of the styleguide is that every citation after the first has to replace the author and year with "ebenda". You might to it one time right and start copying textblocks around later. Obviously this will move citations and if unattentive violate the rule.

Moreover this template, sorts automatically the abbreviations and provides the full term on the first occurence, creates compliant bibliography, creates compliant references on images and so on. It also includes additional style definitions (HCL and INI) for source code listings.

Additionally LaTeX can easily be used with version control systems. This makes group work super easy (once again, consitent formating, ever tried to merge 5 different styled word documents?) and there are not hundred different versions of you paper floating around. General tips and workflow recommendation can be found is [this](https://stackoverflow.com/questions/6188780/git-latex-workflow) question on StackOverflow. If you are able to use GitHub even reviews of the paper can happen via pull requests.

Unfortunately, the BA styleguide makes the usage of LaTeX unnecessarly very hard. There is no style included in LaTeX, which fulfills the requirements of the BA. Thats why is repsository has to exist.

## Usage
There are three options to use this repository:
- Copy and Paste (really simple but lacks a lot of utility features)
- GitHub repository template (still simple, allows your paper to be versioned with Git)
- Git submodule (advanced, but enables sort of a "autoupdate" and "customize" the template feature)

### General usage information
The main content of the work should be placed in the definition of \bacontent. To split it across multiple other files, the usage of \include is recommended. The listingsext.tex should be used with \input in the definition of \bapredoc. This repository includes a preconfigured SConstruct file to compile documents with [scons](https://scons.org/). If you like to use it, read their documentation on installing and usage.

\basignature should point to an image with contains your signature.
\baimg should point to an image, which is displayed on the title page. Use \par\noindent to get compliant paragraphs.

For indirect citations use \vglcite and for direct citations use \bacite. Use \bafigure for graphics and \batable for tables.

### Copy and Paste
Download the files you need:
- template.tex for the template
- vars.tex to make the template ready for your paper
- listingsext.tex if you need support for HCL and INI with the "listings" package
- SConstruct.py if you need something to compile your document (other build systems should work too, if properly configured)

Put all of them in one directory. Create a document.tex file with the following content below. Customize the vars.tex to your liking.
```latex
\input{vars.tex}
\input{template.tex}
```
Compilation can now be done by executing ```scons``` in a terminal.

### GitHub repository template
A guide to create a repo from template can be found [here](https://help.github.com/en/github/creating-cloning-and-archiving-repositories/creating-a-repository-from-a-template). The initalization of a document.tex file is required and can be done with the steps described in the "Copy and Paste" section. __You might have to create a private repository or are not allowed to use GitHub at all for your paper.__ Compilation can now be done by executing ```scons``` in a terminal.

### Git submodule
Read about [submodules](https://git-scm.com/book/en/v2/Git-Tools-Submodules). Create an empty repository and add this one as a submodule. Create a document.tex in the main repository. Inputs have to respect the nested folder. Please replace "folder" with the actual directory.
```latex
% You should create a custom branch in the submodule to rely on the import below
\input{folder/vars.tex}
% Otherwise should copy the content of vars.tex into document.tex and customize them straight in the document
\input{folder/template.tex}
```
Compilation can now be done by executing ```scons -f folder/SConstruct.py``` in a terminal. Using this approach also you to always use the newest version of the template by executing ```git pull``` in the submodule.


## Issues
If you encounter a problem, which __is related to the template__, feel free to open an Issue or provide a fix via a pull request.

__Happy Writing__