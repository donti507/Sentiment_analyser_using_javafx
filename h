vector<int> ans;
    ans.reserve(q);
    while (q--) {
        int i, xn;
        cin >> i >> xn;
        int xo = a[i];
        if (xo != xn) {
            ms.erase(it[xo]);
            Node *l, *m, *r;
            split(root[xo], i, l, m);
            split(m, i + 1, m, r);
            apply(r, +2);
            root[xo] = merge(l, r);
            int M1 = root[xo] ? root[xo]->best + 1 : 0;
            int k1 = M1 >> 1;
            it[xo] = ms.insert(k1);
            ms.erase(it[xn]);
            split(root[xn], i, l, r);
            apply(r, -2);
            int idx = (l ? l->sz : 0) + 1;
            int f2 = i - 2 * idx;
            Node* nd = newNode(i, f2);
            root[xn] = merge(merge(l, nd), r);
            int M2 = root[xn]->best + 1;
            int k2 = M2 >> 1;
            it[xn] = ms.insert(k2);
            a[i] = xn;
        }
        ans.pb(*ms.rbegin());
    }
    for (int v : ans) cout << v << " ";
    cout << endl;
}

signed main() {
    ios_base::sync_with_stdio(false);
    cin.tie(nullptr);
    cout.tie(nullptr);
    int tests; cin >> tests;
    for (int i = 0; i < tests; ++i)
        solve();
}