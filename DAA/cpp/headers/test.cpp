#include <iostream>
#include <vector>
#include "graph_algorithms.h"

using namespace std;

int main() {
    int n = 6; // number of vertices
    vector<int> adjList[n];

    // build the graph
    adjList[0].push_back(1);
    adjList[0].push_back(2);
    adjList[1].push_back(2);
    adjList[2].push_back(0);
    adjList[2].push_back(3);
    adjList[3].push_back(3);
    adjList[3].push_back(4);
    adjList[4].push_back(4);
    adjList[4].push_back(5);

    // initialize visited array
    vector<bool> visited(n, false);

    // perform BFS and DFS from vertex 2
    cout << "BFS traversal: ";
    bfs(adjList, visited, 2);
    cout << endl;

    for (int i = 0; i < n; i++) {
        visited[i] = false;
    }
    cout << "DFS traversal: ";
    dfs(adjList, visited, 2);
    cout << endl;

    return 0;
}
