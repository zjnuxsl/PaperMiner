# PaperMiner - 智能论文内容提取工具

基于 MinerU 2.5 构建的 PDF 智能批量处理工具，支持文本、图片、表格、公式的智能提取与多格式输出（Markdown、Excel、Word 等）。

## 主要特性

### 智能提取

- **批量处理**：一次处理多个 PDF 文件
- **智能识别**：自动识别图片编号（Fig.1, Figure 2 等）
- **多格式输出**：
  - 表格：JPG + Excel（.xlsx）双格式，支持复杂表格结构
  - 公式：图片 + LaTeX 文本汇总
  - 图片：智能命名，自动排除公式和表格
  - Word：按原文顺序整合图表
  - Markdown：图表汇总文件

### 智能章节提取

- **双引擎策略**：正则表达式优先（快速）+ LLM 质量检查（智能）
- **自动质量检查**：检测缺失章节、内容过短、提取不完整等问题
- **智能补充**：只在发现质量问题时才调用 LLM，节省成本
- **支持模型**：Deepseek（成本低、速度快、稳定）
- **提取章节**：Abstract、Introduction、Methods、Results & Discussion、Conclusion
- **格式适配**：
  - 支持多种标题格式（有/无 # 标记、有/无编号）
  - 识别章节变体（Materials→Methods、Experimental→Methods等）
  - 支持全角/半角标点
  - 适应不同论文结构

### 性能与体验

- **两种模式**：完整处理 / 仅提取
- **GPU 加速**：支持 CUDA 加速处理
- **清晰结构**：统一的 extract 文件夹输出

## 快速开始

### 先决条件

- 已安装 Anaconda 或 Miniconda，安装路径可为 C: 或 D: 等任意磁盘（如 `D:\miniconda3`）
- 一般无需手动配置系统环境变量；只需确保在 CMD 中执行 `conda --version` 可用
- 若不可用，可使用“Anaconda Prompt”，或执行 `conda init cmd.exe` 后重启 CMD，或将 `<安装目录>\condabin` 加入 `PATH`
- 本项目自带的 `运行程序.bat` 会自动查找 `conda.bat`（从 PATH 与常见安装目录）；如使用非常规安装路径，可在脚本中手动设置 `CONDA_BAT`

### 安装步骤

```bash
# 1) 创建并激活 Conda 环境
conda create -n MinerU python=3.12 -y
conda activate MinerU

# 2) 安装核心依赖
pip install -U "mineru[core]"

# 3) 安装提取功能依赖（必需）
pip install pandas openpyxl beautifulsoup4 python-docx lxml

# 3.5) 安装 LLM 功能依赖（可选，用于章节提取）
pip install requests python-dotenv

# 4) 安装 PyTorch（CPU 或 GPU 二选一）
# CPU 版本（通用）
conda install pytorch torchvision torchaudio cpuonly -c pytorch
# GPU 版本（示例：CUDA 12.1）
conda install pytorch torchvision torchaudio pytorch-cuda=12.1 -c pytorch -c nvidia

# 5) 下载模型
# 国内网络：推荐使用 ModelScope（稳定、速度快）
mineru-models-download --source modelscope --model_type pipeline
# 国外/公网：可使用 Hugging Face 源
mineru-models-download --source hf --model_type pipeline
# 如不确定支持的源，可运行：
mineru-models-download --help

# 6) 启动 GUI
双击 “运行程序.bat”
```

### 依赖包说明

**核心依赖**（必需）：

- `mineru[core]` - MinerU 核心功能
- `pandas` - 数据处理
- `openpyxl` - Excel 文件生成
- `beautifulsoup4` - HTML 表格解析
- `python-docx` - Word 文档生成
- `lxml` - XML 解析

**LLM 功能依赖**（可选，用于章节提取）：

- `requests` - HTTP 请求
- `python-dotenv` - 读取 .env 配置文件

**可选依赖**：

- 如果不安装 `pandas` 和 `openpyxl`，表格只会保存为 JPG 格式（不生成 Excel）
- 如果不安装 `python-docx`，不会生成 Word 文档
- 如果不安装 `requests` 和 `python-dotenv`，章节提取功能不可用
- 其他功能不受影响

更多细节、网络加速与故障处理见文档：`docs/快速安装指南.md`。

---

## 使用说明

### 基本流程

