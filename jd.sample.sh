#!/bin/sh

## 修改日期：2020-10-17
## 作者：Evine Deng <evinedeng@foxmail.com>

export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
export LC_ALL=C

ShellDir=$(cd $(dirname $0); pwd)
RootDir=$(cd $(dirname $0); cd ..; pwd)
ScriptsDir=${RootDir}/scripts
LogDir=${RootDir}/log
FileCurrentBashName=$(basename $0)
FileRun=$(echo $FileCurrentBashName | sed "s/\.sh//" )
LogTime=$(date "+%Y-%m-%d-%H-%M-%S")
LogFile="${LogDir}/${FileRun}/${LogTime}.log"

if [ ! -d ${LogDir}/${FileRun} ]; then
  mkdir -p ${LogDir}/${FileRun}
fi

touch $LogFile

cd ${ScriptsDir}
node ${FileRun}.js > ${LogFile}
