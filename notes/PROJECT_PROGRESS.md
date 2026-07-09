# Statistical Modelling and Inference 笔记项目进度

更新时间：2026-06-17

## 项目目标

本课程笔记计划分成两个相互交叉引用但相对独立的文件：

1. **知识笔记**：聚焦课程知识点、定义、公式、证明、概念辨析与课件勘误。
2. **题型/方法笔记**：基于作业题、习题、测试题整理题型、做题模板、易错点与技巧。

知识笔记的课件覆盖整理已经完成；下一阶段将转向样卷/作业交叉核对与题型/方法笔记。

## 考试范围与整理规则

1. **明确排除范围**  
   ANOVA/ANCOVA、R 编程、P-value 与 Power 不进入期末考试范围，不纳入知识笔记或题型笔记。2026-06-17 教师录音进一步确认：polynomial regression 与 nested-model comparison 不考；multiple regression 不考大数据集手算、R 操作、图形或 computer-based model fitting。Week 10、Week 11 涉及 ANOVA；Week 4 Lecture 2 是 R/RStudio 入门；Week 6 的 polynomial / nested-model 内容仅登记来源，不作为期末重点整理。

2. **考试重点限定为四个模块**  
   - 无偏估计与 MSE；
   - Estimation \& Testing：单总体均值、两总体均值、未知方差、总体比例的 CI 与临界值检验；
   - Regression Modelling：Simple Linear 的手算与基础推导；Multiple 的矩阵最小二乘、估计量性质与残差性质证明；
   - Inference for MLE：Normal、Binomial、Poisson、Exponential、Fisher information 与渐近推断。

3. **基石公式必须重点标出**  
   对期末考试不会随试卷给出的基础公式，在知识笔记中统一使用橙色“必须记忆/基石公式”盒。已覆盖 MSE、无偏估计量、CI/检验统计量、最小二乘、残差、MLE、Fisher information、MLE 渐近标准误与推断公式。

4. **重要证明要写完整**  
   已完整整理 MSE 分解、样本均值/比例/方差无偏性、简单最小二乘公式、多元矩阵最小二乘、简单/多元回归估计量无偏性、残差性质、Normal/Binomial/Poisson/Exponential MLE 与 Fisher information 推导。

## 当前产物

| 文件 | 用途 | 状态 |
|---|---|---|
| `notes/SMI_Knowledge_Notes.tex` | 课程知识笔记主文件 | v1.1 已按最终考试范围重构并完成公式/证明审计 |
| `notes/SMI_Knowledge_Notes.pdf` | 知识笔记编译版 | v1.1 已重新编译，35 页 |
| `notes/SMI_Final_Review_2026.tex` | 期末复习与公式速查稿 | 已同步最终考试范围并完成公式/证明复核 |
| `notes/SMI_Final_Review_2026.pdf` | 期末复习编译版 | 已重新编译，32 页 |
| `notes/SMI_Final_Sample_Exam_With_Solutions.tex` | 五题制样卷与详细解析 | 已按 2026-06-17 录音确认与 Week 9 备课图重构第 5 题 |
| `notes/SMI_Final_Sample_Exam_With_Solutions.pdf` | 样卷编译版 | 已按最新范围重新编译，12 页 |
| `notes/SMI_Final_Sample_Exam_2_With_Solutions_2026.tex` | 第二套五题制样卷与详细解析 | 已按最新范围编制，增加配对样本、矩阵 OLS 与边界 MLE |
| `notes/SMI_Final_Sample_Exam_2_With_Solutions_2026.pdf` | 第二套样卷编译版 | 已编译并完成关键页渲染检查，12 页 |
| `notes/SMI_Final_Problem_Templates_2026.tex` | 题型方法、答题模板与证明清单 | 已结合笔记、Assignment 1/2 与样卷整理 |
| `notes/SMI_Final_Problem_Templates_2026.pdf` | 题型模板编译版 | 已整合课件例题并完成关键页渲染检查，23 页 |
| `notes/PROJECT_PROGRESS.md` | 项目进度与待办追踪 | 已建立 |

## 已读取资料

