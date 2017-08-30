# batch-base-load


## 说明
load.bat是batch编程基础库，提供了很多内敛函数，方便调用，并且函数执行效率高。
* 调用方式[load.bat] -> 展示demo代码
* 调用方式[load.bat 0] -> 打印所有函数以及解释
* 调用方式[load.bat 1] -> 罗列所有函数，上下箭头可以移动
* 实际编程使用方式查看并执行demo.bat

---
## 预览
<div align=center><img src="https://github.com/bjc5233/batch-base-load/raw/master/resources/demo.png"/></div>

---
## 函数列表
_call
::调用有参内敛函数的调用前缀
::在书写内敛函数时根据传入参数的数量选择版本, 一般情况下都是用版本一[很少有参数数量多于9个]
::(%_call% ("arg1 arg2 arg3...") %_func%)        
::   版本一支持[%%1--%%9]共9个参数
::   版本二支持[%%A--%%Z]共26个参数

_checkDepend
::检查调用者所在路径以及path路径中是否包含指定的文件
::    注意: 内敛函数中有些需要使用第三方, 应调用此函数检查依赖的第三方; 但对于一般系统携带的exe如find等不进行检查
::IN[文件名,包含后缀]

_strlen
::计算字符串的字符数
::所求字符串不超过8192==>4096 2048 1024 512 256 128 64 32 16
::所求字符串不超过4096==>2048 1024 512 256 128 64 32 16
::所求字符串不超过2048==>1024 512 256 128 64 32 16
::IN[字符串变量名]    OUT[len]

_strlen2
::计算字符串的字节数
::IN[字符串变量名]    OUT[len]

_parseArray
::解析数组字符串,将变量array={a,b}转换为3个变量array.length=3, array[0]=a, array[1]=b, array.maxIndex=2
::IN[数组字符串变量名]
::set "_parseArray=do setlocal enabledelayedexpansion& (for /f "tokens=1 delims={}" %%i in ("") do set arrayIndex=0& for %%j in (%%i) do (for %%k in () do endlocal& set %%1[%%k]=%%j)& set /a arrayIndex+=1& setlocal enabledelayedexpansion)& for %%i in () do endlocal& set %%1.length=%%i& set arrayIndex="& goto :EOF

_destoryArray
::销毁数组元素变量
::IN[数组字符串变量名]

_parseJSON
::解析JSON字符串,将变量json={name:鲍xx,age:24} 转换为 array.length=2, array.name=鲍xx, array.age=24
::IN[JSON字符串变量名]

_destoryJSON
::销毁JSON元素变量
::IN[JSON字符串变量名]

_isPureNum
::是否是纯数字   调用者: [(调用内敛函数) && echo isPureNum || echo non-isPureNum]
::IN[字符串变量名]

_getRandomNum
::取指定范围内的随机数
::IN[最小值]    IN[最大值]    OUT[随机数]

_getRandomNum2
::从指定数字范围内随机选择指定个数字的数字
::IN[最小值]    IN[最大值]    IN[选取个数]    OUT[输出的数字字符串,以空格分隔]

_getRandomColor
::获取一个随机颜色值
::OUT[随机颜色值]

_randomColor
::设置一个随机颜色

_parseColor
::解析单个颜色值, 当无法解析时打印出所支持的颜色
::IN[原始颜色字符][如红]    OUT[处理后颜色代码][如C]

_downcase
::大写字符串转小写字符串
::IN[字符串变量名]      OUT[处理后字符串]

_upcase
::小写字符串转大写字符串
::IN[字符串变量名]      OUT[处理后字符串]

_px2colsLines
::像素值转cmd宽度高度值    cmd默认[点阵字体8x16], 即每个字符是8个像素宽，16个像素高
::IN[pxWidth]    IN[pxHeight]    OUT[cols]    OUT[lines]    {IN[字体大小][查看属性字体选项卡]}

