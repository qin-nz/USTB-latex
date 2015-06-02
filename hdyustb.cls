\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{hdyustb}[5/11/2014 demo]

\newif\ifHDY@interim
\newif\ifHDY@opening
\newif\ifHDY@tasklist

\DeclareOption{interim}{\HDY@interimtrue}
\DeclareOption{opening}{\HDY@openingtrue}
\DeclareOption{tasklist}{\HDY@tasklisttrue}

\ProcessOptions\relax
\LoadClassWithOptions{ctexbook}

\RequirePackage{geometry}%版面设置宏包，使用\newgeometry设置
\RequirePackage{caption}%图表标题宏包
\RequirePackage{fontspec}%字体设置（可以设置西文和中文）
\RequirePackage{titlesec}
\RequirePackage{titletoc}
\RequirePackage{amsmath,amsthm,amsfonts,amssymb,bm}% math packages
\RequirePackage{tabularx}% table packages
\RequirePackage{mdwlist}%item减少行间距
\RequirePackage{graphicx}% graphics packages
\RequirePackage{calc}%计算
\RequirePackage[sort&compress,numbers]{natbib}%压缩/排序参考文献
\RequirePackage{hypernat}%?超链接
\RequirePackage{footnote}
%\RequirePackage{listings}%程序代码环境

%----------------------------插图/表格----------------------------
\DeclareCaptionFont{songwu}{\songti\zihao{5}}
\RequirePackage[font=songwu,labelsep=quad]{caption}%图表标题

\AtEndOfPackage{\makeatletter\input{hdyustb.cfg}\makeatother}