| 资料 | 页数 | 主题 | 本轮处理状态 |
|---|---:|---|---|
| `slides/Introduction & Week 1.pdf` | 26 | 课程介绍、统计推断、估计量、偏差、MSE | 已整理进知识笔记 |
| `slides/SM&I Week 1, Lecture 2.pdf` | 36 | 单总体均值 CI、假设检验、Power | 已整理 CI 与临界值检验；Power 排除 |
| `slides/SM&I Week 1, L2 and W2, L1.pdf` | 39 | 单总体均值 CI、假设检验、Power、课堂问题 | 已作为更完整来源；Power 排除 |
| `slides/SM&I Week 2, Lecture 2.pdf` | 27 | 两总体均值：独立样本、pooled t、配对样本 | 已整理进知识笔记 |
| `slides/SM&I Week 3, Lecture 2.pdf` | 27 | 与 Week 2 Lecture 2 几乎相同 | 标记为重复来源 |
| `slides/Week 3, Lecture 2.pdf` | 15 | 单/两总体比例推断 | 已读取 |
| `slides/Week 3, Lecture 2_updated.pdf` | 15 | 单/两总体比例推断 updated | 已作为比例推断主要来源 |
| `slides/Week 4.pdf` | 41 | 简单线性回归、最小二乘、预测区间 | 已整理进知识笔记 |
| `slides/Week 4, lecture 2.pdf` | 23 | R 与 RStudio 入门 | 排除，不纳入考试笔记 |
| `slides/Week 5, Lecture 1.pdf` | 32 | 回归复习、残差、相关、R² | 已整理进知识笔记 |
| `slides/Week 5, Lecture 2.pdf` | 13 | 多元线性回归、矩阵最小二乘；含 ANOVA summary | 已整理非 ANOVA 内容，并补全矩阵推导 |
| `slides/Week 6.pdf` | 47 | Polynomial regression、nested-model comparison；含 ANOVA estimation | 不属于最终四个重点模块，已移出知识笔记 |
| `slides/Week 9.pdf` | 6 | 回归参数估计定理、残差性质、\(\sigma^2\) 估计 | 已整理，含无偏性完整证明 |
| `slides/Week 12.pdf` | 22 | Maximum Likelihood Estimation | 已整理 |
| `slides/Week 13&14(1).pdf` | 10 | 常见分布 MLE、Fisher information | 已整理，并补全课件留作练习的推导 |

## 最终范围覆盖状态

| 模块 | 状态 | 说明 |
|---|---|---|
| 无偏估计、MSE | 已完成 | 含核心无偏估计量与完整证明 |
| Estimation & Testing | 已完成 | CI 与临界值法；不含 P-value/Power |
| Regression Modelling | 已完成 | Simple/Multiple、least squares、residuals |
| Inference for MLE | 已完成 | 四类分布、Fisher information、渐近 CI/检验 |
| ANOVA、R 编程、P-value、Power | 排除 | 不进入期末范围 |

## 公式与证明审计清单

| 重点 | 基石公式 | 完整证明/推导 | 状态 |
|---|---|---|---|
| 无偏估计与 MSE | bias、MSE 分解、期望/方差运算、无偏修正、最优线性组合 | MSE 分解；样本均值、比例、方差无偏性 | 已覆盖并标明 |
| Estimation & Testing | 单均值 \(z/t\)、两均值大样本/pooled/paired、单/两比例 CI 与检验、通用临界值规则 | 标准误来源与检验结构已解释；仅使用临界值法 | 已覆盖并标明 |
| Simple/Multiple Regression | \(\hat\beta_0,\hat\beta_1\)、SSE、误差方差、回归 CI/PI、矩阵 OLS、hat matrix、残差性质 | 简单 OLS 正规方程；简单/多元 OLS 无偏性与方差；残差期望与方差 | 已覆盖并标明 |
| Inference for MLE | likelihood/log-likelihood、四类分布 MLE、Fisher information、渐近 SE/CI/Wald 临界值检验 | Normal、Binomial、Poisson、Exponential MLE；Fisher information；Normal 联合 MLE | 已覆盖并标明 |

## 本轮完成内容

- 建立知识笔记 LaTeX 主文件 `notes/SMI_Knowledge_Notes.tex`。
- 建立项目进度文档 `notes/PROJECT_PROGRESS.md`。
- 梳理并写入以下章节：
  - 统计推断基础；
  - 估计量、偏差与 MSE；
  - 单总体均值置信区间；
  - 单总体均值假设检验；
  - 两总体均值推断；
  - 单总体/两总体比例推断；
  - 简单线性回归与最小二乘；
  - 斜率检验、预测区间、均值响应置信区间；
  - 残差诊断、相关系数与决定系数。
- 对重复课件做了初步归并：
  - Week 1 Lecture 2 与 Week 1 L2 + Week 2 L1 大量重复；
  - Week 2 Lecture 2 与 SM&I Week 3 Lecture 2 几乎重复；
  - Week 3 Lecture 2 与 updated 版主题相同，updated 版优先。
