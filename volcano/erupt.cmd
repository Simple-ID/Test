: 'IGNORED_LABEL_IN_CMD_and_SH_COMMENT_INTRODUCER
@goto cmd_part
 '
echo "From /bin/sh!"
cat raw.url
echo "Extracting base URL"
URL=`cat raw.url | tr -d ' \n\r'`
URL=${URL%"volcano/erupt.cmd"}
echo "Extracted: ${URL}"
[[ "$1" = "-d" ]] && rm "$0"

exit 0
  
:cmd_part
:cmd_part

@echo off
echo From /cmd!
SETLOCAL
type raw.url

echo Extracting base URL
SET /P URL=< raw.url
rem removing volcano/erupt.cmd
SET URL=%URL:volcano/erupt.cmd=%
rem removing whitespaces
SET URL=%URL: =%

echo Extracted: %URL%
  
IF NOT "x%~1" == "x-d" exit /b %ERRORLEVEL%
rem www.stackoverflow.com/a/20333575
(goto) 2>nul & del "%~f0" & cmd /c exit /b %ERRORLEVEL%
