#include<bits/stdc++.h>
using namespace std;

class Edge {
public:
    int from, to, weight;
    Edge(int f, int t, int w) {
        from = f;
        to = t;
        weight = w;
    }
};

bool compareEdges(const Edge& e1, const Edge& e2) {
    return e1.weight < e2.weight;
}

class DisjointSet {
public:
    vector<int> parent, rank;
    DisjointSet(int n) {
        parent.resize(n);
        rank.resize(n, 0);
        for(int i = 0; i < n; i++) {
            parent[i] = i;
        }
    }
    int findSet(int x) {
        if(parent[x] != x) {
            parent[x] = findSet(parent[x]);
        }
        return parent[x];
    }
    void unionSets(int x, int y) {
        int px = findSet(x), py = findSet(y);
        if(px == py) {
            return;
        }
        if(rank[px] < rank[py]) {
            parent[px] = py;
        }
        else if(rank[px] > rank[py]) {
            parent[py] = px;
        }
        else {
            parent[py] = px;
            rank[px]++;
        }
    }
};

vector<Edge> kruskalMST(vector<Edge>& edges, int n) {
    DisjointSet ds(n);
    vector<Edge> MST;
    sort(edges.begin(), edges.end(), compareEdges);
    for(auto e: edges) {
        if(ds.findSet(e.from) != ds.findSet(e.to)) {
            MST.push_back(e);
            ds.unionSets(e.from, e.to);
        }
    }
    return MST;
}

int main() {
    int n, m, u, v, w;
	cout << " enter number of V and E :: ";
    cin >> n >> m;
    vector<Edge> edges;
    for(int i = 0; i < m; i++) {
		cout << "   enter 2 vertices and weight :: ";
        cin >> u >> v >> w;
        edges.push_back(Edge(u, v, w));
    }
    vector<Edge> MST = kruskalMST(edges, n);
    for(auto e: MST) {
        cout << e.from << " " << e.to << " " << e.weight << endl;
    }
    return 0;
}
