#include <iostream>
#include <cstring>
using namespace std;

int n, m, s;
int G[10][10];
int visited[10];

void read()
{
    int a, b;
    cin >> n >> m;
    for (int i = 0; i < m; i++)
    {
        cin >> a >> b;
        G[a-1][b-1] = G[b-1][a-1] = 1;
    }
}

void dfs(int c, int left)
{
    visited[c] = 1;
    for (int j = 0; j < n; j++)
        if (G[c][j])
        {
            if (!left && j == s)
            {
                //cout << c << " -> " << j << " succeed" << endl;
                break;
            }
            if (!visited[j])
            {
                //cout << c << " -> " << j << endl;
                dfs(j, left-1);
            }
        }
    //cout << "fail\n";
    visited[c] = 0;
}
    

int main()
{
    read();
    for (s = 0; s < n; s++)
    {
        dfs(s, n-1);
        cout << endl;
    }
    return 0;
}
