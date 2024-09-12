# Batch Zip Script

This repository contains a batch script for zipping folders and adding chapter info files for webtoon uploads.

## Script Description

The script performs the following tasks:
1. Reads a list of folders from `lista_para_zip.txt`.
2. Zips each folder while excluding certain files (e.g., preview images, `desktop.ini`).
3. Creates a `bato-chapter-info.txt` file inside each ZIP archive with chapter information.
4. Removes the `bato-chapter-info.txt` file from the folder after zipping.

## How to Use

1. **Prepare Your Environment**:
   - Make sure you have `WinRAR` installed and placed in the same directory as the script.
   - Create a `lista_para_zip.txt` file in the same directory as the script. This file should contain the names of the folders to be zipped, each on a new line.

2. **Run the Script**:
   - Open a command prompt or terminal window.
   - Navigate to the directory where the script and `WinRAR` are located.
   - Run the script by typing:
     ```batch
     Batch-Zip-Script.bat
     ```
   - You will be prompted to enter the comic ID for the chapter info file.

3. **Check the Output**:
   - The script will create ZIP files for each folder listed in `lista_para_zip.txt` and place them in the same directory.

## Notes

- Make sure all the folders listed in `lista_para_zip.txt` are in the same directory as the script.
- The script will exclude preview images and `desktop.ini` files from the ZIP archives.
