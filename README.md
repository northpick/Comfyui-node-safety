# Comfyui-node-safety
只需增加几行代码，就能防止python核心包被新添加节点强制降级，导致连锁反应（启动器启动失败，一大堆节点报错等）。

#说明：启动器.bat是在原启动器run_nvidia_gpu_fast_fp16_accumulation.bat进行修改，具体增加代码如下：
:: 强制当前窗口使用 UTF-8 编码（解决中文乱码）
chcp 65001 >nul
:: 禁止constraints.txt中的核心包降级
set PIP_CONSTRAINT=%~dp0\constraints.txt
:: 优化显存，显卡好可删除（都用上fast_fp16了，加这一行也正常）
--lowvram
::升级低版本包（如果不小心被降级了）
一键修复与强制恢复.bat
::包含绝大多数核心包，防止降级，也可手动录入新包
constraints.txt

#使用方法：将这些文件复制到comfyui的根目录。（如：ComfyUI_windows_portable里）
运行启动器.bat
