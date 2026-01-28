#!/bin/bash

# 设置 API URL 和 Key
export OPENAI_API_BASE="https://api.uniapi.io/v1"
export OPENAI_API_KEY="sk-v621DGxJD4FRyKi_Xb7bkzyUEU7Y83ydzj9LQYMzqutPtofdFPkUEfSwOpM"

# 设置工作目录
cd /data01/wangzy/mini-swe-agent

# 确保在 msa 虚拟环境或正确配置的环境中
# 假设已经安装了 mini-swe-agent 及其依赖
# pip install -e .

# 忽略 Cost 计算错误
export MSWEA_COST_TRACKING='ignore_errors'

# 运行 SWE-bench Verified 评估
# 使用 Qwen3-8B 模型
# --subset verified 选择 SWE-bench Verified 数据集
# --model 指定模型名称，这里假设使用 openai 兼容接口调用 qwen3-8b
# --output 指定输出目录
# --workers 指定并行工作的线程数，根据机器配置调整
# --slice 0:1 仅运行第一个实例进行测试验证，全量运行去掉此参数

python3 src/minisweagent/run/extra/swebench.py \
    --subset verified \
    --model "openai/deepseek-v3.2" \
    --output "results/qwen3-8b-verified" \
    --workers 1 \
    --slice 0:1 \
    --temperature 1.0 \
    --max_tokens 32768 \
    --split test
    
