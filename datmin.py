import seaborn as sns
import matplotlib.pyplot as plt
import pandas as pd
import numpy as np

df_seaborn = sns.load_dataset('penguins')

print("-" * 40)
print("Eksplorasi Dataset 'Penguins'")
print("-" * 40)

print("\n--- 5 Baris pertama ---")
print(df_seaborn.head())

print("\n--- Info dataset ---")
df_seaborn.info()

print("\n--- Statistik ---")
print(df_seaborn.describe())

print("\n--- Data kosong ---")
print(df_seaborn.isnull().sum())

df_seaborn['bill_length_mm'] = df_seaborn['bill_length_mm'].fillna(df_seaborn['bill_length_mm'].mean())
df_seaborn['bill_depth_mm'] = df_seaborn['bill_depth_mm'].fillna(df_seaborn['bill_depth_mm'].mean())
df_seaborn['flipper_length_mm'] = df_seaborn['flipper_length_mm'].fillna(df_seaborn['flipper_length_mm'].mean())
df_seaborn['body_mass_g'] = df_seaborn['body_mass_g'].fillna(df_seaborn['body_mass_g'].mean())

df_seaborn['sex'] = df_seaborn['sex'].fillna(df_seaborn['sex'].mode()[0])

print("\n--- Data kosong setelah dibersihkan ---")
print(df_seaborn.isnull().sum())

plt.figure(figsize=(8,5))
sns.histplot(df_seaborn['body_mass_g'], bins=30, kde=True, color='green')
plt.title('Distribusi Berat Badan Penguin')
plt.xlabel('Berat Badan (gram)')
plt.ylabel('Frekuensi')
plt.show()

plt.figure(figsize=(8,5))
sns.scatterplot(x='bill_length_mm', y='bill_depth_mm', hue='species', data=df_seaborn)
plt.title('Hubungan Panjang vs Lebar Paruh')
plt.xlabel('Panjang Paruh (mm)')
plt.ylabel('Lebar Paruh (mm)')
plt.show()

plt.figure(figsize=(10,5))
sns.countplot(x='island', data=df_seaborn, palette='magma')
plt.title('Jumlah Penguin Berdasarkan Pulau')
plt.xlabel('Nama Pulau')
plt.ylabel('Jumlah')
plt.show()

plt.figure(figsize=(8,5))
sns.boxplot(x='species', y='body_mass_g', data=df_seaborn)
plt.title('Boxplot Berat Badan Per Spesies')
plt.xlabel('Spesies')
plt.ylabel('Berat Badan (gram)')
plt.show()