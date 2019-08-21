import numpy as np

arr = np.arange(6).reshape([2,3])
print("before transpose")
print(arr)
print("after transpose\n")
print(np.transpose(arr))

print("after rotation")
print(np.rot90(arr,1))
