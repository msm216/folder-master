@echo off

rem 创建子文件夹
mkdir "English_EN"
mkdir "French_FR"
mkdir "German_DE"
mkdir "Dutch_NL"

rem 切换到根目录
cd /d "%~dp0"

rem 在子文件夹中创建相同的文件夹结构
for /D %%G in ("*") do (
    cd "%%G"
    mkdir "AC"
    mkdir "AC\AC Wallbox"
    mkdir "AC\AC Wallbox\User Manual"
    mkdir "AC\AC Wallbox\User Manual\arch"
    mkdir "AC\AC Wallbox\Quick Guide"
    mkdir "AC\AC Wallbox\Quick Guide\arch"
    mkdir "AC\AC Wallbox\Maintenance Manual"
    mkdir "AC\AC Wallbox\Maintenance Manual\arch"
    mkdir "AC\AC Compact"
    mkdir "AC\AC Compact\User Manual"
    mkdir "AC\AC Compact\User Manual\arch"
    mkdir "AC\AC Compact\Quick Guide"
    mkdir "AC\AC Compact\Quick Guide\arch"
    mkdir "AC\AC Ultra"
    mkdir "AC\AC Ultra\User Manual"
    mkdir "AC\AC Ultra\User Manual\arch"
    mkdir "AC\AC Ultra\Quick Guide"
    mkdir "AC\AC Ultra\Quick Guide\arch"
    mkdir "AC\Energy Management System"
    mkdir "AC\Energy Management System\Installation and Operation Manual"
    mkdir "AC\Energy Management System\Installation and Operation Manual\arch"
    mkdir "DC"
    mkdir "DC\DC Fast"
    mkdir "DC\DC Fast\Installation and Operation Manual"
    mkdir "DC\DC Fast\Installation and Operation Manual\arch"
    mkdir "DC\DC Fast\Service Manual"
    mkdir "DC\DC Fast\Service Manual\arch"
    mkdir "DC\DC Compact"
    mkdir "DC\DC Compact\Installation and Operation Manual"
    mkdir "DC\DC Compact\Installation and Operation Manual\arch"
    mkdir "DC\DC Compact\Service Manual"
    mkdir "DC\DC Compact\Service Manual\arch"
    cd ..
)