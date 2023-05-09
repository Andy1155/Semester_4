def swap(a, b):
    temp = a
    a = b
    b = temp
    return a, b

a, b = 1,2

swap(a,b)
print(swap(a,b))