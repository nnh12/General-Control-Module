import numpy as np

# Using sorted function (returns a new sorted list)
intervals = sorted(intervals, key=lambda x : x[0])

array = np.array([1, 2, 3, 4, 5])
# Iterate from high to low
for i in range(len(array) - 1, -1 , -1):
    print(array[i])
