@echo off

set "output_csv=log.csv"

rem 清空输出的 CSV 文件
echo "语言","产品分类","产品名称","文档名称","更新状态" > "%output_csv%"

rem 遍历每个语言分类子文件夹
for /D %%L in (*) do (
    set "language=%%L"
    
    rem 遍历每个子文件夹中的文件夹
    for /D %%F in ("%%L\*") do (
        set "product_category=%%~nxF"
        set "product_name=%%~nxF"
        
        rem 提取文档名称
        for /D %%D in ("%%F\*") do (
            set "document_name=%%~nxD"
            
            rem 检查是否存在符合格式的 PDF 文件
            set "file_found=false"
            for %%P in ("%%F\%%D\MaxiCharger %product_name% - %document_name%_*_%language%.pdf") do (
                set "file_found=true"
                set "filename=%%~nP"
                set "release_date=!filename:~-8!"
                set "formatted_date=!release_date:~0,4!-!release_date:~4,2!-!release_date:~6,2!"
                echo "%language%", "%product_category%", "%product_name%", "%document_name%", "!formatted_date!" >> "%output_csv%"
            )
            
            rem 如果没有找到 PDF 文件，记录为 null
            if not "!file_found!"=="true" (
                echo "%language%", "%product_category%", "%product_name%", "%document_name%", null >> "%output_csv%"
            )
            
            rem 检查是否存在不符合格式的 PDF 文件
            for %%P in ("%%F\%%D\*.pdf") do (
                if not "%%~nP"=="MaxiCharger %product_name% - %document_name%_*_%language%" (
                    echo "%language%", "%product_category%", "%product_name%", "%document_name%", abnormal >> "%output_csv%"
                )
            )
        )
    )
)

echo "验证完成。结果已保存到 %output_csv% 文件。"