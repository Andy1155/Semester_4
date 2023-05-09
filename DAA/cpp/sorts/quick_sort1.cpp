#include<iostream>
#include<fstream>
#include<algorithm>
#include <time.h>

using namespace std;

#define maxsize 2000
int numswaps = 0;
int numcomparison = 0;

int partition(int *A, int p, int r){
	int x = A[r];
	int i = p-1;
	for(int j = p; j <= r-1; j++){
		numcomparison++;
		if(A[j] < x){
			i++;
			numswaps++;
			swap(A[i], A[j]);
		}
	}
	numswaps++;
	swap(A[i+1], A[r]);
	return i+1;
}

void quick_sort(int *A, int p, int r){
	numcomparison++;
	if(p < r){
		int q = partition(A, p, r);
		quick_sort(A, p, q-1);
		quick_sort(A, q+1, r);
	}
}
void print_arr(int* A, int n){
	for(int i = 0; i < n; i++){
		cout << A[i] << " ";
	}
	
	cout << endl;
}
int main(){
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
	
	clock_t tStart = clock();
	quick_sort(A, 0, n-1);
    double duration =  (double)(clock() - tStart)/CLOCKS_PER_SEC;

	print_arr(A, n);
	cout << "number of swaps : " << numswaps << endl;
	cout << "number of comparison : " << numcomparison << endl;
	cout << "Time taken by function: "
         << duration << endl;
	return 0;
}