_colsLines2px
::cmd宽度高度值转像素值    cmd默认[点阵字体8x16], 即每个字符是8个像素宽，16个像素高
::IN[cols]    IN[lines]    OUT[pxWidth]    OUT[pxHeight]    {IN[字体大小][查看属性字体选项卡]}

_getColsLines
::得到当前cmd屏幕宽度高度值
::OUT[cols]    OUT[lines]

_buildFile
::创建空文件, 0字节, 文件内没有任何内容
::    注意:echo.>1.txt方式创建的不是空文件
::IN[文件名]

_getFileName
::解析文件路径字符串得到文件名
::IN[文件路径变量名]    OUT[文件名]    {OUT[文件扩展名]}

_getFileLine
::计算指定文件行数[忽略空行]
::IN[文件名]    OUT[文件行数]

_getFileLine2
::IN[文件路径变量名]    OUT[文件行数]

_getFileSize
::计算指定文件大小, 单位byte
::IN[文件路径变量名]   OUT[文件大小]

_isFolder
::是否是文件夹       [%调用表达式% && echo folder || echo file]
::IN[文件夹路径变量名]

_uniqueStr
::使用当前日期时间得到一个唯一的字符串
::OUT[唯一字符串]

_getCR
::得到回车符Carriage Return, 导入之后使用约定变量CR, 调用者开启延迟变量使用[], 未开启延迟变量无法调用

_getLF
::得到换行符Line Feed[行满], 导入之后使用约定变量LF\LF_, 调用者开启延迟变量使用[ \ %LF_%], 未开启延迟变量使用[%LF_%]

_getTab
::得到Tab符, 导入之后使用约定变量Tab, 调用者开启延迟变量使用[ \ %Tab%], 未开启延迟变量使用[%Tab%]

_getBS
::得到退格符, 导入之后使用约定变量Tab, 调用者开启延迟变量使用[ \ %BS%], 未开启延迟变量使用[%BS%]

_speak
::计算机speak文字  会在%temp%目录生成tool_speak.vbs
::IN[文字变量名]

_getScreenSize
::获取显示器屏幕大小
::OUT[宽度]    OUT[高度]

_getDeskWallpaperPath
::获取桌面壁纸路径
::OUT[桌面壁纸路径]

_roundFloat
::四舍五入
::IN[原始浮点数字字符串]    IN[精确小数位数]    OUT[处理后浮点数字字符串]

_infiniteLoopPause
::无限pause>nul, 一般用于bat结尾, 用户只能手动关闭窗口

_infiniteLoopSome
::无限处理用户指定命令,    使用双引号包围每条命令, 命令之间以空格分隔          set some="echo ok" "pause" "set /a count+=1" "echo !count!"& %_call% ("some") %_infiniteLoopSome%
::IN[指定命令字符串变量名]

_trimStrLeft
::修整字符串，移除左空格
::IN-OUT[字符串变量名]

_trimStrRight
::修整字符串，移除右空格
::IN-OUT[字符串变量名]

_trimStr
::修整字符串，移除左右空格
::IN-OUT[字符串变量名]

_reverseStr
::将字符串反序处理
::IN[字符串变量名]     OUT[处理后字符串]

_shuffleStr
::将字符串乱序处理
::IN[字符串变量名]     OUT[处理后字符串]

_true
::得到一个标识成功的值(errorlevel为0), 导入之后使用约定变量_true，注意只能使用%_true%, 不能使用, 原因未知
::  1.嵌入call调用：放在call代码段最后处使用, 这样call就如同存在一个是否的返回值
::        call :test && echo true || echo false
::        :test
::        %_true%& goto :EOF
::  2.嵌入内敛函数调用
::        内敛函数写法: (if condition (endlocal& %_true%) else (endlocal& %_false%)) ------ 确保此为内敛函数最后一句, 需要将该if语句用括号包围
::        调用者的写法: (%_call% ("myFolder") %_isFolder%) && echo true || echo false ------ echo true处可以使用多个语句,只要包围在括号内

