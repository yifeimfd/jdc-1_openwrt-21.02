# Actions-OpenWrt

### 本项目包含3个构建Action

#### lean-openwrt
[lean源码](https://github.com/coolsnowwolf/lede) 构建的 x86_64 固件. 

workflows: [build-openwrt-Lean.yml](https://github.com/sypopo/Actions-OpenWrt/blob/master/.github/workflows/build-openwrt-Lean.yml)

config：[config-x86-Lean](https://github.com/sypopo/diy/blob/master/config-x86-Lean)

DIY 脚本：[diy-x86-Lean.sh](https://github.com/sypopo/diy/blob/master/diy-x86-Lean.sh)

#### Lienol-openwrt
[Lienol源码](https://github.com/Lienol/openwrt)  构建的 x86_64 固件. 

workflows: [build-openwrt-Lienol](https://github.com/sypopo/Actions-OpenWrt/blob/master/.github/workflows/build-openwrt-Lienol.yml)

config：[config-x86-Lienol](https://github.com/sypopo/diy/blob/master/config-x86-Lienol)

DIY 脚本：[diy-x86-Lienol.sh](https://github.com/sypopo/diy/blob/master/diy-x86-Lienol.sh)

#### openwrt
[官方源码](https://github.com/openwrt/openwrt)   构建的 x86_64 固件.  

workflows: [build-openwrt-openwrt.yml](https://github.com/sypopo/Actions-OpenWrt/blob/master/.github/workflows/build-openwrt-openwrt.yml)

config：[config-x86-openwrt](https://github.com/sypopo/diy/blob/master/config-x86-openwrt)

DIY 脚本：[diy-x86-openwrt.sh](https://github.com/sypopo/diy/blob/master/diy-x86-openwrt.sh)

### 默认登陆:192.168.2.1, 密码:无

### 默认插件包含:

+ SSR Plus
+ PassWall
+ OpenClash
+ Frp内网穿透
+ 微信推送
+ 网易云音乐解锁
+ 硬盘休眠
+ Aria2
+ 网络共享
+ DiskMan 磁盘管理
+ ZeroTier

如需修改默认配置比如定制插件等，请编辑 `workflow` 文件，修改`SSH_ACTIONS`环境变量的值为`true`。在触发工作流程后，在 Actions 页面等待执行到SSH connection to Actions步骤，复制 SSH 连接命令粘贴到终端内，连接到 GitHub Ac­tions 虚拟服务器环境。执行：`cd openwrt && make menuconfig` 编译配置。

