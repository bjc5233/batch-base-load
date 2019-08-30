@echo off& set base=%~d0%~p0loadExes
:::说明
:::  声明调用第三方exe
:::调用方式
:::  在脚本开头声明要使用的exe; 将各个参数映射为exe实际路径; 通过exe变量调用
:::    call loadE.bat cpaint ckey...
:::    %cpaint% param1 param2
:::    %ckey%   param1 param2
:::备注
:::  有额外配置文件\系列类exe则单独存放一个文件件
:::  zipMini - 直接命名为zip会导致调用zip时报错, 因而改为zipMini
:::TODO
:::  创建集中式的exe使用说明文件，描述+调用方法
:::external
:::  date       2019-08-10 18:51:43
:::  face       (=^.^=)
:::  weather    Shanghai Moderate rain 28℃
for %%i in (%*) do (
	if %%i==iconv (
		set %%i=%base%\%%i\%%i.exe
	) else if %%i==mplayer (
		set %%i=%base%\%%i\%%i.exe
	) else if %%i==sqlite3 (
		set %%i=%base%\sqlite\%%i.exe
	) else if %%i==node (
		set %%i="C:\Program Files\nodejs\node.exe"
	) else if %%i==imagemagick-convert (
		set %%i=%base%\imagemagick\%%i.exe
	) else if %%i==imagemagick-identify (
		set %%i=%base%\imagemagick\%%i.exe
	) else if %%i==imagemagick-mogrify (
		set %%i=%base%\imagemagick\%%i.exe
	) else if %%i==imagemagick-composite (
		set %%i=%base%\imagemagick\%%i.exe
	) else if %%i==zipMini (
		set %%i=%base%\zip.exe
	) else if %%i==figlet (
		set %%i=%base%\figlet\figlet.exe -f "%base%\figlet\standard.flf"
	) else if %%i==ffmpeg (
		set %%i=%base%\%%i\%%i.exe
	) else (
		set %%i=%base%\%%i.exe
	)
)