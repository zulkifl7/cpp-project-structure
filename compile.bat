@echo off

Title Compile the project


rem This batch script automates compiling C++ source files (.cpp) 
rem into an executable program.

rem --- Compiler and Flags ---

rem COMPILER variable stores the path to your C++ compiler (e.g., "g++")
SET COMPILER="g++"

rem CFLAGS variable defines compiler flags:
rem -Wall enables various warnings for better code quality
rem -std=c++17 specifies the C++17 language standard
SET CFLAGS="-Wall"


rem --- Source and Object Directories ---

rem SRC_DIR variable sets the directory containing your source code (.cpp files)
SET SRC_DIR="source"

rem OBJ_DIR variable sets the directory where compiled object files (.o files) will be stored
SET OBJ_DIR="bin"

rem OBJ_DIR variable sets the directory where compiled object files (.o files) will be stored
SET LIB_DIR="lib"


rem This line creates the object directory (if it doesn't exist) to store object files
if not exist "%OBJ_DIR%" (
  mkdir "%OBJ_DIR%"
)
rem This line creates the source directory (if it doesn't exist) to store source files
if not exist "%SRC_DIR%" (
  mkdir "%SRC_DIR%"
)
rem This line creates the lib directory (if it doesn't exist) to store header files files
if not exist "%LIB_DIR%" (
  mkdir "%LIB_DIR%"
)


rem --- Looping Through Source Files ---

rem This loop iterates through all files with the .cpp extension in the source directory
for %%a in ("%SRC_DIR%\*.cpp") do (

  rem Extract filename from the full path without the extension (e.g., "math_function" from "source\math_function.cpp")
  SET filename=%%~na

  rem Construct the path for the object file by combining object directory, filename, and .o extension

  rem Compile the current source file using the compiler, flags, and create the object file
  "%COMPILER%" %CFLAGS% -c "%%a" -o "%OBJ_DIR%\%%~na.o"

  rem Check the exit code after compilation. If it's 1 (error), display an error message with the filename and pause execution

  if errorlevel 1 (
    echo Error compiling: %%~na!
    @rem Exit the script with an error code (1)
    exit /b 1  
  )

)
@rem Indicates successful compilation of object files
echo Compiled object files in %OBJ_DIR%   


rem --- Linking Step ---

rem TARGET variable sets the name for the final executable program
SET TARGET="main"

rem Link all the object files in the object directory into the final executable using the compiler and flags
"%COMPILER%" main.cpp %CFLAGS% "%OBJ_DIR%\*.o" -o "main.exe"



rem Check the exit code after linking. If it's 1 (error), display an error message
if errorlevel 1 (
  echo Error linking object files!
  @rem Exit the script with an error code (1)
  exit /b 1  
)



@rem Display success message with the name of the generated executable program
echo Compiled successfully! Executable: %TARGET%  


main.exe

echo Program Exicution Complete! 