- 已用 `xelatex` 成功编译知识笔记，并用 `latexmk -c` 清理临时文件。
- 2026-06-02 已登记新增课件 Week 6、Week 9、Week 12，并更新期末范围规则：ANOVA 不再纳入后续笔记。
- 2026-06-02 v0.2 已完成：
  - 将基石公式改用橙色“必须记忆/基石公式”盒重点标出；
  - 整理 Week 9 的回归估计量无偏性、方差、协方差、平均响应估计量与残差性质；
  - 曾整理 Week 6 的 polynomial regression / non-linear effects 与嵌套模型比较；该部分已在 v1.1 按最终范围移除；
  - 整理 Week 12 的 MLE、likelihood/log-likelihood、coin flip、normal mean 与 normal variance MLE；
  - 知识笔记继续排除 ANOVA/ANCOVA 内容；
  - 已重新编译 v0.2 PDF，共 28 页，并清理 TeX 临时文件。
- 2026-06-15 v1.0 最后一轮课件整理已完成：
  - 曾整理 Week 4 Lecture 2 的 R/RStudio 基础；该部分已在 v1.1 按最终范围移除；
  - 整理 Week 5 Lecture 2 的多元线性回归、矩阵最小二乘、hat matrix、残差自由度；
  - 补全多元最小二乘估计量的无偏性与方差推导；
  - 整理 Week 13--14 的 Poisson、Binomial、Exponential、Normal MLE；
  - 补全 Fisher information 定义、可加性、常见模型推导与信息矩阵；
  - 记录 Week 13--14 中 Binomial 与 Normal 支撑集笔误；
  - 全部课件中属于最终四个重点模块的内容已完成覆盖；
  - 已重新编译 v1.0 PDF，共 35 页，并完成无警告编译核对与临时文件清理。
- 2026-06-15 v1.1 最终考试范围修订：
  - 排除 ANOVA/ANCOVA、R 编程、P-value、Power；
  - 移除不属于最终四个重点模块的 polynomial / nested-model 内容；
  - 所有假设检验改为临界值法；
  - 补全样本均值、样本比例、样本方差的无偏性证明；
  - 补全简单最小二乘公式推导与残差期望/方差证明；
  - 补全 Normal 联合 MLE 推导；
  - 增加 Binomial Fisher information，以及四类分布 MLE 的渐近标准误、CI 与临界值检验；
  - 对所有基石公式与重要证明完成逐项审计；
  - 同步修订期末复习稿，移除 polynomial regression，并修正 MSE 分解证明中的公式排版错误；
  - 已重新编译知识笔记 PDF（35 页）与期末复习 PDF（29 页），并完成编译核对与临时文件清理。
- 2026-06-17 v1.2 教师录音确认后的范围修订：
  - 以线程 `019ed489-9188-7ff0-a7fe-4b550f518538` 的录音转写结论作为最新考试情报；
  - 明确 polynomial regression 不考，覆盖此前由黑板照片产生的“多项式回归是重点”的临时判断；
  - 明确 multiple linear regression 只按理论推导/证明准备，不按大数据手算、R、图形或 computer-based fitting 准备；
  - 在期末复习稿中加入录音确认说明，并将 polynomial regression 正文替换为“不纳入期末”的短说明；
  - 将样卷调整为五道大题：删除 polynomial regression 小题；第 5 题当时先改为“多元回归理论证明 + 四类分布 MLE 推断”，后续已在 v1.3 根据教师备课图调整为 Week 9 简单回归证明；
  - 重新编译受影响 PDF，并完成关键词、日志与版面检查。
- 2026-06-17 v1.3 教师备课图与 Week 9 证明复核：
  - 核对教师手写备课笔记后，确认其证明主线是简单线性回归的 Week 9 标量证明，而不是以多元矩阵证明为主；
  - 复习讲义补入 $a_i=(x_i-\bar x)/S_{xx}$、$b_i=1/n-\bar x a_i$ 的证明入口，以及 $\hat\beta_0,\hat\beta_1$ 的期望、方差、协方差推导；
  - 复习讲义补入残差 $e_i=Y_i-\bar Y-(x_i-\bar x)\hat\beta_1$ 的期望与方差标量证明；
  - 样卷第 5 题第一部分由多元矩阵证明改为 Week 9 简单回归证明，模拟“给出部分恒等式后证明目标结论”的考试形式；
  - 多元矩阵最小二乘与残差性质仍保留在复习讲义中，作为录音确认的 theoretical inference 补充。
- 2026-06-17 v1.4 题型方法与答题模板笔记：
  - 新增 `SMI_Final_Problem_Templates_2026.tex/pdf`，定位为考场题型识别、做题步骤、答题模板与证明清单；
  - 结合 Assignment 1 的样本均值/样本方差无偏证明、单总体均值推断、两总体均值推断；
  - 结合 Assignment 2 的简单线性回归拟合、残差标准误、斜率检验、均值响应 CI 与单个预测 PI；
  - 结合 Sample Exam 1/2、2025 sample、旧 final/prep 与当前样卷，整理 Bias/MSE、Estimation \& Testing、Regression、MLE 四大模块的常见问法；
  - 保持最新考试范围口径：ANOVA、R 编程、P-value、Power、polynomial regression、nested-model comparison 只作排除提醒，不纳入核心模板；
  - 已重新编译 PDF（19 页），完成日志检查和关键页渲染检查。
