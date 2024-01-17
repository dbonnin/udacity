@echo off
setlocal

set ACTION=%1
set STACK_NAME=%2
set TEMPLATE_NAME=%3
set PARMS_NAME=%4
set REGION=%5
set PROFILE=%6

echo Execution with: 

echo %ACTION% 
echo %STACK_NAME%
echo %TEMPLATE_NAME%
echo %PARMS_NAME%
echo %REGION%
echo %PROFILE%



if "%ACTION%"=="deploy" (
    aws cloudformation deploy --stack-name %STACK_NAME% ^
     --template-file %TEMPLATE_NAME% --parameter-overrides file://%PARMS_NAME% --region=%REGION% --profile %PROFILE% --capabilities CAPABILITY_NAMED_IAM
) else if "%ACTION%"=="preview" (
    aws cloudformation deploy --stack-name %STACK_NAME% ^
     --template-file %TEMPLATE_NAME% --parameter-overrides file://%PARMS_NAME% --region=%REGION% --profile %PROFILE% --capabilities CAPABILITY_NAMED_IAM --no-execute-changeset
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
) else if "%ACTION%"=="validate" (
    aws cloudformation validate-template ^
    --template-body file://%TEMPLATE_NAME% --region=%REGION%
) else if "%ACTION%"=="get_error" (
    aws cloudformation describe-stack-events --stack-name %STACK_NAME% --region=%REGION% --profile %PROFILE%
) else (
    echo "Invalid action"
)
endlocal