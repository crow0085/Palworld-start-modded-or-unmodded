@echo off & python -x "%~f0" %* & goto :eof
import sys
import os
import time

dll_name_modded = "dwmapi.dll"
dll_name_unmodded = "dwmapi.unmodded.dll"
pal_exe = "Palworld.exe"


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

    if os.path.exists(dll_name_unmodded):
        os.rename(dll_name_unmodded, dll_name_modded)
    
    if os.path.exists(dll_name_modded):
        print("starting palworld")
        os.chdir("../../../")
        os.system(pal_exe)
        time.sleep(3) # Sleep for 3 seconds
        quit()
    else:
        print("dwmapi.dll not found.")

def start_unmodeded():

    if os.path.exists(dll_name_modded):
        os.rename(dll_name_modded, dll_name_unmodded)
	
    print("starting palworld")
    os.chdir("../../../")
    os.system(pal_exe)
    time.sleep(3) # Sleep for 3 seconds
    quit()

if __name__ == "__main__":
    main()