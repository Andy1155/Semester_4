#ifndef GRAPH_ALGORITHMS_H
#define GRAPH_ALGORITHMS_H

#include <iostream>
#include <vector>
#include <queue>
#include <stack>

using namespace std;

// BFS implementation
void bfs(vector<int> adjList[], vector<bool>& visited, int start) {
    queue<int> q;
    q.push(start);
    visited[start] = true;

    while (!q.empty()) {
        int curr = q.front();
        q.pop();
        cout << curr << " ";

        for (int i = 0; i < adjList[curr].size(); i++) {
            int neighbor = adjList[curr][i];
            if (!visited[neighbor]) {
                visited[neighbor] = true;
                q.push(neighbor);
            }
        }
    }
}

// DFS implementation
void dfs(vector<int> adjList[], vector<bool>& visited, int start) {
    stack<int> s;
    s.push(start);
    visited[start] = true;

    while (!s.empty()) {
        int curr = s.top();
        s.pop();
        cout << curr << " ";

        for (int i = 0; i < adjList[curr].size(); i++) {
            int neighbor = adjList[curr][i];
            if (!visited[neighbor]) {
                visited[neighbor] = true;
                s.push(neighbor);
            }
        }
    }
}

#endif // GRAPH_ALGORITHMS_H
