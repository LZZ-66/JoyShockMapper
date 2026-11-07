# patch-jsm-zh.ps1
# 将 JoyShockMapper 托盘右键菜单本地化为中文 (UTF-16 字符串原地替换)
# 用法:
#   powershell -ExecutionPolicy Bypass -File patch-jsm-zh.ps1 -Exe "C:\路径\JoyShockMapper.exe"
# 默认 -Exe 为当前目录下的 JoyShockMapper.exe
param(
    [string]$Exe = (Join-Path (Get-Location) 'JoyShockMapper.exe')
)

$ErrorActionPreference = 'Stop'
if (-not (Test-Path $Exe)) { throw "未找到: $Exe (请用 -Exe 指定 JoyShockMapper.exe 路径)" }

$pairs = @(
    @('Show Console', '显示控制台'),
    @('Reconnect controllers', '重新连接手柄'),
    @('AutoLoad', '自动加载配置'),
    @('AutoConnect', '自动连接手柄'),
    @('Whitelist', '白名单'),
    @('Calibrate all devices', '校准所有设备'),
    @('AutoLoad folder', '自动加载文件夹'),
    @('GyroConfigs folder', '陀螺仪配置文件夹'),
    @('Calculate RWC', '计算校准值'),
    @('Hide when minimized', '最小化时隐藏'),
    @('Quit', '退出')
)

$bytes = [System.IO.File]::ReadAllBytes($Exe)
$s = [System.Text.Encoding]::Unicode.GetString($bytes)
foreach ($p in $pairs) {
    $en = [System.Text.Encoding]::Unicode.GetBytes($p[0])
    $zh = [System.Text.Encoding]::Unicode.GetBytes($p[1])
    if ($zh.Length -gt $en.Length) { Write-Warning "跳过 '$($p[0])': 中文比英文长"; continue }
    $idx = $s.IndexOf($p[0]); $n = 0
    while ($idx -ge 0) {
        $off = $idx * 2
        for ($i = 0; $i -lt $en.Length; $i++) { $bytes[$off + $i] = $(if ($i -lt $zh.Length) { $zh[$i] } else { 0 }) }
        $n++; $idx = $s.IndexOf($p[0], $idx + 1)
    }
    Write-Host "  '$($p[0])' -> '$($p[1])': $n 处"
}
[System.IO.File]::WriteAllBytes($Exe, $bytes)
Write-Host "完成: $Exe"
