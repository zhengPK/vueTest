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


# 使用这个 登录阿里云查看 https://help.aliyun.com/zh/acr/product-overview/product-change-acr-mirror-accelerator-function-adjustment-announcement
sudo cp -n /lib/systemd/system/docker.service /etc/systemd/system/docker.service
sudo sed -i "s|ExecStart=/usr/bin/docker daemon|ExecStart=/usr/bin/docker daemon --registry-mirror=https://2zuvq99n.mirror.aliyuncs.com |g" /etc/systemd/system/docker.service
sudo sed -i "s|ExecStart=/usr/bin/dockerd|ExecStart=/usr/bin/dockerd --registry-mirror=https://2zuvq99n.mirror.aliyuncs.com|g" /etc/systemd/system/docker.service
sudo systemctl daemon-reload
sudo service docker restart   

# 重载所有修改过的配置文件
systemctl daemon-reload
systemctl restart docker

# 构建镜像:在项目根目录下打开终端，执行
docker build -t vue-test .

# 运行容器:将容器的 5173 端口映射到主机（假设你的前端 dev server 监听 5173）
docker run -p 5173:5173 vue-test