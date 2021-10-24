\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{pracalicencjacka}[2018/04/20 v0.0.0 Praca licencjacka]
\newif\ifmyclass@en
\ExecuteOptions{pl}
\ProcessOptions\relax

\RequirePackage[polish]{babel}
\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}
\RequirePackage{graphicx}
\usepackage{savesym}
\usepackage{nameref}
\usepackage{indentfirst}
\usepackage{float}
\usepackage[export]{adjustbox}
\usepackage{wrapfig}
\usepackage{interval}
\usepackage{amsmath}
\usepackage{hyperref}
\usepackage[utf8]{inputenc}
\usepackage{dirtytalk}
\usepackage{flexisym}
\usepackage{listings}
\usepackage{xcolor}
\usepackage{caption}
\usepackage{subcaption}
\usepackage{url}
\savesymbol{belowcaptionskip}
\savesymbol{abovecaptionskip}
\savesymbol{maketitle}
\usepackage{varwidth}

\lstset {
    language=C++,
    backgroundcolor=\color{yellow!5},
    basicstyle=\footnotesize,
}

\lstdefinestyle{customCppStyle}{
  language=C++,
  backgroundcolor=\color{yellow!5},
  numbers=left,
  stepnumber=1,
  numbersep=3pt,
  tabsize=2,
  showspaces=false,
  showstringspaces=false
}

\graphicspath{ {resources/} }

\def\@baseclass{report}
\def\@stopien{licencjat}
\def\@rodzajpracy{licencjacka}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{\@baseclass}}
\PassOptionsToClass{a4paper,twoside,openright,11pt}{\@baseclass}
\ProcessOptions

\LoadClass{\@baseclass}

\textwidth\paperwidth
\advance\textwidth -55mm
\oddsidemargin-1in
\advance\oddsidemargin 30mm
\evensidemargin-1in
\advance\evensidemargin 25mm
\topmargin -1in
\advance\topmargin 2cm
\setlength\textheight{48\baselineskip}
\addtolength\textheight{\topskip}
\marginparwidth15mm
\def\autor#1#2{\def\@imienazwisko{#1}\def\@album{#2}}

\newcommand*{\captionsource}[2]{
  \caption[{#1}]{
    #1
  }
  \textbf{Źródło:} #2
  \par\smallskip
  \begin{tabular}{|r|c|c|c|c|c|}

    \end{tabular}
}

\newcommand{\autorZAlbumem}[2]{\begin{minipage}{0.45\textwidth}\centering{\Large\bfseries #1}\\[2mm]Nr albumu: #2\end{minipage}\ }
	\renewcommand\maketitle{%
	  \begin{titlepage}%
		\let\footnotesize\small
		\let\footnoterule\relax
		\let \footnote \thanks
		\begin{center}
		  {\LARGE\textbf{Uniwersytet Jagielloński}\\
			Wydzia\l{} Fizyki, Astronomii i Informatyki Stosowanej\par}
		  \vspace{1cm plus .5fill}
		{
			\setlength{\parindent}{0em}
			\centering
			\ifx\@imienazwisko\empty\else\autorZAlbumem{\@imienazwisko}{\@album}\fi
		}

		  \vspace{8mm plus .5fill}
		  {\Huge\textbf{\@title}\par}
		  \vspace{8mm plus .1fill}
		  {\large\bf Praca \@rodzajpracy\\[3pt]
			na kierunku \MakeUppercase{\@kierunek} \\
			\@zakres \par}
		  \vspace{2cm plus 1.5fill}
		  \begin{flushright}\large
			\begin{tabular}{l}
			  Praca wykonana pod kierunkiem\\
			  \bfseries \@opiekun
			\end{tabular}
		  \end{flushright}
		  \vspace{1cm plus 1fill}
		  {\large \@date\par}
		\end{center}
		\@thanks
	  \end{titlepage}%
	  \begin{titlepage}
		\c@page=2
		\large
		\null
		\vfill
	  \end{titlepage}
	  \setcounter{footnote}{0}
	  \global\let\thanks\relax
	  \global\let\maketitle\relax
	  \global\let\@thanks\@empty
	  \global\let\@author\@empty
	  \global\let\@date\@empty
	  \global\let\@title\@empty
	  \global\let\title\relax
	  \global\let\author\relax
	  \global\let\date\relax
	  \global\let\and\relax
	}

	\def\nralbumu#1{\gdef\@nralbumu{#1}}
	\def\@nralbumu{???\ClassError{pracalicencjacka}{Brak numeru albumu}\@ehc}
	\def\kierunek#1{\gdef\@kierunek{#1}}
	\def\@kierunek{???\ClassError{pracalicencjacka}{Nie podano kierunku studiow}\@ehc}
	\def\zakres#1{\gdef\@zakres{w zakresie \MakeUppercase{#1}}}
	\def\@zakres{}
	\def\opiekun#1{\gdef\@opiekun{#1}}
	\def\@opiekun{???\ClassError{pracalicencjacka}{Brak danych opiekuna pracy}\@ehc}
	\def\keywords#1{\gdef\@keywords{#1}}
	\def\@keywords{???\ClassError{pracalicencjacka}{Brak slow kluczowych}\@ehc}
	\def\dziedzina#1{\gdef\@dziedzina{#1}}
	\def\@dziedzina{???\ClassError{pracalicencjacka}{Brak dziedziny Socrates-Erasmus}\@ehc}
	\def\klasyfikacja#1{\gdef\@klasyfikacja{#1}}
	\def\@klasyfikacja{???\ClassError{pracalicencjacka}{Brak klasyfikacji tematycznej}\@ehc}

	\def\cleardoublepage{\clearpage\if@twoside \ifodd\c@page\else
		\hbox{}\thispagestyle{empty}\newpage\if@twocolumn\hbox{}\newpage\fi\fi\fi}

	\renewcommand*\@seccntformat[1]{\csname the#1\endcsname.\enspace}
	\def\numberline#1{\hb@xt@\@tempdima{#1.\hfil}}
	\renewcommand*\l@chapter[2]{%
	  \ifnum \c@tocdepth >\m@ne
		\addpenalty{-\@highpenalty}%
		\vskip 1.0em \@plus\p@
		\setlength\@tempdima{1.5em}%
		\begingroup
		  \parindent \z@ \rightskip \@pnumwidth
		  \parfillskip -\@pnumwidth
		  \leavevmode \bfseries
		  \advance\leftskip\@tempdima
		  \hskip -\leftskip
		  #1\nobreak\mdseries
		  \leaders\hbox{$\m@th
			\mkern \@dotsep mu\hbox{.}\mkern \@dotsep
			mu$}\hfill
		  \nobreak\hb@xt@\@pnumwidth{\hss #2}\par
		  \penalty\@highpenalty
		\endgroup
	  \fi}

\endinput
