@echo off

IF "%1"=="" (
	echo Usage: %0 version
) ELSE (
	echo Uploading documentation v%1 to aws s3...
	aws s3 sync swathub s3://docs.swathub.com/v%1/
)
