numbers_file = open("numbers.txt", 'r')
numbers_str = numbers_file.read()
numbers = list(map(int, numbers_str.split()))
print(numbers)
numbers_file.close()

def swap(s1, s2):
    return s2, s1

def quick_sort(A, p, r):
    x = A[r]
    i = p-1
    for j in range(p, r):
        if A[j]<x:
            i=i+1
            A[i], A[j] = swap(A[i], A[j])