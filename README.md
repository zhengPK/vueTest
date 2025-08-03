# 安装git
yum install git -y
# 创建项目文件
mkdir /usr/project
# 生成公钥
ssh-keygen -t rsa -b 4096 -C "xxx@163.com"
公钥生成文件
cat /root/.ssh/id rsa.pub
# 安装node和npm
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh| bash
重新加载shell
. /root/.bashrc

nvm isntall stabel 安装最新的稳定版本

在这里遇到glibc版本过低问题,最好的解决办法是 使用docker来安装node 疑问是这样怎么用容器中的node

# 安装docker
yum install -y yum-utils device-mapper-persistent-data lvm2
yum-config-manager \
   --add-repo \
   https://mirrors.aliyun.com/docker-ce/linux/centos/docker-ce.repo
yum install -y docker-ce docker-ce-cli containerd.io

# 阿里云加速
mkdir -p /etc/docker
tee /etc/docker/daemon.json <<-'EOF'
{
    "repistry-mirrors":["https://fwvjnv59.mirror.aliyuncs.com"]
}
EOF
# 重载所有修改过的配置文件
systemctl daemon-reload
systemctl restart docker