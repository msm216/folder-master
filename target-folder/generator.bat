@echo off

rem 创建子文件夹
mkdir "English_EN" 2>nul
mkdir "French_FR" 2>nul
mkdir "German_DE" 2>nul

rem 切换到根目录
cd /d "%~dp0"

rem 在子文件夹中创建相同的文件夹结构
for /D %%G in ("*") do (
    cd "%%G"
    mkdir "MaxiCharger AC" 2>nul
    mkdir "MaxiCharger AC\Wallbox" 2>nul
    mkdir "MaxiCharger AC\Wallbox\Installation and Operation Manual" 2>nul
    mkdir "MaxiCharger AC\Wallbox\Installation and Operation Manual\arch" 2>nul
    mkdir "MaxiCharger AC\Wallbox\Quick Guide" 2>nul
    mkdir "MaxiCharger AC\Wallbox\Quick Guide\arch" 2>nul
    mkdir "MaxiCharger AC\Wallbox\Maintenance Manual" 2>nul
    mkdir "MaxiCharger AC\Wallbox\Maintenance Manual\arch" 2>nul
    mkdir "MaxiCharger AC\Wallbox\Pedestal" 2>nul
    mkdir "MaxiCharger AC\Wallbox\Pedestal EP" 2>nul
    mkdir "MaxiCharger AC\Wallbox\Pedestal EP\Quick Guide" 2>nul
    mkdir "MaxiCharger AC\Wallbox\Pedestal EP\Quick Guide\arch" 2>nul
    mkdir "MaxiCharger AC\Compact" 2>nul
    mkdir "MaxiCharger AC\Compact\User Manual" 2>nul
    mkdir "MaxiCharger AC\Compact\User Manual\arch" 2>nul
    mkdir "MaxiCharger AC\Compact\Quick Guide" 2>nul
    mkdir "MaxiCharger AC\Compact\Quick Guide\arch" 2>nul
    mkdir "MaxiCharger AC\Ultra" 2>nul
    mkdir "MaxiCharger AC\Ultra\User Manual" 2>nul
    mkdir "MaxiCharger AC\Ultra\User Manual\arch" 2>nul
    mkdir "MaxiCharger AC\Ultra\Quick Guide" 2>nul
    mkdir "MaxiCharger AC\Ultra\Quick Guide\arch" 2>nul
    mkdir "MaxiCharger AC\Pedestal\Quick Guide" 2>nul
    mkdir "MaxiCharger AC\Pedestal\Quick Guide\arch" 2>nul
    mkdir "MaxiCharger AC\Energy Management System" 2>nul
    mkdir "MaxiCharger AC\Energy Management System\Installation and Operation Manual" 2>nul
    mkdir "MaxiCharger AC\Energy Management System\Installation and Operation Manual\arch" 2>nul
    mkdir "MaxiCharger DC" 2>nul
    mkdir "MaxiCharger DC\Fast" 2>nul
    mkdir "MaxiCharger DC\Fast\Installation and Operation Manual" 2>nul
    mkdir "MaxiCharger DC\Fast\Installation and Operation Manual\arch" 2>nul
    mkdir "MaxiCharger DC\Fast\Service Manual" 2>nul
    mkdir "MaxiCharger DC\Fast\Service Manual\arch" 2>nul
    mkdir "MaxiCharger DC\MaxiCharger DC Fast\Power Modul" 2>nul
    mkdir "MaxiCharger DC\Fast\CMS" 2>nul
    mkdir "MaxiCharger DC\Fast\CMS\Quick Guide" 2>nul
    mkdir "MaxiCharger DC\Fast\CMS\Quick Guide\arch" 2>nul
    mkdir "MaxiCharger DC\Compact" 2>nul
    mkdir "MaxiCharger DC\Compact\Installation and Operation Manual" 2>nul
    mkdir "MaxiCharger DC\Compact\Installation and Operation Manual\arch" 2>nul
    mkdir "MaxiCharger DC\Compact\Service Manual" 2>nul
    mkdir "MaxiCharger DC\Compact\Service Manual\arch" 2>nul
    mkdir "MaxiCharger DC\Compact\Power Modul" 2>nul
    cd ..
)