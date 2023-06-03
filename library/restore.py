import os
import platform
# Create DATABASE BACKUP
if platform.system() == 'Linux':
        # Linux command
    os.system('/opt/lampp/bin/./mysql -u root library << database_backup.sql')
elif platform.system() == 'Windows':
    # Windows command
    os.system('mysqldump -u root -p password library > database_backup.sql')
else:
    print("Unsupported operating system.")
os.system(' /opt/lampp/bin u root library > database_backup.sql')