#!/bin/bash
# -u = Alias from Org that you want to Deploy
#
# sh retrieve.sh -u MyOrg
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

sfdx force:mdapi:retrieve -a 41 -w 2 -r packageCompressed/ -k Source/package.xml -u $USERNAME --verbose
unzip packageCompressed/unpackaged.zip && rm packageCompressed/unpackaged.zip
rm -rf Source && mv unpackaged Source

