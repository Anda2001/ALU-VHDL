@echo off
set xv_path=D:\\Vivado\\2016.4\\bin
call %xv_path%/xelab  -wto 76ca71a385cb4d3e9c993bdf00db7811 -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot wTree_tb_behav xil_defaultlib.wTree_tb -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
