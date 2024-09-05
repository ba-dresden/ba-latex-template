% Document class implementing the BA Dresden Styleguide
\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{baarticle}[2021/09/24 v1.0.0]

% Process package options
\RequirePackage{xkeyval} % for key value processing
\RequirePackage{etoolbox} % for csdef, csundef, ifdefempty, toggles, etc ...
\newtoggle{baclssimple} % toggles are false per default
\newtoggle{baclslinkcoloring} % toggles are false per default
\newtoggle{baclsheader} % toggles are false per default

% first name of the author
\DeclareOptionX[BA]{first}{\def\@baclsfirst{#1}}
% last name of the author
\DeclareOptionX[BA]{last}{\def\@baclslast{#1}}
% company the author works at
\DeclareOptionX[BA]{company}{\def\@baclscompany{#1}}
% location of the university
\DeclareOptionX[BA]{location}{\def\@baclslocation{#1}}
% if specified the class will load additional packages and provide the basimple environment, which simplifies the setup
\DeclareOptionX[BA]{simple}[usesimple]{\toggletrue{baclssimple}}
% if specified links will be colored
\DeclareOptionX[BA]{linkcoloring}[uselinkcoloring]{\toggletrue{baclslinkcoloring}}
% if specified title will be shown in the header
\DeclareOptionX[BA]{header}[useheader]{\toggletrue{baclsheader}}
% if specified header title is changed to tis provided title
\DeclareOptionX[BA]{headertitle}[no header title provided for headertitle option | it's recommended to use a maximum lentgth of 80 characters to prevent this overflow]{\def\@baclsheadertitle{#1}}

\DeclareOptionX*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptionsX[BA]\relax

% Class is based on the deault article class
\LoadClass[12pt]{article}

% Load required packages
\RequirePackage{iftex} % to check the TeX engine in use
\ifpdftex
\RequirePackage[T1]{fontenc} % change the fontencoding so people can copy accented characters properly from the compiled document
\RequirePackage{lmodern} % swap the font so that the fontencoding change does not screw up letter kerning
\fi
\iftoggle{baclsheader}{ % adjust the page top spacing depending on whether header is shown or not
    \RequirePackage[a4paper,left=3cm,right=2cm,top=3cm,bottom=2cm]{geometry} % for paper size and page spacing
}{
    \RequirePackage[a4paper,left=3cm,right=2cm,top=2cm,bottom=2cm]{geometry} % for paper size and page spacing
}
\RequirePackage{setspace} % for line spacing
\RequirePackage{float} % for H placement directive in \begin{figure}
\RequirePackage{tocloft} % to adjust the ToC, LoF and LoT
\RequirePackage{fancyhdr} % to adjust headers and footers
\RequirePackage{graphicx} % to use includegraphics
\RequirePackage[font={footnotesize},justification=centering]{caption} % to make captions smaller and keep long captions centered
\RequirePackage{wrapfig} % to place text wrapping floats
\RequirePackage{tocbibind} % adds ToC entries for ToC, LoF, LoT, etc ...
\RequirePackage[bottom,hang]{footmisc} % to keep footnotes always on the bottom and to fix multiline indentation
\RequirePackage[all]{nowidow} % to eliminate widows and orphans
\RequirePackage{titlesec} % to reduce section spacing
\RequirePackage{lipsum}% just to generate text for the example

% Load additional packages if in simple mode
\iftoggle{baclssimple}{
    \RequirePackage{pdfpages}
    \RequirePackage[english,main=ngerman]{babel}
    \RequirePackage[autostyle=true,german=quotes]{csquotes}
    \RequirePackage[style=baarticle]{biblatex}
    \RequirePackage{hyperref}
    \RequirePackage[style=alttree,nogroupskip,nonumberlist,nopostdot,nolong,nosuper,nolist]{glossaries}

    \iftoggle{baclslinkcoloring}{
    % hyperref config
        \hypersetup{
            colorlinks=true,
            linkcolor=blue,
            filecolor=magenta,
            urlcolor=cyan,
        }
    } {
    % no coloring required, do nothing
    }
} {
% not in simple, do nothing
}

% set spacing for sections
\titlespacing*{\section}
{0pt}{0pt}{0pt}
\titlespacing*{\subsection}
{0pt}{0pt}{0pt}
% {0pt}{1ex minus .2ex}{1ex plus .2ex}

% Set paragraph indentation
\setlength{\parindent}{0pt}
% Set spacing after paragraphs
\setlength{\parskip}{\baselineskip}
% Set line spread
\onehalfspacing

% Table of contents Style
\renewcommand{\cftsecleader}{\cftdotfill{\cftdotsep}} % Linie for chapters
\renewcommand{\cftsecdotsep}{\cftdot}

% List of figures Style
\renewcommand{\cftfigpresnum}{Abbildung }
\renewcommand{\cftfigaftersnum}{:}
\newlength{\fignumspacing} % a "scratch" length
\settowidth{\fignumspacing}{\bfseries\cftfigpresnum\cftfigaftersnum} % extra space
\addtolength{\cftfignumwidth}{\fignumspacing} % add the extra space
\setlength{\cftfigindent}{0pt}

% List of Tables Style
\renewcommand{\cfttabpresnum}{Tabelle }
\renewcommand{\cfttabaftersnum}{:}
\newlength{\tabnumspacing} % a "scratch" length
\settowidth{\tabnumspacing}{\bfseries\cfttabpresnum\cfttabaftersnum} % extra space
\addtolength{\cfttabnumwidth}{\tabnumspacing} % add the extra space
\setlength{\cfttabindent}{0pt}

% List of Appendix (LoA)
% The related commands will refer to 'appx' as the appendix command is already defined by LaTeX
\newcommand{\listappxname}{Anhangverzeichnis}
\newlistof{appx}{loa}{\listappxname}
\newcommand{\addtoappx}[1]{%
    \refstepcounter{appx}
    \addcontentsline{loa}{appx}{\protect\numberline{\theappx}#1}\par
}
\renewcommand{\cftloatitlefont}{\Large\bfseries}
\renewcommand{\cftappxpresnum}{Anhang }
\renewcommand{\cftappxaftersnum}{:}
\newlength{\appxnumspacing} % a "scratch" length
\settowidth{\appxnumspacing}{\bfseries\cftappxpresnum\cftappxaftersnum} % extra space
\addtolength{\cftappxnumwidth}{\appxnumspacing} % add the extra space

% Change pagestyle of "normal" pages to fancy
\pagestyle{fancy}
% Change pagestyle of ToC pages to fancy
\tocloftpagestyle{fancy}
% \renewcommand{\headrulewidth}{0pt}

% Start with roman page numbering
\pagenumbering{Roman}

% Define keys for the title page
% path to an image, placed in the top right corner
\define@key[BA]{title}{img}{\def\@batitleimg{#1}}
% course attended at the university
\define@key[BA]{title}{course}{\def\@batitlecourse{#1}}
% title of the paper
\define@key[BA]{title}{title}{\def\@batitletitle{#1}}
% number of the author
\define@key[BA]{title}{number}{\def\@batitlenumber{#1}}
% correctors
\define@key[BA]{title}{corrector}{\edef\@batitlecorrector{#1}}
% date when the theme of the paper was announced
\define@key[BA]{title}{themedate}{\def\@batitlethemedate{#1}}
% date when the paper has been handed in
\define@key[BA]{title}{returndate}{\def\@batitlereturndate{#1}}
% type of paper (thesis etc...)
\define@key[BA]{title}{type}{\def\@batitletype{#1}}
\presetkeys[BA]{title}{type=undefined}{}

% Clear the header and footer
\fancyhead{}
\fancyfoot{}

\iftoggle{baclsheader}{
    \begingroup\expandafter\expandafter\expandafter\endgroup
    \expandafter\ifx\csname @baclsheadertitle\endcsname\relax
        \fancyhead[L]{\@batitletitle} % \@baclsheadertitle is undefined or \relax
    \else
        \fancyhead[L]{\@baclsheadertitle} % \@baclsheadertitle is set
    \fi
    % Default \headrulewidth is 0.4pt
    \renewcommand{\headrulewidth}{0.4pt}
}

\fancyfoot[R]{\thepage}
% Default \footrulewidth is 0pt
% \renewcommand{\footrulewidth}{0.4pt}


% helper macro to print the list of correctors comma seperated
\newcommand{\printcorrectors}[1]{
    \@for\next:=#1\do
    {Gutachter: \next\\}%
}

% helper macro to convert @baclstype to an actual text
\newcommand{\@bapapertype}{%
% need to expand @bapapertype as ifdefstring does not do that
    \edef\@bapapertest{\@batitletype}%
    \ifdefstring{\@bapapertest}{thesis}{%
        Bachelorarbeit\\
        zur Erlangung des Abschlusses Bachelor of Science\\
        im Studiengang \@batitlecourse\\[\baselineskip]%
    }{} % \ifdefstring
    \ifdefstring{\@bapapertest}{study}{%
        Studienarbeit\\[\baselineskip]%
    }{}%
    \ifdefstring{\@bapapertest}{report}{%
        Belegarbeit\\[\baselineskip]%
    }{}%
}

% Title Page
\newcommand{\mktitle}[1]{
    \setkeys[BA]{title}{#1}
    \begin{titlepage}
        \begin{wrapfigure}[3]{r}{0.5\textwidth}
            \begin{center}
                \vspace{-18pt}
                \includegraphics[width=0.5\textwidth]{\@batitleimg}
            \end{center}
        \end{wrapfigure}
        \noindent
        \normalsize
        Berufsakademie Sachsen \\
        Staatliche Studienakademie \@baclslocation{} \\
        Studiengang \@batitlecourse{} \\
        \par
        %%        \vspace{4cm}
        \vspace*{\fill}
        \begin{center}
            \Huge
            \textbf{\@batitletitle}
            \par
            \vspace{\fill}
            \normalsize
            \@bapapertype{}
            \@baclslast{}, \@baclsfirst \\
            \@baclscompany{}\\
            Matrikelnummer: \@batitlenumber{}
            \vspace{\fill}
        \end{center}
        \vfill
        \printcorrectors{\@batitlecorrector}\\
        Tag der Themenübergabe: \@batitlethemedate \\
        Tag der Einreichung: \@batitlereturndate
        \vfill
    \end{titlepage}
    \addtocounter{page}{1}
}

% Define keys for the blocking notice
% signature of the author
\define@key[BA]{block}{signature}{\def\@bablocksignature{#1}}
% date when the paper is handed in
\define@key[BA]{block}{date}{\def\@bablockdate{#1}}
% where the company is located at
\define@key[BA]{block}{location}{\def\@bablocklocation{#1}}

% Blocking notice
\newcommand{\mkblocknotice}[1]{
    \setkeys[BA]{block}{#1}
    % do not print page number on blocking notice
    \thispagestyle{empty}
    \subsubsection*{Sperrvermerk}
    Die vorliegende Arbeit enthält vertrauliche Daten des Unternehmens \@baclscompany{}.
    Auf Wunsch des Unternehmens \@baclscompany{} ist die vorliegende Arbeit für die öffentliche Nutzung zu sperren.
    Veröffentlichung, Vervielfältigung und Einsichtnahme sind ohne ausdrückliche Genehmigung des Unternehmens \@baclscompany{}, in \@bablocklocation{} und des Verfassers \@baclsfirst{} \@baclslast{} nicht gestattet.
    Die Arbeit ist nur den Gutachtern und den Mitgliedern des Prüfungsausschusses zugänglich zu machen.
    \bigskip\par
    \begin{wrapfigure}[1]{r}{0.3\textwidth}
        \begin{center}
            \vspace{-32pt}
            \includegraphics[width=0.28\textwidth]{\@bablocksignature}
        \end{center}
    \end{wrapfigure}
    \bigskip
    \par\noindent
    \@baclslocation{}, \@bablockdate{}
    \par\noindent
    Ort, Datum\hfill Unterschrift des Verfassers
    \clearpage
}

% Define keys for the affirmation
% signature of the author
\define@key[BA]{affirmation}{signature}{\def\@baaffirsignature{#1}}
% date when the paper is handed in
\define@key[BA]{affirmation}{date}{\def\@baaffirdate{#1}}

% Affirmation
\newcommand{\mkaffirmation}[1]{
    \setkeys[BA]{affirmation}{#1}
    % do not print page number on affirmation
    \thispagestyle{empty}
    \subsubsection*{Eidesstattliche Erklärung}
    Ich erkläre an Eides statt, dass ich die vorliegende Arbeit selbständig und ohne unerlaubte fremde Hilfe angefertigt, andere als die angegebenen Quellen und Hilfsmittel nicht benutzt habe.
    Die aus fremden Quellen direkt oder indirekt übernommenen Stellen sind als solche kenntlich gemacht.
    Die Zustimmung des Partnerunternehmens in der Praxis zur Verwendung betrieblicher Unterlagen habe ich eingeholt.
    Die Arbeit wurde bisher in gleicher oder ähnlicher Form keiner anderen Prüfungsbehörde vorgelegt und auch nicht veröffentlicht.
    \bigskip\par
    \begin{wrapfigure}[1]{r}{0.3\textwidth}
        \begin{center}
            \vspace{-32pt}
            \includegraphics[width=0.28\textwidth]{\@baaffirsignature}
        \end{center}
    \end{wrapfigure}
    \bigskip
    \par\noindent
    \@baclslocation{}, \@baaffirdate{}
    \par\noindent
    Ort, Datum\hfill Unterschrift des Verfassers
}

% Frontmatter
% prints ToC, LoF and LoT and swaps to arabic pagenumbering afterwards
% the argument defines how to print the list of abbreviations, as there
% exist multiple packages to handle abbreviations
\newcommand{\mkfrontmatter}[1]{
    \tableofcontents
    \clearpage
    \listoffigures
    \clearpage
    #1
    \clearpage
    \listoftables
    \clearpage
    \pagenumbering{arabic}
}

% Define basimple environment if in simple mode
\iftoggle{baclssimple}{
% Specify environment keys
% path to an image, placed in the top right corner
    \define@key[BA]{simple}{img}{\def\@basimpleimg{#1}}
    % course attended at the university
    \define@key[BA]{simple}{course}{\def\@basimplecourse{#1}}
    % title of the paper
    \define@key[BA]{simple}{title}{\def\@basimpletitle{#1}}
    % number of the author
    \define@key[BA]{simple}{number}{\def\@basimplenumber{#1}}
    % correctors
    \define@key[BA]{simple}{corrector}{\def\@basimplecorrector{#1}}
    % date when the theme of the paper was announced
    \define@key[BA]{simple}{themedate}{\def\@basimplethemedate{#1}}
    % date when the paper has been handed in
    \define@key[BA]{simple}{returndate}{\def\@basimplereturndate{#1}}
    % signature of the author
    \define@key[BA]{simple}{signature}{\def\@basimplesignature{#1}}
    % where the company is located at
    \define@key[BA]{simple}{location}{\def\@basimplelocation{#1}}
    % type of the paper (thesis etc...)
    \define@key[BA]{simple}{type}{\def\@basimpletype{#1}}
    % path to thesis assignment (must be a pdf file)
    \define@key[BA]{simple}{assignment}{\def\@basimpleassignment{#1}}
    % whether to include the blocknotice or not
    \define@boolkey[BA]{simple}{blocknotice}[true]{}

    \presetkeys[BA]{simple}{type=undefined,blocknotice=true}{}

    % adjust glossary styling
    \renewcommand{\glossarypreamble}{\glsfindwidesttoplevelname[\currentglossary]}
    \setacronymstyle{long-short}
    \renewcommand{\glossarysection}[2][]{}
    \makenoidxglossaries

    \newenvironment{basimple}[1][]{
        \setkeys[BA]{simple}{#1}
        \mktitle{
            title=\@basimpletitle,
            img=\@basimpleimg,
            course=\@basimplecourse,
            number=\@basimplenumber,
            corrector=\@basimplecorrector,
            themedate=\@basimplethemedate,
            returndate=\@basimplereturndate,
            type=\@basimpletype,
        }
        \ifdefvoid{\@basimpleassignment}{
        % no assignment file set, do nothing
        }{
            \includepdf[pages={1}]{\@basimpleassignment}
        }
        \ifBA@simple@blocknotice
        \mkblocknotice{
            signature=\@basimplesignature,
            date=\@basimplereturndate,
            location=\@basimplelocation
        }
        \fi
        \ifdefvoid{\basimpleabstract}{}{
            \section*{Abstract}
            \basimpleabstract
            \clearpage
        }
        \mkfrontmatter{
            \singlespacing
            \section*{Abkürzungsverzeichnis}
            \addcontentsline{toc}{section}{Abkürzungsverzeichnis}
            \vspace{-1cm}
            \printnoidxglossaries
            \onehalfspacing
        }
        }{
        \printbibliography[heading=bibintoc]
        \clearpage
        \mkaffirmation{
            signature=\@basimplesignature,
            date=\@basimplereturndate
        }
    }
}{
% not in simple mode, do nothing
}

% Appendix environment
% Toggle defining if the baappx environment is active
\newtoggle{baclsappx}
\newenvironment{baappx}{
    \toggletrue{baclsappx}
    \phantomsection
    \addcontentsline{toc}{section}{Anhangverzeichnis}
    \listofappx
    \clearpage
    \section*{Anhang}
    \addcontentsline{toc}{section}{Anhang}
    }{
    \clearpage
    \togglefalse{baclsappx}
}

% Specify environment keys
% Reference to the source
\define@key[BA]{env}{source}[]{\def\@baenvsource{#1}}
% Label to use with \ref
\define@key[BA]{env}{label}[]{\def\@baenvlabel{#1}}
% Placement directive, defaults to H of package float
\define@key[BA]{env}{placement}{\def\@baenvplacement{#1}}
\presetkeys[BA]{env}{placement=H,source,label}{}

% Environment caption
% Somehow is use of global variables is required here, because otherwiese 
% the \edef tests cause a stack overflow
\newcommand{\@bacaption}{%
    \ifdefempty{\@baenvsource}{%
        \@baenvtitle\space(Quelle: eigene Darstellung)%
    }{%
        \@baenvtitle\space(Quelle: \@baenvsource)%
    }%
}

% \begin{bafigure}[source=SOURCE,placement=htb,label=LABEL]{title}
% bafigure puts a frame around its content and adds a source reference below the figure
% also adds a label which equals the given title
\newsavebox{\@bafigurebox}
\newenvironment{bafigure}[2][]{
\setkeys[BA]{env}{#1}
\csdef{@basource}{\@baenvsource}
\csdef{@baenvtitle}{#2}
% the stuff below for begin figure is required because it is
% required to expand the placement modifier instantly
\def\efigure{\begin{figure}}%
\expandafter\efigure\expandafter[\@baenvplacement]
\begin{lrbox}{\@bafigurebox}
    \begin{minipage}{0.98\textwidth}
        \begin{center}
        }{
        \end{center}
    \end{minipage}
\end{lrbox}
\fbox{\usebox{\@bafigurebox}}
\iftoggle{baclsappx}{
    \addtoappx{\@baenvtitle}
    \begin{center}
        \vspace{-10pt}
        \small
        Anhang \theappx{}: \@bacaption
    \end{center}
} {
    \caption[\@baenvtitle]{\@bacaption}
}
\ifdefempty{\@baenvlabel}{
    \label{\@baenvtitle}
}{
    \label{\@baenvlabel}
}
\end{figure}
\csundef{@basource}
\csundef{@baenvtitle}
}

% \begin{batable}[source=SOURCE,placement=htb,label=LABEL]{title}
% batable centers the content and adds a source reference below the table
% also adds a label which equals the given title
\newenvironment{batable}[2][]{
\setkeys[BA]{env}{#1}
\csdef{@basource}{\@baenvsource}
\csdef{@baenvtitle}{#2}
% the stuff below for begin table is required because it is
% required to expand the placment modifier instantly
\def\etable{\begin{table}}%
\expandafter\etable\expandafter[\@baenvplacement]
\begin{center}
}{
\end{center}
\iftoggle{baclsappx}{
\addtoappx{\@baenvtitle}
\begin{center}
\vspace{-10pt}
\small
Anhang \theappx{}: \@bacaption
\end{center}
} {
\caption[\@baenvtitle]{\@bacaption}
}
\ifdefempty{\@baenvlabel}{
\label{\@baenvtitle}
}{
\label{\@baenvlabel}
}
\end{table}
\csundef{@basource}
\csundef{@baenvtitle}
}
