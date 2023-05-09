#include <iostream>
#include <vector>
#include <queue>
using namespace std;

void bfs(int node, vector<int> adj[], vector<bool>& visited) {
    queue<int> q;
    q.push(node);
    visited[node] = true;
    while(!q.empty()) {
        int curr = q.front();
        q.pop();
        for(int i = 0; i < adj[curr].size(); i++) {
            int next = adj[curr][i];
            if(!visited[next]) {
                visited[next] = true;
                q.push(next);
            }
        }
    }
}

int countComponents(int n, vector<int> adj[]) {
    int components = 0;
    vector<bool> visited(n, false);
    for(int i = 0; i < n; i++) {
        if(!visited[i]) {
            bfs(i, adj, visited);
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