1. **放入 PDF 文件**
   - 将待处理的 PDF 文件放入 `input/` 目录

2. **启动程序**
   - 双击 `运行程序.bat` 启动 GUI 界面

3. **选择处理选项**
   - 提取文字 (Markdown)
   - 提取公式 (LaTeX)
   - 提取图片（智能识别编号）
   - 提取表格 (Excel)
   - 提取论文章节（正则表达式 + LLM）

4. **开始处理**
   - 选择处理模式：完整处理 / 仅提取
   - 点击"开始处理"
   - 查看控制台日志了解处理进度

5. **查看结果**
   - MinerU 原始输出：`output/raw/[PDF名称]/auto/`
   - 智能提取结果：`output/extract/[PDF名称]/`

## 目录结构

### 项目根目录

```
MinerU/
├── input/                        # 输入PDF目录
├── output/
│   ├── raw/                      # MinerU原始输出
│   │   └── [PDF名称]/
│   │       └── auto/
│   │           ├── [PDF名称].md  # 完整Markdown
│   │           ├── images/       # 所有图片
│   │           └── *.json        # 元数据文件
│   └── extract/                  # 智能提取结果
│       └── [PDF名称]/
│           ├── [PDF名称].md      # 完整文本（修复图片路径）
│           ├── Figure/           # 图片文件
│           ├── Tables/           # 表格（JPG + Excel）
│           ├── Formula/          # 公式
│           ├── Sections/         # 论文章节
│           └── Word/             # Word文档
├── scripts/
│   ├── batch_pdf_processor_gui.py  # GUI主程序
│   ├── llm_helper.py              # LLM章节提取
│   └── prompts/                   # LLM提示词
│       └── section_extraction_prompt.txt
├── docs/
│   └── 快速安装指南.md            # 详细安装与故障排查
└── 运行程序.bat                   # GUI启动脚本
```

### 输出文件详细结构

处理一个PDF后，`output/extract/[PDF名称]/` 包含：

```
[PDF名称]/
├── [PDF名称].md                      # 完整文档（修复图片路径）
├── Figure/                           # 图片文件夹
│   ├── Fig.1.jpg                     # 智能命名的图片
│   ├── Fig.2.jpg
│   ├── image_1.jpg                   # 其他图片
│   └── image_mapping.json            # 图片映射关系
├── Tables/                           # 表格文件夹
│   ├── Table_1.jpg                   # 表格图片
│   ├── Table_1.xlsx                  # 表格Excel文件
│   ├── Table_2.jpg
│   └── Table_2.xlsx
├── Formula/                          # 公式文件夹
│   ├── formula_1.jpg
│   ├── formula_2.jpg
│   └── [PDF名称]_formula.md          # 公式汇总Markdown
├── Sections/                         # 章节文件夹
│   ├── Abstract.md                   # 摘要
│   ├── Introduction.md               # 引言
│   ├── Methods.md                    # 方法
│   ├── Results & Discussion.md       # 结果与讨论
│   └── Conclusion.md                 # 结论
└── Word/                             # Word文档
    ├── [PDF名称]_图表.docx            # 图表Word文档
    └── [PDF名称]_图表汇总.md          # 图表汇总Markdown
```

## 模型下载说明

- 国内网络：优先使用 `--source modelscope`。
- 国外/公网：推荐使用 `--source hf`（Hugging Face）。
- 如下载失败或速度慢：
  - 尝试更换 `--source`；
  - 再次执行命令（断点续下）；
  - 检查用户目录中的配置文件 `C:\Users\<用户名>\mineru.json` 是否生成且包含 `models-dir.pipeline` 路径。

## 常见问题速查

- `mineru: command not found`：未激活环境，执行 `conda activate MinerU` 后重试。
- 安装超时：切换国内 pip 源，例如 `-i https://mirrors.aliyun.com/pypi/simple`。
- GPU 不可用：先按 CPU 版本 PyTorch 运行，或检查驱动/CUDA 与 `pytorch-cuda` 版本匹配。
- 看到 `torch.load(weights_only=False)` 的 FutureWarning：信息提示，可忽略，不影响运行。

## 系统要求

- Windows 10/11，Python 3.10–3.13（推荐 3.12）
- 内存 8GB+（CPU 模式建议 16GB+）
- 首次安装需下载模型（约 2GB）

