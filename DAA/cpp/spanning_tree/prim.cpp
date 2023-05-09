#include <iostream>
#include <vector>
#include <queue>
using namespace std;

typedef pair<int, int> pii;

int prim(vector<vector<pii>>& graph, int start) {
    int n = graph.size();
    vector<bool> visited(n, false);
    priority_queue<pii, vector<pii>, greater<pii>> pq;
    int min_cost = 0;

    // Start with the given node
    pq.push(make_pair(0, start));
    while (!pq.empty()) {
        pii curr = pq.top();
        pq.pop();

        int node = curr.second;
        int cost = curr.first;

        if (visited[node]) continue;
        visited[node] = true;
        min_cost += cost;

        // Add all unvisited neighbors to the queue
        for (auto& neighbor : graph[node]) {
            int neighbor_node = neighbor.first;
            int neighbor_cost = neighbor.second;
            if (!visited[neighbor_node]) {
                pq.push(make_pair(neighbor_cost, neighbor_node));
            }
        }
    }
    return min_cost;
}

int main() {
    int n, m;
    cin >> n >> m;
    vector<vector<pii>> graph(n);

    // Read in the graph as an adjacency list
    for (int i = 0; i < m; i++) {
        int u, v, w;
        cin >> u >> v >> w;
        graph[u].push_back(make_pair(v, w));
        graph[v].push_back(make_pair(u, w));
    }

    int start = 0; // Choose any starting node
    int min_cost = prim(graph, start);

    cout << "Minimum spanning tree cost: " << min_cost << endl;

    return 0;
}
