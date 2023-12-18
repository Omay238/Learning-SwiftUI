#!/usr/bin/env python

import subprocess
import os

directory = "./NASA ADC/Data"

files = [file for file in os.listdir(directory) if file.endswith('.csv')]

for i in files:
    part = i.split("_")[2]
    name = i.split("_")[3][0:-4]
    print(name)
    subprocess.run(['python', 'process.py', part, name])
