#include <iostream>
#include <vector>
#include <algorithm>
using namespace std;

int knapsack(vector<int>& values, vector<int>& weights, int capacity) {
    int n = values.size();
    vector<vector<int>> dp(n+1, vector<int>(capacity+1, 0));

    for (int i = 1; i <= n; i++) {
        for (int w = 1; w <= capacity; w++) {
            // If the current item fits in the knapsack, we have a choice
            if (weights[i-1] <= w) {
                // Take the maximum value between including the item or not
                dp[i][w] = max(dp[i-1][w-weights[i-1]] + values[i-1], dp[i-1][w]);
            }
            // Otherwise, we cannot include the current item
            else {
                dp[i][w] = dp[i-1][w];
            }
        }
    }
    return dp[n][capacity];
}

int main() {
    int n, capacity;
    cin >> n >> capacity;
    vector<int> values(n);
    vector<int> weights(n);

    // Read in the item weights and values
    for (int i = 0; i < n; i++) {
        cin >> values[i] >> weights[i];
    }

    int max_value = knapsack(values, weights, capacity);
    cout << "Maximum value: " << max_value << endl;

    return 0;
}
