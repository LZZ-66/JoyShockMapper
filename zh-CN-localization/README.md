# JoyShockMapper 中文托盘菜单本地化补丁 (zh-CN)

本目录提供 JoyShockMapper 托盘右键菜单的中文汉化补丁。这是**非官方修改**，与上游项目
(Electronicks/JoyShockMapper) 无关，请勿向上游反馈本修改版的问题。

## 背景

官方发布版 (v3.6.1) 的托盘右键菜单为英文：

```
Show Console / Reconnect controllers / AutoLoad / AutoConnect / Whitelist
Calibrate all devices / AutoLoad folder / GyroConfigs folder
Calculate RWC / Hide when minimized / Quit
```

## 本补丁做了什么

通过替换 `JoyShockMapper.exe` 中的 UTF-16 菜单字符串，把上述 11 个菜单项替换为中文：

| 英文 | 中文 |
|---|---|
| Show Console | 显示控制台 |
| Reconnect controllers | 重新连接手柄 |
| AutoLoad | 自动加载配置 |
| AutoConnect | 自动连接手柄 |
| Whitelist | 白名单 |
| Calibrate all devices | 校准所有设备 |
| AutoLoad folder | 自动加载文件夹 |
| GyroConfigs folder | 陀螺仪配置文件夹 |
| Calculate RWC | 计算校准值 |
| Hide when minimized | 最小化时隐藏 |
| Quit | 退出 |

只修改字符串数据，文件大小不变，不触碰任何代码逻辑。

## 用法

1. 从 [官方 Releases](https://github.com/Electronicks/JoyShockMapper/releases) 下载
   `JoyShockMapper_x64.zip` 并解压
2. 在本目录运行（把 exe 路径换成你的实际路径）：

```powershell
powershell -ExecutionPolicy Bypass -File patch-jsm-zh.ps1 -Exe "C:\你的路径\JoyShockMapper.exe"
```

3. 启动 JoyShockMapper，托盘右键菜单即为中文

## 许可证

补丁脚本为本仓库作者编写，MIT License。
JoyShockMapper 本身为 MIT License，版权归 Julian "Jibb" Smart 与 Nicolas Lessard 所有，
详见仓库根目录 LICENSE.md。
