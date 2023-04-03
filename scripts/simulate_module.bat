@echo off

set module_name=%1
set do_file_name=doFiles/sim_%module_name%.do

if not exist "src\%module_name%.sv" (
  echo File "src\%module_name%.sv" does not exist
  exit /b 1
)

if not exist "%do_file_name%" (
    echo vlib work > "%do_file_name%"
    echo vlog "./src/%module_name%.sv" >> "%do_file_name%"
    echo vsim -voptargs="+acc" -t 1ps -lib work %module_name%_testbench >> "%do_file_name%"
    echo do doFiles/%module_name%_wave.do >> "%do_file_name%"
    echo view wave >> "%do_file_name%"
    echo view structure >> "%do_file_name%"
    echo view signals >> "%do_file_name%"
    echo run -all >> "%do_file_name%"
)

start "" "C:\intelFPGA_lite\17.0\modelsim_ase\win32aloem\modelsim.exe" -do "%do_file_name%"