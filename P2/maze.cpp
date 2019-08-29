#include <iostream>
using namespace std;

int n, m, cnt, si, sj, ti, tj;
int a[10][10];

void dfs(int i, int j)
{
    if (a[i][j])
        return;
    else
    {
        if (i == ti && j == tj)
        {
            cnt++;
            return;
        }
        else
        {
            a[i][j] = 1;
            if (j < m - 1) dfs(i, j+1);
            if (i < n - 1) dfs(i+1, j);
            if (j > 0) dfs(i, j-1);
            if (i > 0) dfs(i-1, j);
            a[i][j] = 0;
        }
    }
}

int main()
{
    cin >> n >> m;
    for (int i = 0; i < n; i++)
        for (int j = 0; j < m; j++)
            cin >> a[i][j];
    cin >> si >> sj >> ti >> tj;
    si--;
    sj--;
    ti--;
    tj--;
    
    dfs(si, sj);
    
    cout << cnt << endl;
    return 0;
}
