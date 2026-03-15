import fitz
import os

# 使用短路径或 8.3 格式
pdf_dir = r"C:\Users\micha\.openclaw\qqbot\downloads"
files = os.listdir(pdf_dir)
print("目录中的文件:")
for f in files:
    if '课程方案' in f and f.endswith('.pdf'):
        print(f"  找到：{f}")

# 找到目标文件
target_file = None
for f in files:
    if '课程方案' in f and '1773566386707' in f:
        target_file = f
        break

if target_file:
    pdf_path = os.path.join(pdf_dir, target_file)
    print(f"\n正在处理：{pdf_path}")
    doc = fitz.open(pdf_path)
    print(f"总页数：{len(doc)}\n")
    print("="*60)
    full_text = ""
    for i, page in enumerate(doc):
        page_text = page.get_text()
        full_text += page_text
        print(f"--- 第 {i+1} 页 ---")
        print(page_text)
        print()
else:
    print("未找到目标文件")
