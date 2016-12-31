MODULE_NAME=$(echo ${JOB_NAME} | cut -d '.' -f1)
BUILD_NUM=$(echo $BUILD_URL} | awk -F'/' '{print $7}')
VERSION=$(date +%Y_%m_%d)_$(echo -n $GIT_COMMIT | tail -c4)_${BUILD_NUM}

# 编译供测试、预上线、线上用的包
for platform in preonline online; do 
    cd ${WORKSPACE} && sed -i 's/\r//' build.sh && sh build.sh $platform
    if [ ${platform}x = onlinex ]; then
    	suffix=
    else
    	suffix=_$platform
    fi
    
    cd ${WORKSPACE}/output && mkdir ${MODULE_NAME}_${VERSION}${suffix}
	for file in $(ls | grep -v ${MODULE_NAME}_${VERSION}); do 
	    mv $file ${MODULE_NAME}_${VERSION}${suffix}/
	done

	tar zcf ${MODULE_NAME}_${VERSION}${suffix}.tar.gz ${MODULE_NAME}_${VERSION}${suffix}
	mv ${MODULE_NAME}_${VERSION}${suffix}.tar.gz ../
done

# ${WORKSPACE}/output/
mv ../${MODULE_NAME}*.tar.gz .

# 记录版本号
echo ${VERSION} > latest_version



sleep 1
MODULE_NAME=$(echo ${JOB_NAME} | cut -d '.' -f1)
OSSCMD_HOME=/home/work/opbin/oss

VERSION=$(cat ${WORKSPACE}/output/latest_version)
python ${OSSCMD_HOME}/osscmd upload ${MODULE_NAME}_${VERSION}.tar.gz oss://inf-production/${MODULE_NAME}/
python ${OSSCMD_HOME}/osscmd upload latest_version oss://inf-production/${MODULE_NAME}/latest_version