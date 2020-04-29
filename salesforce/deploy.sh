#!/bin/bash
# -u = Alias from Org that you want to Deploy
# Setup a credential
# sfdx force:auth:web:login --setalias MyOrg --instanceurl https://login.salesforce.com --setdefaultusername
# Then we can run the command below to deploy our package.xml with all the files.
# sh deploy.sh -u MyOrg
USERNAME=
while [[ $# -gt 0 ]]
do
key="$1"

case $key in
    -u|--username)
    USERNAME="$2"
    shift # past argument
    shift # past value
    ;;
esac
done

echo .
echo Deploying to Salesforce using SalesforceDX Metadata API
echo .
sfdx force:mdapi:deploy -d Source -u $USERNAME -l NoTestRun -w 3