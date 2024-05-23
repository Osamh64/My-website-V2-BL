import os

def convert_php_to_html(directory):
    # قائمة بجميع الملفات في الدليل
    files = os.listdir(directory)
    
    for file in files:
        if file.endswith(".php"):
            # تغيير امتداد الملف
            new_name = file.replace(".php", ".html")
            os.rename(os.path.join(directory, file), os.path.join(directory, new_name))
            print(f"تم تحويل {file} إلى {new_name}")

# استخدم الدليل الذي تريده هنا
directory = r"C:\Users\ABC\Desktop\My location\code My location"
convert_php_to_html(directory)
