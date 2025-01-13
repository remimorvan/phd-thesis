\ProvidesClass{tufte-book-custom}[2024/11/22]

\input{tufte-book.cls}

\setlength\marginparpush{1.15em} % More vpsace between sidenotes.

% ---
% Narrower margins
% ---

\ifthenelse{\boolean{@tufte@afourpaper}}
  {\geometry{a4paper,left=18mm,top=23.4mm,headsep=1.5\baselineskip,textwidth=119mm,marginparsep=8mm,marginparwidth=47mm,textheight=47\baselineskip,headheight=\baselineskip,footskip=2\baselineskip}}
  {}


% ---
% Title formats
% ---

\RequirePackage{pgfornament}
\titleformat{\part}%
  [display]% shape
  {\vspace{4cm}\relax\ifthenelse{\NOT\boolean{@tufte@symmetric}}{\begin{fullwidth}}{}}% format applied to label+text
  {\centering\scshape\LARGE{Part~\thepart}}% label
  {0pt}% horizontal separation between label and title body
  {\centering\Huge\rmfamily\itshape\setlength{\parindent}{0pt}}% before the title body
  [\ifthenelse{\NOT\boolean{@tufte@symmetric}}{\hspace{56mm}\pgfornament[width=6cm]{88}\end{fullwidth}}{}]% after the title body

% \renewcommand{\thechapter}{\Roman{chapter}}
\titleformat{\chapter}%
  [display]% shape
  {\relax\ifthenelse{\NOT\boolean{@tufte@symmetric}}{\begin{fullwidth}}{}}% format applied to label+text
  {\scshape\LARGE{Chapter~{\Huge\color{maincolor}\thechapter}}}% label
  {0pt}% horizontal separation between label and title body
  {\huge\rmfamily\itshape}% before the title body
  [\ifthenelse{\NOT\boolean{@tufte@symmetric}}{\end{fullwidth}}{}]% after the title body


% ---
% Title contents
% ---

\ifthenelse{\boolean{@tufte@toc}}{%
  \renewcommand{\thepart}{\arabic{part}} % Part number in arabic numerals
  \titlecontents{part}% FIXME
    [0em] % distance from left margin
    {\vspace{1\baselineskip}\begin{fullwidth}\large\rmfamily\bfseries\scshape\partname~} % above (global formatting of entry)
    {\contentslabel{1cm}} % before w/label (label = ``II'')
    {} % before w/o label
    {\rmfamily\upshape\qquad\thecontentspage} % filler + page (leaders and page num)
    [\end{fullwidth}] % after
  \renewcommand{\thechapter}{\Roman{chapter}} % Chapter number in roman numerals
  \titlecontents{chapter}%
    [0em] % distance from left margin
    {\vspace{.75\baselineskip}\begin{fullwidth}\large\rmfamily\itshape} % above (global formatting of entry)
    {\hspace*{1cm}\contentslabel{1cm}} % before w/label (label = ``2'')
    {\hspace*{1cm}} % before w/o label
    {\rmfamily\upshape\qquad\thecontentspage} % filler + page (leaders and page num)
    [\end{fullwidth}] % after
  \titlecontents{section}% FIXME
    [0em] % distance from left margin
    {\vspace{0\baselineskip}\begin{fullwidth}\normalsize\rmfamily\itshape} % above (global formatting of entry)
    {\hspace*{2cm}\contentslabel{1cm}} % before w/label (label = ``2.6'')
    {\hspace*{2cm}} % before w/o label
    {\rmfamily\upshape\qquad\thecontentspage} % filler + page (leaders and page num)
    [\end{fullwidth}] % after
  \titlecontents{subsection}% FIXME
    [0em] % distance from left margin
    {\vspace{0\baselineskip}\begin{fullwidth}\small\rmfamily\itshape} % above (global formatting of entry)
    {\hspace*{3.5cm}\contentslabel{1.5cm}} % before w/label (label = ``2.6.1'')
    {\hspace*{3.5cm}} % before w/o label
    {\rmfamily\upshape\qquad\thecontentspage} % filler + page (leaders and page num)
    [\end{fullwidth}] % after
}{}


% ---
% Header
% ---

% The `plain' page style is used on chapter opening pages.
% Page number in footing.
\fancypagestyle{plain}{
  \fancyhf{} % clear header and footer fields
  \fancyfoot[C]{\thepage}
}

% Chapter number in heading (left).
% Section in heading (right). 
% Page number in footing.
\renewcommand\mainmatter{%
  \if@openright%
    \cleardoublepage%
  \else%
    \clearpage%
  \fi%
  \@mainmattertrue%
  \fancyhf{}%
  \ifthenelse{\boolean{@tufte@twoside}}%
    {% two-side
      \renewcommand{\chaptermark}[1]{\markboth{\thechapter. ##1}{}}%
      \fancyhead[LE]{\smallcaps{\newlinetospace{\leftmark}}}% chapter title
      \renewcommand{\sectionmark}[1]{\markright{\thesection. ##1}{}}%
      \fancyhead[RO]{\smallcaps{\newlinetospace{\rightmark}}}% section title
      \fancyfoot[C]{\thepage}
    }%
    {% one-side
      \fancyhead[RE,RO]{\smallcaps{\newlinetospace{\plaintitle}}\quad\thepage}% book title
    }%
}

% ---
% Black font in margin (fix bug with hyperref)
% see https://tex.stackexchange.com/questions/199797/sidenotes-and-marginnotes-change-color-when-hyperlinks-break-over-a-line-in-tuft
% ---
\ifthenelse{\boolean{@tufte@sfsidenotes}}
  {\renewcommand{\@tufte@marginfont}{\normalfont\color{black}\footnotesize\sffamily}}
  {\renewcommand{\@tufte@marginfont}{\normalfont\color{black}\footnotesize}}


% ---
% Enumitem
% ---

\RequirePackage{enumitem}
\setlist{noitemsep,nosep}

% ---
% Custom fonts 
% ---

\RequirePackage{amsmath}
\RequirePackage{amssymb}
% \RequirePackage{latexsym}
\RequirePackage{mathtools} % cases* environment 
\RequirePackage{fontenc}
\RequirePackage{unicode-math}

\setmainfont{Libertinus Serif}
\setsansfont{Libertinus Sans}
\setmonofont[Scale=0.8]{Libertinus Mono}
\setmathfont[math-style=TeX]{Asana Math}
\setmathfont[math-style=TeX, range={frak, bb}]{TeX Gyre Termes Math}
\setmathfont[math-style=TeX, range={cal, bfcal}]{Latin Modern Math}