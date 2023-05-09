#include <iostream>
#include <vector>
using namespace std;

void dfs(int node, vector<int> adj[], vector<bool>& visited) {
    visited[node] = true;
    for(int i = 0; i < adj[node].size(); i++) {
        int next = adj[node][i];
        if(!visited[next]) {
            dfs(next, adj, visited);
        }
    }
}

int countComponents(int n, vector<int> adj[]) {
    int components = 0;
    vector<bool> visited(n, false);
    for(int i = 0; i < n; i++) {
        if(!visited[i]) {
            dfs(i, adj, visited);
            components++;
        }
    }
    return components;
}

int main() {
    // Example usage
    int n = 6;
    vector<int> adj[n];
    adj[0].push_back(1);
    adj[1].push_back(0);
    adj[1].push_back(2);
    adj[2].push_back(1);
    adj[3].push_back(4);
    adj[4].push_back(3);
    adj[4].push_back(5);
    adj[5].push_back(4);

    int components = countComponents(n, adj);
    cout << "Number of connected components: " << components << endl;

    return 0;
}
