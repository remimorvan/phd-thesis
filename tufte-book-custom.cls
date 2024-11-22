\ProvidesClass{tufte-book-custom}[2024/11/22]

\input{tufte-book.cls}

% ---
% Narrower margins
% ---

\ifthenelse{\boolean{@tufte@afourpaper}}
  {\geometry{a4paper,left=16mm,top=27.4mm,headsep=2\baselineskip,textwidth=120mm,marginparsep=8mm,marginparwidth=50mm,textheight=48\baselineskip,headheight=\baselineskip}}
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
  {\centering\Huge\rmfamily\itshape}% before the title body
  [\ifthenelse{\NOT\boolean{@tufte@symmetric}}{\vspace{2cm}\hfill\pgfornament[width=6cm]{123}\hfill\end{fullwidth}}{}]% after the title body

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
  \titlecontents{part}% FIXME
    [0em] % distance from left margin
    {\vspace{1\baselineskip}\begin{fullwidth}\LARGE\rmfamily\itshape} % above (global formatting of entry)
    {\contentslabel{1cm}} % before w/label (label = ``II'')
    {} % before w/o label
    {\rmfamily\upshape\qquad\thecontentspage} % filler + page (leaders and page num)
    [\end{fullwidth}] % after
  \titlecontents{chapter}%
    [0em] % distance from left margin
    {\vspace{.75\baselineskip}\begin{fullwidth}\Large\rmfamily\itshape} % above (global formatting of entry)
    {\hspace*{1cm}\contentslabel{1cm}} % before w/label (label = ``2'')
    {\hspace*{1cm}} % before w/o label
    {\rmfamily\upshape\qquad\thecontentspage} % filler + page (leaders and page num)
    [\end{fullwidth}] % after
  \titlecontents{section}% FIXME
    [0em] % distance from left margin
    {\vspace{0\baselineskip}\begin{fullwidth}\large\rmfamily\itshape} % above (global formatting of entry)
    {\hspace*{2cm}\contentslabel{1cm}} % before w/label (label = ``2.6'')
    {\hspace*{2cm}} % before w/o label
    {\rmfamily\upshape\qquad\thecontentspage} % filler + page (leaders and page num)
    [\end{fullwidth}] % after
  \titlecontents{subsection}% FIXME
    [0em] % distance from left margin
    {\vspace{0\baselineskip}\begin{fullwidth}\normalsize\rmfamily\itshape} % above (global formatting of entry)
    {\hspace*{2.5cm}\contentslabel{1.5cm}} % before w/label (label = ``2.6.1'')
    {\hspace*{2.5cm}} % before w/o label
    {\rmfamily\upshape\qquad\thecontentspage} % filler + page (leaders and page num)
    [\end{fullwidth}] % after
  \titlecontents{paragraph}% FIXME
    [0em] % distance from left margin
    {\vspace{0\baselineskip}\begin{fullwidth}\small\rmfamily\itshape} % above (global formatting of entry)
    {\hspace*{3cm}\contentslabel{2cm}} % before w/label (label = ``2.6.0.0.1'')
    {\hspace*{3cm}} % before w/o label
    {\rmfamily\upshape\qquad\thecontentspage} % filler + page (leaders and page num)
    [\end{fullwidth}] % after
}{}