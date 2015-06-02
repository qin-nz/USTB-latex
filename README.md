USTB-latex
==========

latex template for undergraduate student in University of Science &amp;amp; Technology Beijing (USTB)
本项目是北京科技大学（非官方）的LaTex模板

# 模板概括
本模板需要使用CTex组件，所有文件采用UTF-8编码，使用XeLatex在Windows平台编译通过通过。本模板采用MIT授权。

# 使用方法
## 安装CTEX（必选）
本项目需要使用CTEX，[下载地址](http://ftp.ctex.org/pub/tex/systems/ctex/2.9/CTeX_2.9.2.164_Full.exe)
## 确认系统环境变量（可选）
如果你的CTEX采用默认安装位置，默认情况下，以下内容应在环境变量中：
- C:\CTEX\UserData\miktex\bin;
- C:\CTEX\MiKTeX\miktex\bin;
- C:\CTEX\CTeX\ctex\bin;
- C:\CTEX\CTeX\cct\bin;
- C:\CTEX\CTeX\ty\bin;
- C:\CTEX\Ghostscript\gs9.05\bin;
- C:\CTEX\GSview\gsview;
- C:\CTEX\WinEdt;
虽然以上并不都有用，但建议都包含。

## 设置PowerShell (可选，建议)
运行-> powershell -> ```Set-ExecutionPolicy RemoteSigned```
## 编译Main.tex (可选)
可以使用两种方式编译
### WinEdt
使用WinEdt打开```Main.tex```，在菜单栏中选择 Tex -> PDF -> XeLatex 即可，但编译成功后不会自动弹出pdf文件。
### xe-rebuild.bat
双击xe-rebuild.bat文件即可，等待片刻即可看到编译好的```Main.pdf```

## 文件说明
文件名			|说明
----------------|--------------
Main.tex		|文章的主体，使用include包含各章节内容。不建议在这里写内容
hdyustb.cls		|文章整体格式的定义都在这里，这是本项目的核心
bibfile.bib		|所有的文献都在这里，不管是否引用，都放在这里就可以。建议使用JebRef管理此文件。
clean.ps1		|双击清理缓存（需要运行PowerShell脚本运行）
xe-rebuild.bat	|清理缓存（需要运行PowerShell脚本运行）并连续编译多次，生成最终版
xe-build-once.bat|清理缓存（需要运行PowerShell脚本运行）并编译一次，不包含目录信息

# 模板使用注意事项
## UTF-8
XeLaTex的编译方式要求使用UTF-8编码。UTF-8编码根据文件开头是否有3个字节的特征码分为有BOM版和无BOM版。WinEdt只能正确处理有BOM的UTF-8编码。
因此，建议新建一个```.txt```文件，用记事本打开，另存为时选择UTF-8编码，随后把文件扩展名修改为```.tex```

# 论文撰写注意事项
## 表头
根据学校要求，表头应在表上方，因此不要直接用WinEdt自动生成的，记得把标题提前。示例如下：
	\begin{table}[!ht]
	  \centering
	  \caption{表头}\label{tab:tabref}
	  \begin{tabular}{lr}\hline
	     业务类型 &典型速率\\ \hline
	     文件传输& 无限制 \\ \hline
	  \end{tabular}
	\end{table}

# 目前已知问题
- 学校要求最终提交 MS Word 格式
- 本项目只能帮助你完成正文的内容的编写，至于扉页什么乱七八糟的还要你用Word完成（特别提醒，电脑里没幼圆和方正魏碑简体的要记得装）。
- clean.ps1 文件需要使用 ```Set-ExecutionPolicy RemoteSigned``` 设置后方可正常使用。

# 免责声明
本项目目前是非官方的版本，作者不保证使用本模板能够通过检测等事情。
<!-- 但保证，作者本人使用此模板在2015届顺利毕业。 -->

如果你对本项目感兴趣，可以使用Pull Request的方式对本项目做贡献，如果愿意持续贡献，我会给你Contributor的权限。