## 智能章节提取功能详解

### 功能特点

本工具采用**双引擎策略**，结合正则表达式和大语言模型的优势：

1. **正则表达式引擎**（主力）
   - 快速：毫秒级完成
   - 免费：无 API 调用成本
   - 准确：不修改原文内容
   - 覆盖 90%+ 的标准论文格式

2. **LLM 质量检查**（备用）
   - 智能检测：4 项质量检查标准
   - 按需调用：只在发现问题时启用
   - 智能补充：补充缺失或改进不完整的章节
   - 保留原文：优先使用正则表达式结果

### 质量检查标准

LLM 会在以下情况自动触发：

| 检查项         | 触发条件                                                          | 处理方式          |
| -------------- | ----------------------------------------------------------------- | ----------------- |
| 完全失败       | 未提取到任何章节                                                  | LLM 重新提取      |
| 缺少关键章节   | 缺少 Abstract/Introduction/Methods/Results & Discussion/Conclusion | LLM 补充缺失章节  |
| 内容过短       | 章节内容 < 100 字符                                               | LLM 重新提取该章节 |
| 数量异常       | 提取章节 < 2 个                                                   | LLM 重新提取      |

### 配置与使用

#### 1. 安装依赖（仅首次）

```bash
conda activate MinerU
pip install requests python-dotenv
```

#### 2. 配置 API Key

在项目根目录创建 `.env` 文件：

```env
# DeepSeek API（成本低 ~¥0.0003/篇，速度快）
DEEPSEEK_API_KEY=sk-your_deepseek_api_key_here
```

**获取 API Key**：

- Deepseek: https://platform.deepseek.com/
  - 注册账户
  - 充值（最低¥10）
  - 创建 API Key

#### 3. 使用方法

1. 启动 GUI（双击 `运行程序.bat`）
2. 勾选"提取论文章节 (正则表达式 + LLM)"
3. 点击"开始处理"

### 提取的章节

- **Abstract**（摘要）- 支持 `Abstract:`、`# Abstract`、`ABSTRACT` 等格式
- **Introduction**（引言）- 支持 `Introduction`、`Background`、`1. Introduction` 等
- **Methods**（方法）- 支持 `Methods`、`Materials`、`Experimental` 等
- **Results & Discussion**（结果与讨论）- 支持合并或分离格式
- **Conclusion**（结论）- 支持 `Conclusion`、`Conclusions`、`Summary` 等

### 输出位置

```
output/extract/[PDF名称]/Sections/
  ├── Abstract.md
  ├── Introduction.md
  ├── Methods.md
  ├── Results & Discussion.md
  └── Conclusion.md
```

### 性能统计

| 指标       | 正则表达式 | LLM      | 混合策略（当前） |
| ---------- | ---------- | -------- | ---------------- |
| 成功率     | ~90%       | ~95%     | **~98%**         |
| 平均速度   | <10ms      | 10-30s   | **~500ms**       |
| 平均成本   | 免费       | ¥0.002   | **¥0.0002**      |
| LLM 调用率 | -          | 100%     | **~10%**         |

### 使用建议

**推荐做法**：

- 首次使用先测试 1-2 个 PDF，检查提取质量
- 观察控制台日志，了解是否触发 LLM
- 对比原文检查章节完整性
- 不配置 API Key 也能用（仅正则表达式，90% 成功率）

### 高级配置

可在 `scripts/batch_pdf_processor_gui.py` 第1403行调整：

```python
# 关键章节列表（缺少时触发LLM）
critical_sections = ['Abstract', 'Introduction', 'Methods', 'Results & Discussion', 'Conclusion']

# 内容长度阈值（字符数）
min_content_length = 100

# 章节数量阈值
min_section_count = 2
```

### 常见问题

**Q: 为什么没有触发 LLM？**
A: 说明正则表达式提取质量很好！90% 的标准论文都不需要 LLM。

**Q: LLM 会修改内容吗？**
A: 可能会调整格式。建议对比原文检查，或手动从完整 Markdown 复制。

**Q: 成本会很高吗？**
A: 不会。平均每篇几分钱。

**Q: 不想用 LLM 可以吗？**
A: 可以！不配置 API Key 即可，仍能提取 90%+ 的论文。

---

本项目基于 MinerU 2.5 构建，遵循其开源协议。
