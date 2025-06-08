#include <bits/stdc++.h>
using namespace std;

const long long MOD = 1'000'000'007LL;

long long pow2(long long x) {
    long long res = 1, a = 2;
    while (x) {
        if (x & 1) res = res * a % MOD;
        a = a * a % MOD;
        x >>= 1;
    }
    return res;
}

int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr);
    int T; 
    cin >> T;
    while (T--) {
        int n; 
        cin >> n;
        vector<vector<int>> g(n + 1);
        for (int i = 0, u, v; i < n - 1; ++i) {
            cin >> u >> v;
            g[u].push_back(v);
            g[v].push_back(u);
        }

        vector<int> parent(n + 1, 0);
        vector<vector<int>> child(n + 1);
        vector<int> st{1};
        parent[1] = -1;

        while (!st.empty()) {
            int u = st.back(); 
            st.pop_back();
            for (int v : g[u]) {
                if (v != parent[u]) {
                    parent[v] = u;
                    child[u].push_back(v);
                    st.push_back(v);
                }
            }
        }

        // 2. Count leaves
        vector<int> leaves;
        for (int v = 1; v <= n; ++v)
            if (child[v].empty()) 
                leaves.push_back(v);

        if (leaves.size() > 2) {
            cout << 0 << '\n';
            continue;
        }

        if (leaves.size() == 1) {
            cout << pow2(n) << '\n';
            continue;
        }

        int B = -1;
        for (int v = 1; v <= n; ++v) {
            if (child[v].size() == 2) {
                B = v;
                break;
            }
        }

        int c1 = child[B][0], c2 = child[B][1];

        auto subtree_size = [&](int root) {
            int sz = 0;
            vector<int> s{root};
            while (!s.empty()) {
                int u = s.back(); 
                s.pop_back();
                ++sz;
                for (int v : child[u]) 
                    s.push_back(v);
            }
            return sz;
        };

        long long sz1 = subtree_size(c1);
        long long sz2 = subtree_size(c2);
        long long d = llabs(sz1 - sz2);
        long long t = n - sz1 - sz2;

        long long F = (d == 0) ? 2LL : (3LL * pow2(d - 1)) % MOD;
        long long ans = pow2(t) * F % MOD;
        cout << ans << '\n';
    }
    return 0;
}