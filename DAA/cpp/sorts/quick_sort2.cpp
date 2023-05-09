#include<iostream>
#include<fstream>
#include<algorithm>
#include<utility>
#include <chrono>

using namespace std;
using namespace std::chrono;

#define maxsize 2000
int numswaps = 0;
int numcomparison = 0;
void print_arr(int* A, int n){
	for(int i = 0; i < n; i++){
		cout << A[i] << " ";
	}
	
	cout << endl;
} 

int partition(int *E, int pivot, int first, int last){
	bool low = true, high = false;
	pair<int, bool> lh(pivot, low);
	pair<int, int> sb(pivot-1, last+1);

	int n = last - first;
	while(n--){
		if(lh.second == low){
			numcomparison++;
			if(E[lh.first] > E[sb.second-1]){
				swap(E[lh.first], E[sb.second-1]);
				numswaps++;
				lh.first = sb.second-1;
				lh.second = high;
				sb.first++;
			}
			else{
				sb.second--;
			}
		}
		else{
			numcomparison++;
			if(E[lh.first] < E[sb.first+1]){
				swap(E[lh.first], E[sb.first+1]);
				numswaps++;
				lh.first = sb.first+1;
				sb.second--;
				lh.second = low;
			}
			else{
				sb.first++;
			}
		}
	}
	return lh.first;
}

void quick_sort2(int *E, int first, int last){
	numcomparison++;
	if(first < last){
		int pivotElement = E[first];
		int pivot = first;
		int splitpoint = partition(E, pivot, first, last);

		quick_sort2(E, first, splitpoint-1);
		quick_sort2(E, splitpoint+1, last);
	}
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
	
	cout << "before sorting :: " << endl;
	print_arr(A, n);
	
	cout << "\nsize is " << n << endl;
	cout << "after sorting :: " << endl;
	
	auto start = high_resolution_clock::now();
	quick_sort2(A, 0, n-1);
	auto stop = high_resolution_clock::now();
    auto duration = duration_cast<microseconds>(stop - start);

	print_arr(A, n);
	cout << "number of swaps : " << numswaps << endl;
	cout << "number of comparison : " << numcomparison << endl;
	cout << "Time taken by function: "
         << duration.count() << " microseconds" << endl;
	// int A[]={3,2,1};
	// partition(A, 0, 0, 2);

	// cout << "end result :: " << endl;
	// print_arr(A, 3);
	// return 0;
}