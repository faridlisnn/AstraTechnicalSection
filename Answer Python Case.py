# -*- coding: utf-8 -*-
"""
Created on Sun Feb 28 15:23:49 2021

@author: Farid
"""

import pandas as pd
from random import randint

# Make a Time Series Dataset
data_waktu = pd.DataFrame({})

waktu = pd.date_range('2020-01-01', periods=365, freq='1440min')
data_waktu["waktu"] = waktu.strftime('%m-%d-%Y %H:%M:%S')

# Add Random Values
data_waktu["random_int"] = [randint(0,5) for i in range(len(data_waktu))]

# Add Day Names
data_waktu["nama_hari"] = waktu.day_name()

# Group By Day Names
new_table = data_waktu.groupby(by=['nama_hari']).sum()