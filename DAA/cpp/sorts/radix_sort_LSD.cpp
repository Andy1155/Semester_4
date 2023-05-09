#include <iostream>
#include<fstream>

using namespace std;

#define maxsize 2000

void countSort(int arr[], int n, int exp) {
    int output[n], count[10] = {0};

    for (int i = 0; i < n; i++)
        count[(arr[i]/exp)%10]++;

    for (int i = 1; i < 10; i++)
        count[i] += count[i-1];

    for (int i = n-1; i >= 0; i--) {
        output[count[(arr[i]/exp)%10] - 1] = arr[i];
        count[(arr[i]/exp)%10]--;
    }

    for (int i = 0; i < n; i++)
        arr[i] = output[i];
}

void radixSort(int arr[], int n) {
    int maxVal = arr[0];

    for (int i = 1; i < n; i++)
        if (arr[i] > maxVal)
            maxVal = arr[i];

    for (int exp = 1; maxVal/exp > 0; exp *= 10)
        countSort(arr, n, exp);
}

int main() {
	ifstream numbers_file("D:/andy/DELHI_UNIVERSITY/Hans_Raj_College/sem4/DAA/cpp/numbers.txt");


    int arr[maxsize] = {0};
    int n = 0;
	int number;
	while(numbers_file >> number && n < maxsize){
		arr[n] = number;
		n++;
	}
    radixSort(arr, n);

    cout << "Sorted array: ";
    for (int i = 0; i < n; i++)
        cout << arr[i] << " ";

    return 0;
}
