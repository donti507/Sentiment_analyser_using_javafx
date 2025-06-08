#include <iostream>
#include <vector>
#include <unordered_map>
#include <algorithm>

using namespace std;

void findCoolPartitions() {
    int n;
    cin >> n;

    vector<int> arr(n + 1);
    vector<int> nextPos(n + 2, n + 1);
    vector<int> lastSeen(n + 2, n + 1);

    for (int i = 1; i <= n; ++i) {
        cin >> arr[i];
    }

    for (int i = n; i >= 1; --i) {
        nextPos[i] = lastSeen[arr[i]];
        lastSeen[arr[i]] = i;
    }

    int segments = 0;
    int start = 1;

    while (start <= n) {
        int end = start;
        int limit = nextPos[start];

        while (start <= end) {
            limit = max(limit, nextPos[start]);
            ++start;
        }

        ++segments;
        if (limit > n) break;
        start = end + 1;
    }

    cout << segments << "\n";
}

int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr);

    int testCases;
    cin >> testCases;

    while (testCases--) {
        findCoolPartitions();
    }

    return 0;
}