_false
::得到一个标识失败的值(errorlevel大于0), 导入之后使用约定变量_false，注意只能使用%_false%, 不能使用, 原因未知
::  1.嵌入call调用：放在call代码段最后处使用, 这样call就如同存在一个是否的返回值
::        call :test && echo true || echo false
::        :test
::        %_false%& goto :EOF
::  2.嵌入内敛函数调用
::        内敛函数写法: (if condition (endlocal& %_true%) else (endlocal& %_false%)) ------ 确保此为内敛函数最后一句, 需要将该if语句用括号包围
::        调用者的写法: (%_call% ("myFolder") %_isFolder%) && echo true || echo false ------ echo true处可以使用多个语句,只要包围在括号内

_parseBlockNum
::解析数字字符串为bolckNum形式, 可接受字符[数字 +-*/], 对未知字符使用空格替代
::IN[数字字符串变量名]    IN-OUT[处理后字符串变量名]    OUT[处理后字符串行数]

_parseShowBlockNum
::解析数字字符串为bolckNum形式, 并显示, 可接受字符[数字 +-*/], 对未知字符使用空格替代
::IN[数字字符串变量名]    {IN[行前缀]}    {IN[行后缀]}

_parseShowBlockNum2
::解析数字字符串为bolckNum形式, 并显示, 可接受字符[数字 空格 +-*/], 对未知字符使用空格替代
::IN[数字字符串变量名]    {IN[行前缀变量名]}    {IN[行后缀变量名]}

