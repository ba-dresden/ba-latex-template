---
title: Template
sort: 2
---
# Template Setup

## Download
This is the easiest way to use the template. Head over to the [Release](https://github.com/Nuckal777/ba-latex-template/releases) page and grab the latest version of the template. Create a directory, where you will write your paper. Create a file with the `.tex` extension, e.g. `document.tex`. The directory structure should look like this:
```text
somedirectory
|-baarticle.bbx
|-baarticle.cbx
|-baarticle.cls
|-baarticle.dtx
|-document.tex
|-ngerman-ba.lbx
```
Done! (Still you have to get the required image as described below.)

## GitHub Template
```warning
 Please ensure you are allowed to use GitHub.
```
Go to the templates [repository](https://github.com/Nuckal777/ba-latex-template) and click the green "Use this template" button. Follow the instructions. Afterwards clone your repository and create a file with the `.tex` extension, e.g. `document.tex`. The directory structure should similar to the one described in the Download section.

## Git Submodule
Read about [submodules](https://git-scm.com/book/en/v2/Git-Tools-Submodules). Create an empty repository and add [this](https://github.com/Nuckal777/ba-latex-template) one as a submodule. Create a document.tex in the main repository. This approach allows you to always use the newest version of the template by executing ```git pull``` in the submodule's directory. You can receive notifications when the template's repository is updated by clicking on the "Watch" button. To add the submodule directory to the LaTeX search path add the absolute path of the template directory to the `TEXINPUTS` environment variable before compiling.

## Systemwide installation
Clone the templates [repository](https://github.com/Nuckal777/ba-latex-template) somewhere on your computer. To add the templates directory to the LaTeX search path add the absolute path of the template directory to the `TEXINPUTS` environment variable before compiling.

# Get the required image
The titlepage uses the BA Dresden's logo. It can be found [here](https://www.ba-dresden.de/die-akademie/zentrale-einrichtungen/marketing-pr-kommunikation). Put it next to the other files.
