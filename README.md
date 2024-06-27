# Xiaomi PC Manager smart charge fix
## Description
The powershell script to fix Xiaomi PC Manager smart charge issue described
[here](https://github.com/Data-Name-ID/RedmiBook-Pro-14-2024?tab=readme-ov-file#%D0%BE%D0%BF%D1%82%D0%B8%D0%BC%D0%B8%D0%B7%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%BD%D0%B0%D1%8F-%D0%B7%D0%B0%D1%80%D1%8F%D0%B4%D0%BA%D0%B0-%D0%B4%D0%BE-80)
## Installation
- Download `smartCharge.ps1` and `smartCharge.vbs` files to you local directory, for example `D:\smart-charge`
- In the files `smartCharge.ps1` and `smartCharge.vbs` replace variable `scriptPath` with your local directory
- Run `regedit.exe`. Under `HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run` create a new string value `SmartCharge` and value data `"<script_path>\smartCharge.vbs"` where `<script_path>` is your local directory
## Testing
- Plug the power adapter
- Restart the laptop
- Check whether script directory contains a file `.plugged`
