import pandas as pd
import os
import sys
from collections import defaultdict

def generate_js_file(language_dict, file_name):
    with open(file_name, 'w', encoding='utf-8') as f:
        f.write("export default {\n")
        for page, resources in language_dict.items():
            f.write(f"  {page}: {{\n")
            for key, value in resources.items():
                f.write(f"    {key}: '{value}',\n")
            f.write("  },\n")
        f.write("}\n")

def main(excel_path, sheet_name):
    # 读取Excel文件，从第二行开始读取数据
    df = pd.read_excel(excel_path, sheet_name=sheet_name, header=0)
    
    # 创建字典存储不同语言的内容
    zh_dict = defaultdict(dict)
    jp_dict = defaultdict(dict)
    en_dict = defaultdict(dict)
    
    # 遍历数据行
    for index, row in df.iterrows():
        key = row[1]  # B列
        zh_content = row[2]  # C列
        jp_content = row[3]  # D列
        en_content = row[4]  # E列
        page = str(row[6]).split(',')[0].replace('.vue', '')  # G列
        
        # 将内容存储到相应的字典中
        zh_dict[page][key] = zh_content
        jp_dict[page][key] = jp_content
        en_dict[page][key] = en_content
    
    # 生成语言资源文件
    generate_js_file(zh_dict, 'zh.js')
    generate_js_file(jp_dict, 'jp.js')
    generate_js_file(en_dict, 'en.js')

if __name__ == "__main__":
    if len(sys.argv) != 3:
        print("Usage: python script.py <excel_path> <sheet_name>")
        sys.exit(1)
    
    excel_path = sys.argv[1]
    sheet_name = sys.argv[2]
    
    main(excel_path, sheet_name)
