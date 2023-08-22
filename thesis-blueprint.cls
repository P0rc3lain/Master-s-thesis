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
	  
		% \centering

		% \centering
		% \begin{figure}[H]
		\thispagestyle{empty}
		\begin{center}
		\includegraphics[scale=0.2]{images/ju-coat-of-arms.jpg}    
		\end{center}

		\begin{center}
		\large
		Uniwersytet Jagielloński\\
		Wydział Matematyki i Informatyki\\
		\smallskip
		\huge
		Instytut Informatyki i Matematyki Komputerowej\\

		\bigskip
		\large
		Studia dziennie
		\end{center}

		\begin{center}
		\large
		Kierunek: Informatyka\\
		Specjalność: Informatyka Stosowana
		\end{center}

		\bigskip
		\bigskip
		\bigskip
		\begin{center}
		\Large  
		Mateusz Stompór
		\end{center}

		\bigskip
		\bigskip
		\begin{center}
		\Large
		\textbf{}

		% \bigskip
		% \bigskip
		% \bigskip
		% \bigskip
		% \bigskip
		\large
		Praca magisterska\\
		\medskip
		\LARGE
		\textbf{Projekt i implementacja silnika grafiki trójwymiarowej w środowisku sprzętowym Apple}
		\end{center}

		\vfill
		\begin{center}
		\Large
		Opiekun: dr Henryk Telega
		\end{center}

		\medskip
		\begin{center}
		\footnotesize
		Opracowano zgodnie z Ustawą o prawie autorskim i prawach pokrewnych z dnia 4 lutego 1994 r. (Dz.U.
		1994 nr 24 poz. 83) wraz z nowelizacją z dnia 25 lipca 2003 r. (Dz.U. 2003 nr 166 poz. 1610) oraz z dnia
		1 kwietnia 2004 r. (Dz.U. 2004 nr 91 poz. 869)

		\Large
		\medskip
		Kraków 2023
		\end{center}

		\normalsize
		\clearpage
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
