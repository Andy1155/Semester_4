#include <iostream>
#include<fstream>
using namespace std;
#define maxsize 2000

void heapify(int arr[], int N, int i)
{
	int largest = i;

	// left = 2*i + 1
	int l = 2 * i + 1;

	// right = 2*i + 2
	int r = 2 * i + 2;

	// If left child is larger than root
	if (l < N && arr[l] > arr[largest])
		largest = l;

	// If right child is larger than largest
	// so far
	if (r < N && arr[r] > arr[largest])
		largest = r;

	// If largest is not root
	if (largest != i) {
		swap(arr[i], arr[largest]);

		// Recursively heapify the affected
		// sub-tree
		heapify(arr, N, largest);
	}
}

// Main function to do heap sort
void heapSort(int arr[], int N)
{
	for (int i = N / 2 - 1; i >= 0; i--)
		heapify(arr, N, i);

	for (int i = N - 1; i > 0; i--) {
		swap(arr[0], arr[i]);
		heapify(arr, i, 0);
	}
}

void print_arr(int* A, int n){
	for(int i = 0; i < n; i++){
		cout << A[i] << " ";
	}
	cout << endl;
} 

int main()
{
	ifstream numbers_file("numbers.txt");

	int A[maxsize] = {0};
	int n = 0;
	int number;
	while(numbers_file >> number && n < maxsize){
		A[n] = number;
		n++;
	}
	
	cout << "before sorting :: " << endl;
	print_arr(A, n);
	
	cout << "\nsize is " << n << endl;
	cout << "after sorting :: " << endl;
	heapSort(A, n);
	print_arr(A, n);
}
