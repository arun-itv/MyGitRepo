#!/bin/bash

echo "***********************************************************************************************"
echo "Iterating and list all arguments passed to script ($0) for execution"
for arglist in "$@"
do
  echo Argument: $arglist
done

echo "***********************************************************************************************"
echo "Listing all ENVIRONMENT variables for validation"
echo "ENVIRONMENT::: $ENVIRONMENT_TYPE"
echo "***********************************************************************************************"

echo "ENVIRONMENT passed is ${ENVIRONMENT_TYPE,,}"

if [[ -z "${ENVIRONMENT_TYPE}" ]];then
    echo #echo "NO ENVIRONMENT SET FOR SCRIPT EXECUTION. Please set to either of these values (DEV/QA/BETA/PROD/DR) and retry"
    exit 1
else   
  #Copy all Apache specific configuration files
  cp -pvR ${HTTPD_INSTANCE_LOCATION}/all_configs/apache_configs/${ENVIRONMENT_TYPE,,}/* ${HTTPD_INSTANCE_LOCATION}/conf
  echo "Copy Apache specific configurations for ${ENVIRONMENT_TYPE,,} ENVIRONMENT DONE!!!"
  #ls -laR ${HTTPD_INSTANCE_LOCATION}/htdocs/*

  #Update httpd.conf with input params
#  sed -i "s/HTTPDUSER/${HTTPDUSER}/g" ${HTTPD_INSTANCE_LOCATION}/conf/httpd.conf
#  echo "Substitution of all ENVIRONMENT variables to Apache Configuration httd.conf for ${ENVIRONMENT_TYPE,,} ENVIRONMENT DONE!!!"

  #Start Apache
  echo "Starting Apache using command $1"
  $1

fi