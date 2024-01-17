rem login.bat

set PROFILE=%1

aws configure set aws_access_key_id  --profile %PROFILE%
aws configure set aws_secret_access_key  --profile %PROFILE%
rem aws configure set aws_session_token "" --profile %PROFILE%
aws configure set region us-east-1 --profile %PROFILE%
aws configure set output json --profile %PROFILE%
