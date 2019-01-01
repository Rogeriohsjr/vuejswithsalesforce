#!/bin/bash
# -u = Alias from Org that you want to Deploy
#
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

sfdx force:mdapi:deploy -d Source -u $USERNAME -l NoTestRun -w 3

