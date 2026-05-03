P_Research = PATH_OF_CURRENT_FOLDER

from pathlib import Path
P_Research = Path(P_Research)
P_Raw_Data = P_Research / 'raw_app_data'
P_Monthly_Data = P_Research / 'monthly_app_data_csv'
P_Weekly_Data_Games = P_Research / 'weekly_app_data_games'
P_Weekly_Data_Nongames = P_Research / 'weekly_app_data_nongames' 
 
import platform
import socket

exec(Path("python_1_download.py").read_text())

exec(Path("python_2_monthly_data_creation.py").read_text())

exec(Path("python_3_weekly_data_creation.py").read_text())

exec(Path("python_4a_file_size.py").read_text())

exec(Path("python_4b_screenshot.py").read_text())

exec(Path("python_4c_app_ratings.py").read_text())

exec(Path("python_4d_related.py").read_text())

exec(Path("python_5_reclassification.py").read_text())

