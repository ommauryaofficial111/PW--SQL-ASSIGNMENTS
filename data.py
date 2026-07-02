import pandas as pd
import numpy as np

# Load the dataset
df= pd.read_csv(r'C:\Users\hp\OneDrive\Desktop\New folder (2)\retail_dataset.csv')

# Display the first 5 rows
print(df.head())

# Display dataset information (structure, data types, non-null counts)
print(df.info())

# Missing values per column
print(df.isnull().sum())

# Total number of missing values in the entire dataset
print("Total missing values:", df.isnull().sum().sum())

# Replace missing values with mean
df['Quantity'] = df['Quantity'].fillna(df['Quantity'].mean())
df['Price'] = df['Price'].fillna(df['Price'].mean())

# Remove rows with missing Product Category or Region
df.dropna(subset=['Product Category', 'Region'], inplace=True)

# Create new column using NumPy for vectorization
df['Revenue'] = np.multiply(df['Quantity'], df['Price'])

# Display updated dataset
print(df.head())

# Calculate sum using NumPy
total_revenue = np.sum(df['Revenue'])
print(f"Total Revenue: {total_revenue}")

# Group by category and sum revenue
category_revenue = df.groupby('Product Category')['Revenue'].sum()
print(category_revenue)

# Identify Top 3 and Bottom 3 categories
top_3 = category_revenue.nlargest(3)
bottom_3 = category_revenue.nsmallest(3)

print("Top 3 Categories:\n", top_3)
print("Bottom 3 Categories:\n", bottom_3)

# Group by Region
region_revenue = df.groupby('Region')['Revenue'].sum()

# Identify highest and lowest revenue regions
highest_region = region_revenue.idxmax()
lowest_region = region_revenue.idxmin()

print(f"Highest Revenue Region: {highest_region}")
print(f"Lowest Revenue Region: {lowest_region}")

# Ensure Date column is in datetime format
df['Date'] = pd.to_datetime(df['Date'])

# Extract month and calculate monthly revenue
df['Month'] = df['Date'].dt.month [cite: 20]
monthly_revenue = df.groupby('Month')['Revenue'].sum() [cite: 20]
print(monthly_revenue)

# Statistical calculations using NumPy
rev_mean = np.mean(df['Revenue']) [cite: 21]
rev_median = np.median(df['Revenue']) [cite: 21]
rev_std = np.std(df['Revenue']) [cite: 21]

print(f"Mean: {rev_mean}, Median: {rev_median}, Std Dev: {rev_std}")