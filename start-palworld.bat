@echo off & python -x "%~f0" %* & goto :eof
import sys
import os
import time
import shutil 

dll_name_modded = "dwmapi.dll"
dll_name_unmodded = "dwmapi.unmodded.dll"

ue4ss_name_modded = "UE4SS.dll"
ue4ss_name_unmodded = "UE4SS.unmodded.dll"

pal_exe = "Palworld.exe"

palworld_path = "C:/Program Files (x86)/Steam/steamapps/common/Palworld"
paks_path = "C:/Program Files (x86)/Steam/steamapps/common/Palworld/Pal/Content/Paks/"
ue4ss_path = 'C:/Program Files (x86)/Steam/steamapps/common/Palworld/Pal/Binaries/Win64/'

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

    if os.path.exists(ue4ss_path+dll_name_unmodded):
        os.rename(ue4ss_path+dll_name_unmodded, ue4ss_path+dll_name_modded)
    
    if os.path.exists(ue4ss_path+ue4ss_name_unmodded):
        os.rename(ue4ss_path+ue4ss_name_unmodded, ue4ss_path+ue4ss_name_modded)
    
    if os.path.exists(ue4ss_path+dll_name_modded) and os.path.exists(ue4ss_path+ue4ss_name_modded):
        print("moving mods to: " + paks_path)

        try:
            new_path = shutil.move(unmodded_path + '~mods/', paks_path) 
            new_path = shutil.move(unmodded_path + 'LogicMods/', paks_path) 
            time.sleep(3) # Sleep for 3 seconds
        except:
            print("Error moving files, either they already have been moved, or dont exist")
        print("starting palworld")
        
        os.chdir(palworld_path)
        os.system(pal_exe)
        time.sleep(3) # Sleep for 3 seconds
        quit()
    else:
        print("dwmapi.dll not found.")

def start_unmodeded():

    if os.path.exists(ue4ss_path+dll_name_modded):
        os.rename(ue4ss_path+dll_name_modded, ue4ss_path+dll_name_unmodded)
	
    if os.path.exists(ue4ss_path+ue4ss_name_modded):
        os.rename(ue4ss_path+ue4ss_name_modded, ue4ss_path+ue4ss_name_unmodded)

    print("moving mods to: " + unmodded_path)    

    try:
        new_path = shutil.move(paks_path + '~mods/', unmodded_path) 
        new_path = shutil.move(paks_path + 'LogicMods/', unmodded_path) 
        time.sleep(3) # Sleep for 3 seconds
    except:
        print("Error moving files, either they already have been moved, or dont exist")    
	
    print("starting palworld")
    os.chdir(palworld_path)
    os.system(pal_exe)
    time.sleep(2) # Sleep for 3 seconds
    quit()

if __name__ == "__main__":
    main()