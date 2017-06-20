# JOB名称的第一个字段为平台名，第二个字段为模块名, JOB_NAME全部小写, 强约束.
PLATFORM_NAME=$(echo ${JOB_NAME} | cut -d '.' -f1)
MODULE_NAME=$(echo ${JOB_NAME} | cut -d '.' -f2)
SERVICE_GROUP="${PLATFORM_NAME}.${MODULE_NAME}.ecs.bj"

# 重要: 可能需要修改
HTTP_PORT=8180

# 阿里云相关，无需修改
OSS_BUCKET=chen-production
DOMAIN_NAME=oss-cn-xxx-internal.aliyuncs.com

# 获取版本号
if [ "$VERSION"x = "latest_version"x ]; then
    wget -q http://${OSS_BUCKET}.${DOMAIN_NAME}/${MODULE_NAME}/latest_version -O latest_version &> /dev/null
    if [ $? -ne 0 ]; then
        echo "[Error] latest_version doesnot exist"
        exit 1
    fi
    VERSION=$(cat latest_version)
elif [ "$VERSION"x = x ]; then
    echo "[Error] version cannot be empty!"
    exit 1
fi

echo "Version: $VERSION"

# 预上线，使用预上线的发布包
if [ "${PLATFORM_NAME}"x = "preonline"x ]; then
    VERSION=${VERSION}_preonline
fi
echo "Version: $VERSION"

# 部署
ANSIBLE_HOME="/home/work/ansible"
cd $ANSIBLE_HOME
for service in $SERVICE_GROUP
do
    ansible-playbook -f 1 -i /home/rd/hosts ${ANSIBLE_HOME}/$SERVICE_GROUP.yml --limit $service \
                     -e "platform=${PLATFORM_NAME} module=${MODULE_NAME} version=${VERSION} http_port=${HTTP_PORT}"
done