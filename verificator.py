import os
import csv

from datetime import datetime

# 定义文件夹结构模板
structure = {
    'AC': {
        'AC Wallbox': {
            'User Manual': {
                'pdf': True, 
                'pattern': "MaxiCharger AC Wallbox - User Manual"
            },
            'Quick Guide': {
                'pdf': True, 
                'pattern': ''
            },
            'Maintenance Manual': {
                'pdf': True, 
                'pattern': ''
            }
        },
        'AC Compact': {
            'User Manual': {
                'pdf': True, 
                'pattern': ''
            },
            'Quick Guide': {
                'pdf': True, 
                'pattern': ''
            }
        },
        'AC Ultra': {
            'User Manual': {
                'pdf': True, 
                'pattern': ''
            },
            'Quick Guide': {
                'pdf': True, 
                'pattern': ''
            }
        },
        'Energy Management System': {
            'Installation and Operation Manual': {
                'pdf': True, 
                'pattern': ''
            }
        }
    },
    'DC': {
        'DC Fast': {
            'Installation and Operation Manual': {
                'pdf': True, 
                'pattern': ''
            },
            'Service Manual': {
                'pdf': True, 
                'pattern': ''
            }
        },
        'DC Fast CMS': {
            'Quick Guide': {
                'pdf': True, 
                'pattern': ''
            }
        },
        'DC Compact': {
            'Installation and Operation Manual': {'pdf': True, 'pattern': ''},
            'Service Manual': {'pdf': True, 'pattern': ''}
        }
    }
}



target_folder = "target-folder"  # 目标文件夹路径

# 获取所有语言分类子文件夹的路径
language_folders = [folder for folder in os.listdir(target_folder) if os.path.isdir(os.path.join(target_folder, folder))]
# ['English_EN', 'French_FR', 'German_DE', 'Dutch_NL']

# 遍历每个语言分类子文件夹
for lang_folder in language_folders:
    lang_code = lang_folder.split("_")[-1]  # 提取语言代码

    csv_file = f"{lang_code}_verification.csv"  # CSV文件名
    csv_path = os.path.join(target_folder, lang_folder, csv_file)

    # 打开CSV文件并写入表头
    with open(csv_path, "w", newline="") as file:
        writer = csv.writer(file)
        writer.writerow(["语言", "产品分类", "产品名称", "文档名称", "更新时间", "状态"])

        # 遍历每个文档名称文件夹
        for root, dirs, files in os.walk(os.path.join(target_folder, lang_folder)):
            for folder in dirs:
                if "arch" in folder:  # 只处理包含arch子文件夹的文档名称文件夹
                    doc_folder = os.path.join(root, folder)
                    doc_name = folder.replace("arch", "").strip()  # 提取文档名称
                    product_name = os.path.basename(os.path.dirname(doc_folder))  # 提取产品名称
                    product_category = os.path.basename(os.path.dirname(os.path.dirname(doc_folder)))  # 提取产品分类

                    pdf_files = [file for file in files if file.lower().endswith(".pdf")]
                    if pdf_files:
                        latest_date = max([datetime.strptime(file.split("_")[2], "%Y%m%d") for file in pdf_files])
                        status = "up-to-date" if lang_folder == "English_EN" else "out-of-date"
                        latest_date_str = datetime.strftime(latest_date, "%Y%m%d")
                    else:
                        latest_date_str = "null"
                        status = "null"

                    writer.writerow([lang_code, product_category, product_name, doc_name, latest_date_str, status])

# 生成 README.md 文件
readme_path = os.path.join(target_folder, "README.md")
with open(readme_path, "w") as readme_file:
    readme_file.write("# 文件检索结果\n\n")
    for lang_folder in language_folders:
        lang_code = lang_folder.split("_")[-1]
        csv_file = f"{lang_code}_verification.csv"
        csv_path = os.path.join(lang_folder, csv_file)

        readme_file.write(f"## {lang_code}\n\n")
        readme_file.write(f"| 语言 | 产品分类 | 产品名称 | 文档名称 | 更新时间 | 状态 |\n")
        readme_file.write(f"| --- | --- | --- | --- | --- | --- |\n")
        readme_file.write(f"| [CSV文件](./{csv_path}) |\n\n")