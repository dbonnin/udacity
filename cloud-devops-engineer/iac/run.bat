@echo off
setlocal

set ACTION=%1
set STACK_NAME=%2
set TEMPLATE_NAME=%3
set PARMS_NAME=%4
set REGION=%5

if "%ACTION%"=="deploy" (
    aws cloudformation deploy --stack-name %STACK_NAME% --template-file %TEMPLATE_NAME% --parameter-overrides (type %PARMS_NAME%) --region=%REGION% --profile udacity
) else if "%ACTION%"=="delete" (
    aws cloudformation delete-stack ^
    --stack-name %STACK_NAME% ^
    --region=%REGION%
) else if "%ACTION%"=="describe" (
    aws cloudformation describe-stacks ^
    --stack-name %STACK_NAME% ^
    --region=%REGION%
) else if "%ACTION%"=="list" (
    aws cloudformation list-stacks
)
endlocal