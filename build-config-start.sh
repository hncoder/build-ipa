#!/bin/bash

#Config params
proj_name=xxxx    #Project name
ipas_output_dir=/Users/hncoder/Desktop/ipas #打包输出目录路径
proj_svn_url=https://xxx.xxx.xxx.xxx:xxxx/svn/ios/${proj_name} #工程代码svn地址
proj_checkout_path=/Users/hncoder/Desktop/projs/${proj_name} #工程代码下载目录路径
svn_username=xxxx #svn权限用户名
svn_password=xxxx #svn权限密码
shell_path=/Users/hncoder/Desktop/build-ipa #脚本目录路径

#Check out code and build ipa
rm -rf ${proj_checkout_path}
mkdir -p ${proj_checkout_path}


svn co ${proj_svn_url} ${proj_checkout_path} --username ${svn_username} --password ${svn_password}


datedir=$(date +%y%m%d)
output=${ipas_output_dir}/${datedir}
mkdir -p ${output}

${shell_path}/ipa-build ${proj_checkout_path} Debug ${output}