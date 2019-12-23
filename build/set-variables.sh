#!/bin/bash
SOURCE=$SYSTEMPULLREQUESTSOURCEBRANCH
TARGET=$SYSTEMPULLREQUESTTARGETBRANCH
PROJECTPATH="$ROOTPATH/UI"

echo $SOURCE
echo $TARGET
echo $PROJECTPATH
if [[ $(git diff-tree --dirstat $SOURCE..$TARGET -- $PROJECTPATH) ]]; then
  echo "##vso[task.setvariable variable=BuildFileManager;isOutput=true]true"
  echo "##vso[task.setvariable variable=FileManagerPath;isOutput=true]$PROJECTPATH"
fi
