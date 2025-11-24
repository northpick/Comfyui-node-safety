@echo off
:: 强制当前窗口使用 UTF-8 编码（解决中文乱码）
chcp 65001 >nul
echo ========================================
echo   ComfyUI 一键强制修复核心依赖（2025修正版）
echo ========================================
echo.

echo 正在强制恢复官方源能下的核心包（torch 四件套 + xformers + numpy 等）...
.\python_embeded\python.exe -m pip install --upgrade --force-reinstall --no-deps ^
    torch torchvision torchaudio xformers numpy ^
    --index-url https://download.pytorch.org/whl/cu128

echo.
echo 正在从 pypi 恢复剩下的核心包（scipy、opencv、transformers 等）...
.\python_embeded\python.exe -m pip install --upgrade --force-reinstall --no-deps ^
    scipy opencv-python opencv-python-headless ^
    transformers diffusers accelerate protobuf

echo.
echo 全部修复完成！现在可以关闭窗口，用启动器正常打开 ComfyUI 了。
pause
