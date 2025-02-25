@echo off & python -x "%~f0" %* & goto :eof
import sys
import os
import time
import shutil 
import glob

dll_name_modded = "dwmapi.dll"
dll_name_unmodded = "dwmapi.unmodded.dll"

pal_exe = "Palworld.exe"
pal_pak = "Pal-Windows.pak"

palworld_path = "C:/Program Files (x86)/Steam/steamapps/common/Palworld"
paks_path = "C:/Program Files (x86)/Steam/steamapps/common/Palworld/Pal/Content/Paks/"
dwmapi_path = "C:/Program Files (x86)/Steam/steamapps/common/Palworld/Pal/Binaries/Win64/"

unmodded_path = "C:/Program Files (x86)/Steam/steamapps/common/Palworld/Pal/Content/mods/"


def main():
    
    
    choice = input("Enter 1 for modded, 2 for unmodded, or 3 to quit: ").strip()
    while True:
        if choice == "1":
            start_modeded()
        elif choice == "2":
            start_unmodeded()
        elif choice == "3":
            print("Quitting")
            
            quit()
        else:
            print("Invalid choice. Please enter '1' for modded, '2' for unmodded, or '3' to quit.")
        choice = input("Enter 1 for modded, 2 for unmodded, or 3 to quit Palworld: ").strip()

def start_modeded():
    if os.path.exists(dwmapi_path+dll_name_unmodded):
        print("Renaming "+dwmapi_path+dll_name_unmodded+" to "+dwmapi_path+dll_name_modded)
        os.rename(dwmapi_path+dll_name_unmodded, dwmapi_path+dll_name_modded)

    src_dir = unmodded_path
    dst_dir = paks_path
    for p in glob.glob('**/*.pak', recursive=True, root_dir=src_dir):
        print("moving "+ p + " to " + dst_dir)
        if (p != pal_pak):
            os.makedirs(os.path.join(dst_dir, os.path.dirname(p)), exist_ok=True)
            shutil.move(os.path.join(src_dir, p), os.path.join(dst_dir, p))
    print("Starting Palworld")
    os.chdir(palworld_path)
    os.system(pal_exe)
    time.sleep(3) # Sleep for 3 seconds
    pause = input("Press any key to continue...")
    quit()

def start_unmodeded():
    if os.path.exists(dwmapi_path+dll_name_modded):
        print("Renaming "+dwmapi_path+dll_name_modded+" to "+dwmapi_path+dll_name_unmodded)
        os.rename(dwmapi_path+dll_name_modded, dwmapi_path+dll_name_unmodded)

    src_dir = paks_path
    dst_dir = unmodded_path
    for p in glob.glob('**/*.pak', recursive=True, root_dir=src_dir):        
        if (p != pal_pak):
            print("moving "+ p + " to " + dst_dir)
            os.makedirs(os.path.join(dst_dir, os.path.dirname(p)), exist_ok=True)
            shutil.move(os.path.join(src_dir, p), os.path.join(dst_dir, p))
    print("Starting Palworld")
    os.chdir(palworld_path)
    os.system(pal_exe)
    time.sleep(3) # Sleep for 3 seconds
    pause = input("Press any key to continue...")
    quit()

if __name__ == "__main__":
    main()