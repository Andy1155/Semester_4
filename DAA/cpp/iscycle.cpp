#include <iostream>
#include <vector>
#include <queue>
using namespace std;

bool iscyclebfs(int node, vector<int> adj[], vector<bool>& visited) {
    int treeedge = 0;
	int alledge = 0;
	queue<int> q;
    q.push(node);
    visited[node] = true;
	alledge += adj[node].size();
    while(!q.empty()) {
        int curr = q.front();
        q.pop();
        for(int i = 0; i < adj[curr].size(); i++) {
            int next = adj[curr][i];
            if(!visited[next]) {
                visited[next] = true;
				treeedge++;
				alledge += adj[next].size();
                q.push(next);
            }
        }
    }
	alledge /= 2;
	return !(treeedge==alledge);
}

bool istherecycleingraph(int n, vector<int> adj[]) {
	bool ans = false;
    vector<bool> visited(n, false);
    for(int i = 0; i < n; i++) {
        if(!visited[i]) {
            if(iscyclebfs(i, adj, visited)){
				ans = true;
				break;
			};
        }
    }
    return ans;
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

    bool istherecycle = istherecycleingraph(n, adj);
    cout << "is there cycle: " << istherecycle << endl;

	adj[5].push_back(3);
	adj[3].push_back(5);
	istherecycle = istherecycleingraph(n, adj);
    cout << "is there cycle: " << istherecycle << endl;

    return 0;
}
