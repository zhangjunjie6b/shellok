#!/bin/bash
# curl -L https://www.shellok.com/install.sh -o ok.sh && chmod +x ok.sh && sudo bash ok.sh
# 获取操作系统类型和架构
OS_TYPE=$(uname | tr '[:upper:]' '[:lower:]')  # Darwin 或 Linux
ARCH=$(uname -m)  # amd64, arm64, x86_64, i386 等

#是否使用代理
read -p "是否使用代理？(y/n):" is_proxy
if [ "$is_proxy" == "y" ]; then
  URL="https://ghfast.top/github.com/zhangjunjie6b/shellok/releases/latest"
  else
  URL="https://github.com/zhangjunjie6b/shellok/releases/latest"
fi

# 脚本始终安装最新版本，用户可以自定义修改回退，这里暂时没写这个功能。
HEADERS=$(curl -s -L -I "$URL")
REDIRECTED_URL=$PROXYHOST$(echo "$HEADERS" | grep -i "location:" | awk '{print $2}' | tr -d '\r' | sed 's#^/##' |sed 's#^https://##'| sed 's|/tag/|/download/|')"/"


# 转换架构名称（处理可能的差异）
if [ "$ARCH" == "x86_64" ]; then
    ARCH="amd64"
elif [ "$ARCH" == "aarch64" ]; then
    ARCH="arm64"
elif [ "$ARCH" == "i386" ]; then
    ARCH="386"
fi

# 检查是否是 root 用户
if [ "$(id -u)" -ne 0 ]; then
    echo "请使用 sudo 或以 root 用户运行此脚本"
    exit 1
fi



# 安装函数
install(){

  DEB_FILE="$1"
  wget "$REDIRECTED_URL$DEB_FILE" -O "$DEB_FILE"
  if [ -x "$(command -v apt-get)" ]; then
      apt install -y "./$DEB_FILE"
  elif [ -x "$(command -v yum)" ]; then
      yum install -y "./$DEB_FILE"
  else
    echo "不支持的包管理器"
    exit 1
  fi

  echo "安装 DEB 文件: $DEB_FILE"
}

if [ "$OS_TYPE" == "linux" ]; then

    if [ -x "$(command -v apt-get)" ]; then
        install "linux-$ARCH.deb"
    elif [ -x "$(command -v yum)" ]; then
        install "linux-$ARCH.rpm"
    else
        echo "不支持的包管理器"
        exit 1
    fi

else
    echo "不支持的操作系统类型: $OS_TYPE"
    exit 1
fi


# 卸载
if [ "$1" == 'uninstall' ]; then
    if [ -x "$(command -v apt-get)" ]; then
        apt remove -y ok
    elif [ -x "$(command -v yum)" ]; then
        yum remove -y ok
    else
        echo "不支持的包管理器"
        exit 1
    fi
    echo "卸载完成！"
    exit 1
fi


echo "安装完成！"