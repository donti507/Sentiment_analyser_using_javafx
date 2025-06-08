#include <iostream>
#include <vector>
#include <numeric>
#include <algorithm>

void solve() {
    int n;
    std::cin >> n;

    std::cout << 1 << " ";

    for (int i = 3; i <= n; ++i) {
        std::cout << i << " ";
    }

    std::cout << 2 << std::endl;
}



int main() {
    std::ios_base::sync_with_stdio(false);
    std::cin.tie(NULL);

    int t;
    std::cin >> t;
    while (t--) {
        solve();
    }

    return 0;
}