_parseASCIIStr
::解析字符串转为ASCII形式, 可接受字符[英文大小写 数字 空格 ~@#$*(-_+=[]{}\:;'.,?/], 对未知字符使用空格替代
::    注意: 大写字母\标点符号是以figlet的banner3.flf字体作为基础，小写字母是以xhelv.flf字体作为基础修改而来，在bat中一些特殊字符不能处理 % & ) | " <> 
::    注意: 此内敛函数中采用压缩处理, bat中变量值最大长度是8189个字符, 不压缩则长度则超过上限
::          压缩形式[-]=>[           $           $ ####      $##  ##  ## $     ####  $           $       ]=>[H$H$H$7A$H$H$H]，具体参考C:\path\bat\batlearn\ASCIIChar\convert.bat
::IN[字符串变量名]    IN-OUT[处理后字符串变量名]    OUT[处理后字符串行数]

_parseShowASCIIStr
::解析字符串转为ASCII形式, 并显示, 可接受字符[英文大小写 数字 空格 ~@#$*(-_+=[]{}\:;'.,?/], 对未知字符使用空格替代
::    注意: 大写字母\标点符号是以figlet的banner3.flf字体作为基础，小写字母是以xhelv.flf字体作为基础修改而来，在bat中一些特殊字符不能处理 % & ) | " <> 
::    注意: 此内敛函数中采用压缩处理, bat中变量值最大长度是8189个字符, 不压缩则长度则超过上限
::          压缩形式[-]=>[           $           $ ####      $##  ##  ## $     ####  $           $       ]=>[H$H$H$7A$H$H$H]，具体参考C:\path\bat\batlearn\ASCIIChar\convert.bat
::IN[字符串变量名]      {IN[行前缀]}      {IN[行后缀]}

_parseShowASCIIStr2
::解析字符串转为ASCII形式, 并显示, 可接受字符[英文大小写 数字 空格 ~@#$*(-_+=[]{}\:;'.,?/], 对未知字符使用空格替代
::    注意: 大写字母\标点符号是以figlet的banner3.flf字体作为基础，小写字母是以xhelv.flf字体作为基础修改而来，在bat中一些特殊字符不能处理 % & ) | " <> 
::    注意: 此内敛函数中采用压缩处理, bat中变量值最大长度是8189个字符, 不压缩则长度则超过上限
::          压缩形式[-]=>[           $           $ ####      $##  ##  ## $     ####  $           $       ]=>[H$H$H$7A$H$H$H]，具体参考C:\path\bat\batlearn\ASCIIChar\convert.bat
::IN[字符串变量名]      {IN[行前缀变量名]}      {IN[行后缀变量名]}

_showBlockASCII
::显示bolckNum\ ASCIIStr字符串
::IN[字符串变量名]    IN[行数变量名]    {IN[行前缀]}    {IN[行后缀]}

_showBlockASCII2
::显示bolckNum\ ASCIIStr字符串
::IN[字符串变量名]    IN[行数变量名]    {IN[行前缀变量名]}    {IN[行后缀变量名]}

_playMusicMini
::指定次数播放音乐集, 需要工具gplay.exe支持
::IN[musicPaths][路径有空格加双引号][多个路径使用空格间隔]    IN[times][不写或者0表示循环]

_playMusic
::指定播放模式播放音乐集, 需要gplay.exe支持
::IN[musicPaths][路径有空格加双引号][多个路径使用空格间隔]    IN[mode][单曲播放0\单曲循环1\顺序播放2\循环播放3\随机播放4]

_setFontSize
::修改cmd窗口字体大小   目前只支持[点阵字体]
::    注意:注册表中FontSize字段[高四位为字高, 低四位为字宽], 如00100008，即字体宽x高=16进制08Hx10H=10进制8×16
::IN[字体宽x高][8x16]

_setWallpaper
::设置桌面壁纸  会在%temp%目录生成tool_setWallpaper.vbs
::IN[壁纸路径变量名]

_readConfig
::读取指定配置文件指定key值      从配置文件中读出键为key的值, 如果value参数存在, 将值设置到value中, 否则设置到key中
::    注意:for语句读取文件时默认跳过;开头的行, 因此;开头的行可以作为注释
::IN[配置文件路径]    IN[key]    {OUT[value变量名]}

_readConfigMulti
::读取指定配置文件指定的多个key值      从配置文件中读出键为key的值, 如果value参数存在, 将值设置到value中, 否则设置到key中
::    注意:for语句读取文件时默认跳过;开头的行, 因此;开头的行可以作为注释
::IN[配置文件路径]    IN-OUT[keys变量名][空格分隔key]

_writeConfig
::读取指定配置文件指定key值      从配置文件中寻找键为key的行, 如果value参数存在, 将值设为value, 否则读取key变量值
::    注意:for语句读取文件时默认跳过;开头的行, 因此;开头的行可以作为注释
::IN[配置文件路径]    IN[key变量名]    {IN[value]}

_writeConfig2
::IN[配置文件路径]    IN[key变量名]    {IN[value变量名]}

_writeConfigMulti
::将指定的多个key值写入配置文件
::    注意:for语句读取文件时默认跳过;开头的行, 因此;开头的行可以作为注释
::IN[配置文件路径]    IN[keys变量名][空格分隔key]

_readConfig
::读取指定配置文件指定key值      从配置文件中读出键为key的值, 如果value参数存在, 将值设置到value中, 否则设置到key中
::    注意:for语句读取文件时默认跳过;开头的行, 因此;开头的行可以作为注释
::IN[配置文件路径]    IN[key]    {OUT[value变量名]}

_getDate
::取当前的年月日
::OUT[年-月-日] {IN[separator连接符], 默认值为空}

_getYear
::取当前的年
::OUT[年]

_getMonth
::取当前的月
::OUT[月] {IN[needRemoveZeroPrefix]: 0否 1是}
::set "_getMonth=do setlocal enabledelayedexpansion& (if "0" EQU "0" if "%%2" EQU "1" (set monthTemp=8) else (set monthTemp=08))& for %%i in () do endlocal& set %%1=%%i"& goto :EOF

_getDay
::取当前的日
::OUT[日] {IN[needRemoveZeroPrefix]: 0否 1是}

_bell
::发声

_isOddNum
::是否是奇数   调用者: [(调用内敛函数) && echo isOddNum || echo non-isOddNum]
::IN[变量名]

_isEvenNum
::是否是偶数   调用者: [(调用内敛函数) && echo isEvenNum || echo non-isEvenNum]
::IN[变量名]

_showHR
::打印横线
::IN[元素(默认-)]    IN[长度(默认10)]