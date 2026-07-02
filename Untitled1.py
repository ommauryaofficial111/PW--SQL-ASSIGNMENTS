#!/usr/bin/env python
# coding: utf-8

# In[2]:


#Question 4 :- Write a Python program to take a user's name as input and print a greeting message.

# Taking user input
name = input("Enter your name: ")

# Printing greeting message
print(f"Hello, {name}! Welcome to the Python Basics assignment.")


# In[4]:


#Question 5: Even or Odd Checker

number = int(input("Enter a number: "))

if number % 2 == 0:
    print("The number is Even.")
else:
    print("The number is Odd.")


# In[5]:


#Question 6: Loop Numbers 1 to 10

for i in range(1, 11):
    print(i)


# In[6]:


#Question 7: Find Maximum in a List

numbers = [12, 45, 2, 89, 33]
max_val = max(numbers)

print(f"The maximum number in the list is: {max_val}")


# In[7]:


#Question 8: Remove Duplicates using a Set

original_list = [1, 2, 2, 3, 4, 4, 5]
# Converting to a set automatically removes duplicates
unique_list = list(set(original_list))

print(f"List after removing duplicates: {unique_list}")


# In[8]:


#Question 9: Square Function

def get_square(num):
    return num * num

# Example usage:
result = get_square(5)
print(f"The square of 5 is: {result}")


# In[9]:


#Question 10: Count Occurrences in a List

example_list = [2, 3, 4, 2, 5, 2]
target_number = 2

count = example_list.count(target_number)

print(f"The number {target_number} appears {count} times in the list.")


# In[ ]:




