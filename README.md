# Xiaomi PC Manager smart charge fix
## Description
The powershell script to fix Xiaomi PC Manager smart charge issue described
[here](https://github.com/Data-Name-ID/RedmiBook-Pro-14-2024?tab=readme-ov-file#%D0%BE%D0%BF%D1%82%D0%B8%D0%BC%D0%B8%D0%B7%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%BD%D0%B0%D1%8F-%D0%B7%D0%B0%D1%80%D1%8F%D0%B4%D0%BA%D0%B0-%D0%B4%D0%BE-80)
## Installation
- Download `smartCharge.ps1` and `smartCharge.vbs` files to you local directory, for example `D:\smart-charge\`
- In the `smartCharge.ps1` replace `<script_path>` to your local directory and `<user_folder>` to the current user folder like `S-1-5-21-1391325868-3501182029-1818516844-1002`
- In the `smartCharge.vbs` replace `<script_path>` to your local directory
- Under `HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run` create a new string value name `SmartCharge` with value data `"<script_path>\smartCharge.vbs"` where `<script_path>` is your local directory
## Testing
- Plug the power cable into your laptop
- Restart the laptop
- Check whether file `.plugged` is created under your `<script_path>` 
