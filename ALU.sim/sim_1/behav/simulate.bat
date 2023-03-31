@echo off
set xv_path=D:\\Vivado\\2016.4\\bin
call %xv_path%/xsim wTree_tb_behav -key {Behavioral:sim_1:Functional:wTree_tb} -tclbatch wTree_tb.tcl -view D:/Faculta/IIIsem1/SCS/Lab/Lab4/ALU/CLAdder_tb_behav.wcfg -log simulate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
