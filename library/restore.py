#restore.py>
import os
import platform

# Create DATABASE BACKUP
#print(platform.system())
def restore_database():
    if platform.system() == 'Linux':
        # Linux command
        current_directory = os.getcwd()
        temp_path = current_directory+'/library/sql/'
        print(current_directory)
        print(temp_path)
        DB_USER = 'root'
        DB_PASS = ''
        DB_NAME = 'library'
        backup_file = 'database_backup.sql'
        backup_file_path = os.path.join(temp_path,backup_file)
        print(backup_file_path)
        os.chdir('/opt/lampp/bin/')
        #os.system('mysqldumb -u root library > database_backup.sql')
        mysql_cmd = f'./mysql  -u {DB_USER} {DB_NAME} < {backup_file_path};'
        os.system(mysql_cmd)
        os.chdir(current_directory)

    elif platform.system() == 'Windows':
        # Windows command
        current_directory = os.getcwd()
        DB_USER = 'root'
        DB_PASS = ''
        DB_NAME = 'library'
        sql_path = current_directory+ '\\sql'
        backup_file = 'database_backup.sql'
        backup_file_path = os.path.join(sql_path,backup_file)

        # Change directory to the appropriate location of mysqldump executable on Windows
        os.chdir('C:\\xampp\\mysql\\bin')

        # Run mysqldump command to export the database
        mysqldump_cmd = f'mysql -u {DB_USER} -p{DB_PASS} {DB_NAME} < "{backup_file_path}"'
        os.system(mysqldump_cmd)
        os.chdir(current_directory)
    else:
        print("Unsupported operating system.")
