#include <iostream>
#include <vector>
#include <fstream>
using namespace std;
#define maxsize 2000

void merge(vector<int>& arr, int left, int middle, int right) {
    vector<int> leftArr(middle - left + 1);
    vector<int> rightArr(right - middle);

    for (int i = 0; i < leftArr.size(); i++)
        leftArr[i] = arr[left + i];
    for (int i = 0; i < rightArr.size(); i++)
        rightArr[i] = arr[middle + i + 1];

    int i = 0, j = 0, k = left;
    while (i < leftArr.size() && j < rightArr.size()) {
        if (leftArr[i] <= rightArr[j])
            arr[k++] = leftArr[i++];
        else
            arr[k++] = rightArr[j++];
    }

    while (i < leftArr.size())
        arr[k++] = leftArr[i++];
    while (j < rightArr.size())
        arr[k++] = rightArr[j++];
}

void mergeSort(vector<int>& arr, int left, int right) {
    if (left >= right)
        return;

    int middle = left + (right - left) / 2;
    mergeSort(arr, left, middle);
    mergeSort(arr, middle + 1, right);
    merge(arr, left, middle, right);
}

int main() {
	ifstream numbers_file("D:/andy/DELHI_UNIVERSITY/Hans_Raj_College/sem4/DAA/cpp/numbers.txt");
    
	vector<int> arr;
	int n = 0;
	int number;
	while(numbers_file >> number && n < maxsize){
		arr.push_back(number);
		n++;
	}
    mergeSort(arr, 0, arr.size() - 1);

    for (int i = 0; i < arr.size(); i++)
        cout << arr[i] << " ";

    return 0;
}
