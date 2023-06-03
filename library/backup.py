import os
import platform
# Create DATABASE BACKUP
print(platform.system())
if platform.system() == 'Linux':
        # Linux command
    os.system('/opt/lampp/bin/mysqldumb -u root library > database_backup.sql')
elif platform.system() == 'Windows':
    # Windows command
    os.system('C:\xampp\mysql\bin\mysqldump -u root library > database_backup.sql')
else:
    print("Unsupported operating system.")