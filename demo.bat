@echo off& mode 79,46
call load.bat _getRandomNum _parseShowBlockNum2 _strlen
call loadE.bat CurS
setlocal enabledelayedexpansion
%CurS% /crv 0


echo.
echo �����
(%_call%  ("10 100 num") %_getRandomNum%)
echo !num!
echo ==================================================
echo.
echo block����
set numStrPrefix=  
(%_call% ("num numStrPrefix") %_parseShowBlockNum2%)
echo ==================================================
echo.
echo �ַ�������
set myStr=���123
(%_call% ("myStr len") %_strlen%)
echo !myStr! -^> !len!
pause>nul
