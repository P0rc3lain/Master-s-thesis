%
%  Copyright © 2022 Mateusz Stompór. All rights reserved.
%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{thesis-blueprint}[2021/10/24 v1.0.0 Master degree]
\newif\ifmyclass@en
\ExecuteOptions{pl}
\ProcessOptions\relax

\RequirePackage[polish]{babel}
\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}

\def\@baseclass{report}
\def\@stopien{magister}
\def\@rodzajpracy{magisterska}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{\@baseclass}}
\PassOptionsToClass{a4paper,twoside,openright,11pt}{\@baseclass}
\ProcessOptions
\LoadClass{\@baseclass}

\usepackage{fancyhdr}
\usepackage{graphicx}
\usepackage{indentfirst}
\usepackage{hyperref}
\usepackage{forest}
\usepackage{xurl}
\usepackage[nottoc,notlof]{tocbibind}
\usepackage{float}

% Fancy HDR configuration
\pagestyle{fancy}
\fancyhf{}
\fancyhead[L]{\rightmark}
\fancyhead[R]{\thepage}
\fancyheadoffset{0pt} 
\setlength{\headheight}{14pt}

\setcounter{tocdepth}{3}
\setcounter{secnumdepth}{3}
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

\newcommand{\autorZAlbumem}[2]{\begin{minipage}{0.45\textwidth}\centering{\Large\bfseries #1}\\[2mm]Numer albumu: #2\end{minipage}\ }
	\renewcommand\maketitle{
	  \begin{titlepage}
		\let\footnotesize\small
		\let\footnoterule\relax
		\let \footnote \thanks
		\begin{center}
		  {\LARGE\textbf{Uniwersytet Jagielloński w Krakowie}\\
		  	Wydzia\l{} Matematyki i Informatyki \par}
		  \vspace{0cm plus .5fill}
		  {Studia stacjonarne \par}
		  \vspace{1cm plus .5fill}
		{
			\setlength{\parindent}{0em}
			\centering
			\ifx\@imienazwisko\empty\else\autorZAlbumem{\@imienazwisko}{\@album}\fi
		}
        \vspace{8mm plus .5fill}
        \begin{figure}[H]
            \begin{center}
                \includegraphics[width=2.5cm]{images/ju-coat-of-arms.jpg}    
            \end{center}
        \end{figure}
          
		  \vspace{4mm plus .5fill}
		  {\Huge\textbf{\@title}\par}
		  \vspace{8mm plus .1fill}
		  {\large\bf Praca \@rodzajpracy\\[3pt]
			na kierunku \MakeUppercase{\@kierunek} \\
			\@zakres \par}
		  \vspace{2cm plus 1.5fill}
		  \begin{flushright}\large
			\begin{tabular}{l}
			  Opiekun pracy:\\
			  \bfseries \@opiekun
			\end{tabular}
		  \end{flushright}
		  \vspace{1cm plus 1fill}
		  {\large \@date\par}
		\end{center}
		\@thanks
	  \end{titlepage}
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
	\def\@nralbumu{???\ClassError{thesis}{Brak numeru albumu}\@ehc}
	\def\kierunek#1{\gdef\@kierunek{#1}}
	\def\@kierunek{???\ClassError{thesis}{Nie podano kierunku studiow}\@ehc}
	\def\zakres#1{\gdef\@zakres{w zakresie \MakeUppercase{#1}}}
	\def\@zakres{}
	\def\opiekun#1{\gdef\@opiekun{#1}}
	\def\@opiekun{???\ClassError{thesis}{Brak danych opiekuna pracy}\@ehc}
	\def\keywords#1{\gdef\@keywords{#1}}
	\def\@keywords{???\ClassError{thesis}{Brak slow kluczowych}\@ehc}
	\def\dziedzina#1{\gdef\@dziedzina{#1}}
	\def\@dziedzina{???\ClassError{thesis}{Brak dziedziny Socrates-Erasmus}\@ehc}
	\def\klasyfikacja#1{\gdef\@klasyfikacja{#1}}
	\def\@klasyfikacja{???\ClassError{thesis}{Brak klasyfikacji tematycznej}\@ehc}

	\def\cleardoublepage{\clearpage\if@twoside \ifodd\c@page\else
		\hbox{}\thispagestyle{empty}\newpage\if@twocolumn\hbox{}\newpage\fi\fi\fi}

	\renewcommand*\@seccntformat[1]{\csname the#1\endcsname.\enspace}
	\def\numberline#1{\hb@xt@\@tempdima{#1.\hfil}}
	\renewcommand*\l@chapter[2]{
	  \ifnum \c@tocdepth >\m@ne
		\addpenalty{-\@highpenalty}
		\vskip 1.0em \@plus\p@
		\setlength\@tempdima{1.5em}
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
