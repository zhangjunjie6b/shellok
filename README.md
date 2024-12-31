# shellok

> shellok的CLI工具

## 功能展示

### 首页
![首页](https://raw.githubusercontent.com/zhangjunjie6b/shellok/refs/heads/main/img/%E9%A6%96%E9%A1%B5.png)

### 列表页

![列表页](https://raw.githubusercontent.com/zhangjunjie6b/shellok/refs/heads/main/img/%E5%88%97%E8%A1%A8%E9%A1%B5.png)

### 自定义脚本
![列表页](https://raw.githubusercontent.com/zhangjunjie6b/shellok/refs/heads/main/img/%E8%87%AA%E5%AE%9A%E4%B9%89%E8%84%9A%E6%9C%AC.png)


## 快速开始

### 安装
```bash
curl -L https://www.shellok.com/install.sh -o ok.sh && chmod +x ok.sh && sudo bash ok.sh
```

### 卸载
```bash
curl -L https://www.shellok.com/install.sh -o ok.sh && chmod +x ok.sh && sudo bash ok.sh uninstall
```

### 功能说明
直接执行`ok`命令，进入交互模式，添加参数`-c`，则不进入交互模式，直接执行脚本。

```bash

-c int
        不进入交互模式，参为脚本ID
  -l    查看脚本列表
  -v    查看版本号
```



### 计划功能
～* 用户自定义脚本～
* 账号密码登录
* AI命令用法解答
* 收藏脚本





### 更新列表

#### 2024年12月31
> 1.0.2
* 修复自动升级

#### 2024年12月30

> 1.0.1
* 添加用户自定义脚本（交互模式）
* 修复分类同步bug
* 添加用户同步乐观锁

#### 2024年12月15 

> 1.0.0 基础功能发版
* github登录（未开发配套功能）
* 脚本列表
* 脚本执行
* 最小版本限制
* 自动更新
* 在详情页直接执行
* 非交互模式
* 交互模式
