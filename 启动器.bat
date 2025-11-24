@echo off
:: 强制当前窗口使用 UTF-8 编码（解决中文乱码）
chcp 65001 >nul
echo ComfyUI 永不降级启动中...

:: 只做一件事：禁止降级核心包（0 流量，毫秒级）
set PIP_CONSTRAINT=%~dp0\constraints.txt

echo 启动 ComfyUI（已永久防降级）
.\python_embeded\python.exe -s ComfyUI\main.py --windows-standalone-build --lowvram --fast fp16_accumulation
echo If you see this and ComfyUI did not start try updating your Nvidia Drivers to the latest.
pause
