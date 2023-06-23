import os
import csv

root_directory = os.path.dirname(os.path.abspath(__file__))  # 使用当前脚本所在的目录作为根目录
output_csv = "verification_log.csv"  # 输出的 CSV 文件路径

# 清空输出的 CSV 文件
with open(output_csv, "w", newline="") as csvfile:
    writer = csv.writer(csvfile)
    writer.writerow(["语言", "产品分类", "产品名称", "文档名称", "更新状态"])

# 遍历每个语言分类子文件夹
for language_folder in os.listdir(root_directory):
    language_path = os.path.join(root_directory, language_folder)

    if not os.path.isdir(language_path):
        continue

    # 遍历每个子文件夹中的文件夹
    for product_folder in os.listdir(language_path):
        product_path = os.path.join(language_path, product_folder)

        if not os.path.isdir(product_path):
            continue

        product_category = product_folder
        product_name = product_folder

        # 提取文档名称
        for document_folder in os.listdir(product_path):
            document_path = os.path.join(product_path, document_folder)

            if not os.path.isdir(document_path):
                continue

            document_name = document_folder
            pdf_found = False
            release_date = None

            # 检查是否存在符合格式的 PDF 文件
            for file_name in os.listdir(document_path):
                if file_name.endswith(".pdf") and file_name.startswith(
                    f"MaxiCharger {product_name} - {document_name}_"
                ):
                    pdf_found = True
                    file_parts = file_name.split("_")
                    release_date = file_parts[-2]
                    break

            # 将信息写入 CSV 文件
            with open(output_csv, "a", newline="") as csvfile:
                writer = csv.writer(csvfile)
                if pdf_found:
                    formatted_date = f"{release_date[:4]}-{release_date[4:6]}-{release_date[6:8]}"
                    writer.writerow([language_folder, product_category, product_name, document_name, formatted_date])
                else:
                    writer.writerow([language_folder, product_category, product_name, document_name, "null"])

            # 检查是否存在不符合格式的 PDF 文件
            for file_name in os.listdir(document_path):
                if file_name.endswith(".pdf") and not file_name.startswith(
                    f"MaxiCharger {product_name} - {document_name}_"
                ):
                    with open(output_csv, "a", newline="") as csvfile:
                        writer = csv.writer(csvfile)
                        writer.writerow([language_folder, product_category, product_name, document_name, "abnormal"])

print("验证完成。结果已保存到", output_csv, "文件。")