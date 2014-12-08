\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{hdyustb}[5/11/2014 demo]

\newif\ifHDY@interim
\newif\ifHDY@opening

\DeclareOption{interim}{\HDY@interimtrue}
\DeclareOption{opening}{\HDY@openingtrue}

\ProcessOptions\relax
\LoadClassWithOptions{ctexrep}


\RequirePackage{titlesec}

%% math packages
\RequirePackage{amsmath,amsthm,amsfonts,amssymb,bm}

%% graphics packages
\RequirePackage{graphicx}

%% sort and compress citations ѹ��/����ο�����/
\RequirePackage[sort&compress,numbers]{natbib}

\AtEndOfPackage{\makeatletter\input{hdyustb.cfg}\makeatother}


%----------------------------�������òο�����ʱ�ϱ�ĸ�ʽ----------------------------
\let\oldcitep\citep
\newcommand{\citen}[2][]{\textsuperscript{\oldcitep{#2}#1}}
\renewcommand{\citep}{\citen}

%----------------------------�޸� ��Ŀ¼�� ��ʽ----------------------------
\renewcommand{\contentsname}{\bf\heiti\zihao{4}\centerline {Ŀ\qquad ¼}}
%\titlecontents{chapter}{}

% ---------------------------- ���� announce begin ----------------------------
\newenvironment{announce}{%
\songti\zihao{4}%
\titleformat{\section}{\bf\centering\songti\zihao{-2}}{}{0pt}{}
\phantomsection
\section*{��\quad ��}
\addcontentsline{toc}{chapter}{��\qquad ��}
\vspace{3ex}
\fancyfoot[C]{}
}%
{}
% ---------------------------- ���� announce end ----------------------------




%---------------------------- ���� foreword begin ----------------------------
\newenvironment{foreword}
{
\titleformat{\section}{\bf\centering\heiti\zihao{4}}{}{0pt}{}
\phantomsection
\section*{��\quad ��}
\addcontentsline{toc}{chapter}{��\qquad ��}
\vspace{3ex}
\fancyfoot[C]{-\thepage-}
}{}
%---------------------------- ���� foreword end  ----------------------------




% ---------------------------- ��Ӣ��ժҪ begin ----------------------------
\newenvironment{cn_abstract}
                            {
                            \titleformat{\section}{\bf\centering\heiti\zihao{4}}{}{0pt}{}
                            \phantomsection
                            \section*{ժ\quad Ҫ}
                            \addcontentsline{toc}{chapter}{ժ\qquad Ҫ}
                            \fancyfoot[C]{-\thepage-}
                            %\abstract
                            }{\newpage}

\newcommand\cnkeywords[1]{\vspace{2ex}\noindent{\songti\zihao{-4}\bf �ؼ��ʣ�} #1}

\newenvironment{en_abstract}{
                            \titleformat{\section}{\bf\centering\heiti\zihao{4}}{}{0pt}{}
                            \phantomsection

                            \section*{Abstract}
                            \addcontentsline{toc}{chapter}{Abstract}
                            \fancyfoot[C]{-\thepage-}
                            }{}

\newcommand\enkeywords[1]{\vspace{2ex}\noindent{\bf Key Words:~} #1}
% ---------------------------- ��Ӣ��ժҪ end ----------------------------



% ----------------------------���� conclusion begin ----------------------------
\newenvironment{conclusion}
{
\titleformat{\section}{\bf\centering\heiti\zihao{4}}{}{0pt}{}
\phantomsection
\section*{��\quad ��}
\addcontentsline{toc}{chapter}{��\qquad ��}
\vspace{3ex}
\fancyfoot[C]{-\thepage-}
}{}
% ----------------------------���� conclusion end ----------------------------





% ---------------------------- ����ҳü ----------------------------

%% fancy
\RequirePackage{fancyhdr}%fancyhdr ҳüҳ��
\headheight=13pt
\marginparwidth=10pt
  \pagestyle{fancy}
 \fancyhf{}
 \ifHDY@interim
  \fancyhead[C]{\zihao{5}�����Ƽ���ѧ��������ҵ���(����)���ڱ���}
  \else \ifHDY@opening
 \fancyhead[C]{\zihao{5}�����Ƽ���ѧ��������ҵ���(����)ѡ�ⱨ��}
 \else
   \fancyhead[C]{\zihao{5}�����Ƽ���ѧ��������ҵ��ƣ����ģ�}
  \fi
 \fi
 %��������ʹ��pagenumbering{arabic}�������ҳ�������Ϊ1
  \fancyfoot[C]{-\thepage-}


  %�޸��±���ҳ�İ�ʽ��һ��(plain) %%%,��Ӧ����ѡ�ⱨ��
  \fancypagestyle{plain}
 % \headheight{14pt}
  {
  \fancyhf{}
  \ifHDY@interim
  \fancyhead[C]{\zihao{5}�����Ƽ���ѧ��������ҵ���(����)���ڱ���}
  \else \ifHDY@opening
 %\fancyhead[C]{}
 \fancyhead[C]{\zihao{5}�����Ƽ���ѧ��������ҵ���(����)ѡ�ⱨ��}
 \else
   \fancyhead[C]{\zihao{5}�����Ƽ���ѧ��������ҵ��ƣ����ģ�}
  \fi
 \fi
 %��������ʹ��pagenumbering{arabic}�������ҳ�������Ϊ1
  \fancyfoot[C]{-\thepage-}
    }




% ---------------------------- ���ñ����ʽ----------------------------
\titleformat{\chapter}{\heiti\zihao{4}}{\thechapter~}{0pt}{}
\titleformat{\section}{\heiti\zihao{-4}}{\thesection~}{0pt}{}
\titleformat{\subsection}{\bf\songti\zihao{-4}}{\thesubsection~}{0pt}{}
%����һ������ʹ�ú���4����
%��������ʹ�ú���С������%
%��������ʹ�üӺ�����С������

% ----------------------------  ���ĸ�ʽ ----------------------------
\linespread{1.5}    %ҳ���о�ȡ1.5��
\zihao{-4}\songti   %����ʹ������С������
%//TODO:
%Ӣ��һ��Ҫ������Ϊ��Times New Roman�����ֺ���ͬһ����ĺ�����ͬ