%----------------------------设置引用参考文献时上标的格式----------------------------
\let\oldcitep\citep
\newcommand{\citen}[2][]{\textsuperscript{\oldcitep{#2}#1}}
\renewcommand{\citep}{\citen}
%----------------------------参考文献----------------------------
\renewcommand{\bibname}{参~考~文~献}
\bibsep=0pt
%----------------------------修改 目录 格式----------------------------
\ifHDY@opening
  \renewcommand{\contentsname}{\songti\zihao{3}\centerline {目\qquad 录}\vspace{20pt}}
\else
  %\renewcommand{\contentsname}{\bf\heiti\zihao{4}\centerline {目\qquad 录}}
  \renewcommand{\contentsname}{\bf\songti\zihao{-3}\centerline {目\qquad 录}}%这里只有“目录”的字体和其他的不一样
\fi
%目录中章节序列只有数字
\CTEXsetup[name={,},number={\arabic{chapter}}]{chapter}
%目录格式（近似Word）
\titlecontents{chapter}[0pt]{\songti\zihao{-4}}{\contentspush{\thecontentslabel~}}{}{\titlerule*[3pt]{.}\contentspage}[\addvspace{4pt}]
\titlecontents{section}[2em]{\songti\zihao{-4}}{\contentspush{\thecontentslabel~}}{}{\titlerule*[3pt]{.}\contentspage}[\addvspace{4pt}]
\titlecontents{subsection}[4em]{\songti\zihao{-4}}{\contentspush{\thecontentslabel~}}{}{\titlerule*[3pt]{.}\contentspage}[\addvspace{4pt}]
\titlecontents{figure}[0pt]{\songti\zihao{-4}}{\contentspush{图~\thecontentslabel~}}{}{\titlerule*[3pt]{.}\contentspage}[\addvspace{4pt}]
\titlecontents{table}[0pt]{\songti\zihao{-4}}{\contentspush{表~\thecontentslabel~}}{}{\titlerule*[3pt]{.}\contentspage}[\addvspace{4pt}]

%插图或附表的标题
\renewcommand{\ext@table}{lof} %将附表的内容写入图的.lof文件，从而生成混合目录
\renewcommand{\listfigurename}{\bf\heiti\zihao{4}\centerline {插图或附表清单}}

% TODO 有很大问题
%\newcommand\listfiguresandtablesname{\bf\heiti\zihao{4}\centerline {插图和附表清单}}
%\newcommand\listoffiguresandtables
%{
%\section{\listfiguresandtablesname}
%    \@starttoc{lot}%
%    \@starttoc{lof}
%}

% ---------------------------- 声明 announce begin ----------------------------
\newenvironment{announce}{%
\songti\zihao{4}%
\titleformat{\section}{\bf\centering\songti\zihao{-2}}{}{0pt}{}
\phantomsection
\section*{声\quad 明}
\addcontentsline{toc}{chapter}{声\qquad 明}
\vspace{3ex}
\fancyfoot[C]{}
}%
{}
% ---------------------------- 声明 announce end ----------------------------




%---------------------------- 引言 foreword begin ----------------------------
\newenvironment{foreword}
{
\titleformat{\section}{\bf\centering\heiti\zihao{4}}{}{0pt}{}
\phantomsection
\section*{引\quad 言}
\addcontentsline{toc}{chapter}{引\qquad 言}
\vspace{3ex}
\fancyfoot[C]{-\thepage-}
}{}
%---------------------------- 引言 foreword end  ----------------------------




% ---------------------------- 中英文摘要 begin ----------------------------
\newenvironment{cn_abstract}
                            {
                            \titleformat{\section}{\bf\centering\heiti\zihao{4}}{}{0pt}{}
                            \phantomsection
                            \section*{摘\quad 要}
                            \addcontentsline{toc}{chapter}{摘\qquad 要}
                            \fancyfoot[C]{-\thepage-}
                            %\abstract
                            }{\newpage}

\newcommand\cnkeywords[1]{\vspace{2ex}\noindent{\songti\zihao{-4}\bf 关键词：} #1}

\newenvironment{en_abstract}{
                            \titleformat{\section}{\bf\centering\heiti\zihao{4}}{}{0pt}{}
                            \phantomsection

                            \section*{Abstract}
                            \addcontentsline{toc}{chapter}{Abstract}
                            \fancyfoot[C]{-\thepage-}
                            }{}

\newcommand\enkeywords[1]{\vspace{2ex}\noindent{\bf Key Words:~} #1}
% ---------------------------- 中英文摘要 end ----------------------------



% ----------------------------结论 conclusion begin ----------------------------
\newenvironment{conclusion}
{
\titleformat{\chapter}{\bf\centering\heiti\zihao{4}}{}{0pt}{}
\phantomsection
\chapter*{结\qquad 论}
\addcontentsline{toc}{chapter}{结\qquad 论}
\vspace{3ex}
\fancyfoot[C]{-\thepage-}
}{}
% ----------------------------结论 conclusion end ----------------------------


% ----------------------------在学取得成果 achievement begin ----------------------------
\newenvironment{achievement}
{
\titleformat{\chapter}{\bf\centering\heiti\zihao{4}}{}{0pt}{}
\phantomsection
\chapter*{在~学~取~得~成~果}
\addcontentsline{toc}{chapter}{在~学~取~得~成~果}
\vspace{3ex}
\fancyfoot[C]{-\thepage-}
}{}
% ----------------------------在学取得成果 achievement end ----------------------------

% ----------------------------致谢 gratitude begin ----------------------------
\newenvironment{gratitude}
{
\titleformat{\chapter}{\bf\centering\heiti\zihao{4}}{}{0pt}{}
\phantomsection
\chapter*{致\qquad 谢}
\addcontentsline{toc}{chapter}{致\qquad 谢}
\vspace{3ex}
\fancyfoot[C]{-\thepage-}
}{}
% ----------------------------在学取得成果 gratitudet end ----------------------------


% ---------------------------- 设置页眉 ----------------------------
%% fancy
  \pagestyle{fancy}
  {
 \fancyhf{}
 \ifHDY@interim
  \fancyhead[C]{\zihao{5}北京科技大学本科生毕业设计(论文)中期报告}
  \else \ifHDY@opening
 \fancyhead[C]{\zihao{5}北京科技大学本科生毕业设计(论文)选题报告}
 \else \ifHDY@tasklist
  \fancyhead[C]{\zihao{4}\bf\songti 毕\quad 业\quad 设\quad 计（论\quad 文）任\quad 务\quad 书\vspace{1em} }
	\pagenumbering{Roman}
	\renewcommand{\headrulewidth}{0.6pt}
	\renewcommand{\footrulewidth}{1pt}
  \else
    \fancyhead[C]{\zihao{5}北京科技大学本科生毕业设计（论文）}
   \fi
  \fi
 \fi
\fancyfoot[C]{-\thepage-}
  }

  %修改章标题页的版式不一致(plain) %%%,不应用于任务书
  \fancypagestyle{plain}
 % \headheight{14pt}
  {
  \fancyhf{}
 \ifHDY@interim
  \fancyhead[C]{\zihao{5}北京科技大学本科生毕业设计(论文)中期报告}
  \else \ifHDY@opening
 \fancyhead[C]{\zihao{5}北京科技大学本科生毕业设计(论文)选题报告}
 \else \ifHDY@tasklist
   \fancyhead[C]{\zihao{4}毕~业~设~计（论~文）任~务~书}
	\pagenumbering{Roman}
	\renewcommand{\headrulewidth}{0.6pt}
	\renewcommand{\footrulewidth}{1pt}
  \else
    \fancyhead[C]{\zihao{5}北京科技大学本科生毕业设计（论文）}
   \fi
  \fi
 \fi
 %不能在这使用pagenumbering{arabic}命令，否则页面会重置为1
  \fancyfoot[C]{-\thepage-}
    }

% ---------------------------- 版面设置----------------------------
\ifHDY@tasklist
  \oddsidemargin = -1pt
  \topmargin = -38pt
  \headsep = 35pt
  \textheight = 700pt
  \textwidth = 455pt
  \marginparsep = 10pt
  \marginparwidth = 35pt
  \footskip = 10pt
  \marginparpush = 7pt
\else
%设置页边距
\newgeometry{left=3.5cm,right=2cm,bottom=2.5cm,top=3.5cm}
\fi


% ---------------------------- 设置标题格式----------------------------
\titleformat{\chapter}{\bf\heiti\zihao{4}}{\thechapter~}{0pt}{}
\titleformat{\section}{\bf\heiti\zihao{-4}}{\thesection~}{0pt}{}
\titleformat{\subsection}{\bf\songti\zihao{-4}}{\thesubsection~}{0pt}{}
%论文一级标题使用黑体4号字
%二级标题使用黑体小４号字%
%三级标题使用加黑宋体小４号字

%四级标题 不应出现，故改变样式
%无效
\titleformat{\subsubsection}{\songti\zihao{-4}}{\alpha{subsubsection}~}{0pt}{}

% ----------------------------  正文格式 ----------------------------
\linespread{1.5}    %页面行距取1.5倍(1.25表示1.5倍行距)
\zihao{-4}\songti   %正文使用宋体小４号字
\titlespacing{\chapter}{0pt}{0pt}{11pt} %章标题 段后11磅
\titlespacing{\section}{0pt}{0pt}{0pt} %
\titlespacing{\subsection}{0pt}{2pt}{0pt}
\titlespacing{\subsubsection}{0pt}{0pt}{0pt}
%英文一般要求字体为“Times New Roman”，字号与同一级别的汉字相同
\setmainfont{Times New Roman}
\setsansfont{Times New Roman}
\setmonofont{Times New Roman}
