\ProvidesClass{resume}[2010/07/10 v0.9 Resume class]

\LoadClass[letterpaper]{article} % Font size and paper type

\usepackage{multicol}


\usepackage{fontawesome}
\usepackage{lmodern}

\usepackage{fontspec}
\setmainfont{Georgia}

\usepackage[parfill]{parskip} % Remove paragraph indentation
\usepackage{array} % Required for boldface (\bf and \bfseries) tabular columns
\usepackage{ifthen} % Required for ifthenelse statements
\usepackage{color,soul}
\sethlcolor{lightgray}
\usepackage{tabularx} % Add tabularx package
% \usepackage[left=0.4 in,top=0.4in,right=0.4 in,bottom=0.4in]{geometry} % Document margins
\usepackage[left=0.3 in,top=0.3in,right=0.3 in,bottom=0.3in]{geometry} % Document margins


\usepackage{tikz}

\usepackage{hyperref}
\hypersetup{
    colorlinks=true,
    linkcolor=blue,
    filecolor=magenta,      
    urlcolor=blue,
}

\pagestyle{empty} % Suppress page numbers

%----------------------------------------------------------------------------------------
%	HEADINGS COMMANDS: Commands for printing name and address
%----------------------------------------------------------------------------------------

\def \name#1{\def\@name{#1}} % Defines the \name command to set name
\def \@name {} % Sets \@name to empty by default

\def \position#1{\def\@position{#1}} % Defines the \position command to set position
\def \@position {} % Sets \@position to empty by default

\def \technologies#1{\def\@technologies{#1}} % Defines the \technologies command to set technologies
\def \@technologies {} % Sets \@technologies to empty by default
\def\technologiessize{\large} % Size of the technologies text
\def\technologiesskip{\smallskip} % The space after the technologies line at the top


\def \addressSep {\hspace{5mm}} % Adjust the horizontal spacing between addresses here

% \def \addressSep {$\diamond$} % Set default address separator to a diamond

% One, two or three address lines can be specified 
\let \@addressone \relax
\let \@addresstwo \relax
\let \@addressthree \relax

% \address command can be used to set the first, second, and third address (last 2 optional)
\def \address #1{
  \@ifundefined{@addresstwo}{
    \def \@addresstwo {#1}
  }{
  \@ifundefined{@addressthree}{
  \def \@addressthree {#1}
  }{
     \def \@addressone {#1}
  }}
}

% \printaddress is used to style an address line (given as input)
\def \printaddress #1{
  \begingroup
    \def \\ {\addressSep\ }
    \centerline{#1}
  \endgroup
  \par
  \addressskip
}

% % \printname is used to print the name as a page header
% \def \printname {
%   \begingroup
%     \hfil{\MakeUppercase{\namesize\bf \@name}}\hfil
%     \nameskip\break
%   \endgroup
% }

% \printname is used to print the name as a page header
\def \printposition {
  \begingroup
    \hfil{\MakeUppercase{\namesize\bf \@position}}\hfil
    \nameskip\break
  \endgroup
}

% % \printposition is used to print the position as a page header
% \def \printposition {
%   \begingroup
%   \hfil\centerline{\positionsize\bf \@position}\hfil
%     \positionskip\break
%   \endgroup
% }

% \printposition is used to print the position as a page header
\def \printtechnologies {
  \begingroup
  \hfil\centerline{\positionsize\bf \@technologies}\hfil
    \positionskip\break
  \endgroup
}

% New command to print technologies
\def \printname {
  \begingroup
  \hfil\centerline{\technologiessize\bf \@name}\hfil
    \technologiesskip\break
  \endgroup
}


%----------------------------------------------------------------------------------------
%	PRINT THE HEADING LINES
%----------------------------------------------------------------------------------------

\let\ori@document=\document
\renewcommand{\document}{
  \ori@document  % Begin document
  % \printname % Print the name specified with \name
  % \printtechnologies 
  % \printposition
  \printposition
  \printtechnologies 
  \printname % Print the name specified with \name
  \@ifundefined{@addressone}{}{ % Print the first address if specified
    \printaddress{\@addressone}}
  \@ifundefined{@addresstwo}{}{ % Print the second address if specified
    \printaddress{\@addresstwo}}
     \@ifundefined{@addressthree}{}{ % Print the third address if specified
    \printaddress{\@addressthree}}
}




%----------------------------------------------------------------------------------------
%	SECTION FORMATTING
%----------------------------------------------------------------------------------------

% Defines the rSection environment for the large sections within the CV
\newenvironment{rSection}[1]{ % 1 input argument - section name
  \sectionskip
  \MakeUppercase{{\bf #1 }} % Section title
  \sectionlineskip
  \hrule % Horizontal line
  \begin{list}{}{ % List for each individual item in the section
    \setlength{\leftmargin}{0em} % Margin within the section
  }
  \item[]
}{
  \end{list}
}


%----------------------------------------------------------------------------------------
%	WORK EXPERIENCE FORMATTING
%----------------------------------------------------------------------------------------

\newenvironment{rSubsection}[4]{ % 4 input arguments - company name, year(s) employed, job title and location
 {\bf #1} \hfill {#2} % Bold company name and date on the right
 \ifthenelse{\equal{#3}{}}{}{ % If the third argument is not specified, don't print the job title and location line
  \\
  {\em #3} \hfill {\em #4} % Italic job title and location
  }\smallskip
  \begin{list}{$\cdot$}{\leftmargin=0em} % \cdot used for bullets, no indentation
   \itemsep -0.5em \vspace{-0.5em} % Compress items in list together for aesthetics
  }{
  \end{list}
  \vspace{0.5em} % Some space after the list of bullet points
}

% The below commands define the whitespace after certain things in the document - they can be \smallskip, \medskip or \bigskip
\def\namesize{\LARGE} % Size of the name at the top of the document
\def\positionsize{\Large}
\def\addressskip{\smallskip} % The space between the two address (or phone/email) lines
\def\sectionlineskip{\medskip} % The space above the horizontal line for each section 
\def\nameskip{\medskip} % The space after your name at the top
\def\positionskip{\medskip} % The space after your position at the top
\def\sectionskip{\medskip} % The space after the heading section
