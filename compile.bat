@echo off


g++ -c source/math_functions.cpp -o bin/math_functions.o

if errorlevel 1 (
  echo Error: Compilation failed while creating object!
  exit /b 1
)
g++ main.cpp bin/math_functions.o -o main.exe

if errorlevel 2 (
  echo Error: Compilation failed!
  exit /b 2
)

tikTakToe.exe

echo Program Exicution Complete! 