- 2026-06-18 v1.5 课件例题整合：
  - 阅读 `slides` 文件夹中与当前考试范围相关的课件例题，并将可迁移题型补入 `SMI_Final_Problem_Templates_2026.tex/pdf`；
  - 新增 Week 1 线性偏估计修正模板：若 \(\E(\hat\theta)=a\theta+b\)，则 \((\hat\theta-b)/a\) 为无偏修正；
  - 新增 Week 1 单总体均值 CI 与双尾检验短例；
  - 新增 Week 2 两独立大样本均值、pooled \(t\)、paired samples 三类例题；
  - 新增 Week 3 diabetic foot 单总体比例检验例题；
  - 新增 Week 4 教育-收入简单回归手算例题，并加入 baseball 例题算术警示；
  - 新增 Week 5 残差图、相关系数与 \(R^2\) 的解释模板；
  - 新增 Week 12 硬币 MLE 例题，强调参数空间、端点检查和二阶导检查；
  - 继续排除 Week 4 Lecture 2 的 R/RStudio、Week 6 的 polynomial/nested/ANOVA 内容，以及旧材料中的 P-value/Power；
  - 已重新编译 PDF（23 页），完成日志关键词检查和关键页渲染检查。
- 2026-06-18 v1.6 第二套期末模拟样卷：
  - 新增 `SMI_Final_Sample_Exam_2_With_Solutions_2026.tex/pdf`，采用五题各 20 分、满分 100 分的结构；
  - 第 1 题覆盖 MSE 分解、线性有偏估计修正和两个无偏估计量的最优组合；
  - 第 2 题覆盖未知方差单均值 \(t\) 推断，以及比例 CI 与检验标准误的区别；
  - 第 3 题覆盖 paired samples 与两个独立大样本均值推断；
  - 第 4 题覆盖简单回归手算、斜率检验、mean-response CI、prediction interval，以及 multiple regression 的矩阵 OLS、无偏性、方差和残差正交证明；
  - 第 5 题覆盖 Normal、Binomial、Poisson、Exponential 的 MLE，其中 Binomial 题专门考查边界 MLE 与 Wald 近似失效；
  - 所有检验仅采用临界值法，继续排除 ANOVA、R、P-value、Power、polynomial regression 和 nested-model comparison；
  - 数值结果使用 Octave 复核；PDF 最终为 12 页，日志无 LaTeX Error、Undefined control sequence 或 Overfull，关键页渲染正常。

## 已发现的课件疑似问题

1. **假设检验措辞**  
   课件有时写 “accept \(H_0\)”。知识笔记中改用更严谨的 “fail to reject \(H_0\)”。

2. **Week 3 比例推断公式页提取不完整**  
   PDF 文本抽取中部分公式页显示为空或缺失。知识笔记根据课件标题和标准大样本比例推断公式补全，后续若有清晰课件/板书需要再次核对。

3. **Week 4 棒球回归例题疑似算术笔误**  
   课件给出 \(SS_{xy}=0.003302\)、\(SS_x=0.001182\)，所以
   \[
   \hat\beta_1 = SS_{xy}/SS_x \approx 2.7941,
   \]
   但课件后面写成 \(0.7941\)。相应截距应约为 \(-0.2268\)，而不是 \(0.2935\)。该结果已用本地计算复核（本次用 Octave 复算）。

4. **Week 5 Lecture 2 矩阵推导表述不严谨**  
   课件演示中从 \(Y=X\beta+\varepsilon\) 写到 \(Y=X\beta\)，容易被理解为直接删去误差项。知识笔记改为从最小化残差平方和严格推出正规方程与 \(\hat\beta=(X^\mathsf{T}X)^{-1}X^\mathsf{T}Y\)。

5. **Week 13--14 分布支撑集笔误**  
   课件在 Binomial 与 Normal 例题下方沿用了不正确的支撑集文字。知识笔记已明确：Binomial 支撑集为 \(\{0,\ldots,m\}\)，Normal 支撑集为 \(\mathbb R\)。

## 下一步建议

1. 使用样卷、作业和测试题对四个重点模块进行交叉核对，发现遗漏或不同符号约定时回补。
2. 考前基于橙色“必须记忆/基石公式”盒制作公式清单。
3. 若老师补充第三张黑板图中的未确认式子，再回补到题型模板和复习讲义中。

## 操作约定

- 新增或修改项目文件前先说明将要改动的文件与目的。
- Python 命令必须先运行 `source ~/venvs/py313/bin/activate`。
- 读取图片文件前先向用户汇报，避免对图像内容作未经核实的判断。
- TeX 编译完成后清理临时文件。
