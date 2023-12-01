#include <bits/stdc++.h>
#define n 3
using namespace std;

//GRAPH NODE
class Node
{
public:
    Node *parent;
    Node *child;
    vector<vector<char>> mat;
    int rowB;
    int colB;

    Node(vector<vector<char>> mat)
    {
        this->mat = mat;
        this->parent = NULL;
        for (int i = 0; i < n; i++)
        {
            for (int j = 0; j < n; j++)
            {
                if (mat[i][j] == 'B')
                {
                    rowB = i;
                    colB = j;
                    break;
                }
            }
        }
    }
};

vector<vector<char>> FinalState(n, vector<char>(n)); // FINAL STATE NODE
bool ReachedFinal = false;

int dx[] = {1, 0, -1, 0};
int dy[] = {0, 1, 0, -1};

void PrintTile(Node *node) // Helper Function to Print the Node
{
    if (node == NULL)
    {
        cout << "\nNULL TILE NODE\n";
        return;
    }

    cout << "\n";

    for (int i = 0; i < n; i++)
    {
        for (int j = 0; j < n; j++)
        {
            cout << node->mat[i][j] << " ";
        }
        cout << "\n";
    }

    cout << "\n";
}

bool isParent(Node *node, vector<vector<char>> mat) // Checks if Newly formed Tile State is Parent of the current State
{
    bool isPar = true;

    if (node->parent == NULL)
        return false;

    for (int i = 0; i < n; i++)
    {
        for (int j = 0; j < n; j++)
        {
            if (node->parent->mat[i][j] != mat[i][j])
            {
                isPar = false;
                return false;
            }
        }
    }

    return true;
}

void DFS(Node *node, int &maxDepth, int currDepth) // DFS Function which does dfs till maxDepth allowed
{
    cout << "\nInside DFS of depth " << currDepth << "\n";
    cout << "Current state is : \n";
    PrintTile(node);

    if (currDepth > maxDepth)
        return;

    if (ReachedFinal)
        return;

    if (currDepth == maxDepth)
    {
        bool isFinal = true;

        for (int i = 0; i < n; i++)
        {
            for (int j = 0; j < n; j++)
            {
                if (node->mat[i][j] != FinalState[i][j])
                {
                    isFinal = false;

                    if (node->parent)
                        node->parent->child = NULL;

                    node->parent = NULL;
                    delete (node);
                    return;
                }
            }
        }

        if (isFinal)
        {
            ReachedFinal = true;
            stack<Node *> st;
            Node *temp = node;

            while (temp != NULL)
            {
                st.push(temp);
                temp = temp->parent;
            }

            cout << "\nPath from the Given State to Final State is as Follows : \n\n";

            while (!st.empty())
            {
                temp = st.top();
                st.pop();

                PrintTile(temp);
            }

            node->parent->child = NULL;
            node->parent = NULL;
            delete (node);
            return;
        }
    }

    int x = node->rowB, y = node->colB;
    vector<vector<char>> mat(n, vector<char>(n));
    for (int i = 0; i < 4; i++)
    {
        int nx = x + dx[i];
        int ny = y + dy[i];

        if (nx >= 0 && ny >= 0 && nx < n && ny < n)
        {

            swap(node->mat[x][y], node->mat[nx][ny]);

            for (int i = 0; i < n; i++)
            {
                for (int j = 0; j < n; j++)
                {
                    mat[i][j] = node->mat[i][j];
                }
            }

            swap(node->mat[x][y], node->mat[nx][ny]);

            if (isParent(node, mat))
                continue;
            else
            {
                Node *ch = new Node(mat);
                node->child = ch;
                ch->parent = node;

                DFS(ch, maxDepth, currDepth + 1);
                if (ReachedFinal)
                    return;
            }
        }
    }

    node->child = NULL;

    if (node->parent)
        node->parent->child = NULL;

    node->parent = NULL;

    if (currDepth != 1)
        delete node;

    return;
}
int main()
{
    cout << "This algorithm solves the 3X3 tile Puzzle using Iterative Deepening Search (IDS) \n";
    cout << "Use 'B' to represent blank state \n";

    cout << "\n\nEnter the state of the 3X3 tile : \n";

    vector<vector<char>> mat(n, vector<char>(n));

    for (int i = 0; i < n; i++)
    {
        for (int j = 0; j < n; j++)
        {
            cin >> mat[i][j];
        }
    }

    cout << "\n\n";
    int cnt = 0;

    for (int i = 0; i < n; i++)
    {
        for (int j = 0; j < n; j++)
        {
            FinalState[i][j] = ('1' + cnt);
            cnt++;
        }
    }

    FinalState[n - 1][n - 1] = 'B';

    Node *root = new Node(mat);

    for (int h = 1; h <= 100; h++)
    {

        root = new Node(mat);
        DFS(root, h, 1);

        cout << "\nDone with height " << h << "\n";

        if (ReachedFinal)
            break;
    }
}
