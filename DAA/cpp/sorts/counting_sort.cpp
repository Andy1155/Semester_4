#include<iostream>
#include<fstream>
using namespace std;

#define maxsize 2000
void print_arr(int* A, int n){
	for(int i = 0; i < n; i++){
		cout << A[i] << " ";
	}
	cout << endl;
} 

void counting_sort(int A[],int B[], int n, int k){
	int C[k+1];
	for(int i = 0; i <= k; i++){
		C[i] = 0;
	}
	for(int i = 0; i <= n-1; i++){
		C[A[i]]++;
	}
	for(int i = 1; i <= k; i++){
		C[i] += C[i-1];
	}
	
	for(int i = n-1; i >= 0; i--){
		B[C[A[i]]-1] = A[i];
		C[A[i]]--;
	}
	// for(int i = 0; i <= n-1; i++){
	// 	cout << B[i] << " ";
	// }
	// cout << endl;
	
	return;
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
	int maxi = 1100;
	print_arr(A, n);
	int b[n];
	counting_sort(A, b, n, maxi);
	cout << "\nsorted array is :: \n";
	print_arr(b, n);
}