rem login.bat

set PROFILE=%1

aws configure set aws_access_key_id AKIA4WXSBLBEH4W2RL4Y  --profile %PROFILE%
aws configure set aws_secret_access_key 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  --profile %PROFILE%
aws configure set region us-east-1 --profile %PROFILE%
aws configure set output json --profile %PROFILE%
