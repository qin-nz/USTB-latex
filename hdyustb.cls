\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{hdyustb}[5/11/2014 demo]

\newif\ifHDY@interim
\newif\ifHDY@opening
\newif\ifHDY@tasklist

\DeclareOption{interim}{\HDY@interimtrue}
\DeclareOption{opening}{\HDY@openingtrue}
\DeclareOption{tasklist}{\HDY@tasklisttrue}

\ProcessOptions\relax
\LoadClassWithOptions{ctexrep}


\RequirePackage{titlesec}

%% math packages
\RequirePackage{amsmath,amsthm,amsfonts,amssymb,bm}

%% graphics packages
\RequirePackage{graphicx}

%% sort and compress citations 压缩/排序参考文献/
\RequirePackage[sort&compress,numbers]{natbib}

\AtEndOfPackage{\makeatletter\input{hdyustb.cfg}\makeatother}


%----------------------------设置引用参考文献时上标的格式----------------------------
\let\oldcitep\citep
\newcommand{\citen}[2][]{\textsuperscript{\oldcitep{#2}#1}}
\renewcommand{\citep}{\citen}

%----------------------------修改 “目录” 格式----------------------------
\renewcommand{\contentsname}{\bf\heiti\zihao{4}\centerline {目\qquad 录}}
%\titlecontents{chapter}{}

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
\titleformat{\section}{\bf\centering\heiti\zihao{4}}{}{0pt}{}
\phantomsection
\section*{结\quad 论}
\addcontentsline{toc}{chapter}{结\qquad 论}
\vspace{3ex}
\fancyfoot[C]{-\thepage-}
}{}
% ----------------------------结论 conclusion end ----------------------------





% ---------------------------- 设置页眉 ----------------------------

%% fancy
\RequirePackage{fancyhdr}%fancyhdr 页眉页脚
\headheight=13pt
\marginparwidth=10pt
  \pagestyle{fancy}
 \fancyhf{}
 \ifHDY@interim
  \fancyhead[C]{\zihao{5}北京科技大学本科生毕业设计(论文)中期报告}
  \else \ifHDY@opening
 \fancyhead[C]{\zihao{5}北京科技大学本科生毕业设计(论文)选题报告}
 \else \ifHDY@tasklist
  \fancyhead[C]{\zihao{4}毕~业~设~计（论~文）任~务~书}
  \else
    \fancyhead[C]{\zihao{5}北京科技大学本科生毕业设计（论文）}
   \fi
  \fi
 \fi
 %不能在这使用pagenumbering{arabic}命令，否则页面会重置为1
  \fancyfoot[C]{-\thepage-}


  %修改章标题页的版式不一致(plain) %%%,不应用于选题报告
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
  \else
    \fancyhead[C]{\zihao{5}北京科技大学本科生毕业设计（论文）}
   \fi
  \fi
 \fi
 %不能在这使用pagenumbering{arabic}命令，否则页面会重置为1
  \fancyfoot[C]{-\thepage-}
    }




% ---------------------------- 设置标题格式----------------------------
\titleformat{\chapter}{\heiti\zihao{4}}{\thechapter~}{0pt}{}
\titleformat{\section}{\heiti\zihao{-4}}{\thesection~}{0pt}{}
\titleformat{\subsection}{\bf\songti\zihao{-4}}{\thesubsection~}{0pt}{}
%论文一级标题使用黑体4号字
%二级标题使用黑体小４号字%
%三级标题使用加黑宋体小４号字

% ----------------------------  正文格式 ----------------------------
\linespread{1.5}    %页面行距取1.5倍
\zihao{-4}\songti   %正文使用宋体小４号字
%//TODO:
%英文一般要求字体为“Times New Roman”，字号与同一级别的汉字相同
