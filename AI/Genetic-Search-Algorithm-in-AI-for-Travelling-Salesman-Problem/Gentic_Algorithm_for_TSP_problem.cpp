//assumption  fully connected graph
#include <bits/stdc++.h>
#define POPULATION_SIZE 50
#define ll long long
using namespace std;

int N, E;

//Storing path and cost for the path
int PathCost[100][100] = {0};
vector<int>genFitness;
void Initialize()
{
    for (int i = 0; i < 100; i++)
    {
        for (int j = 0; j < 100; j++)
            PathCost[i][j] = INT_MAX;
    }
}

int GenerateRandom(int start, int end)
{
    int range = (end - start) + 1;
    int random_int = start + (rand() % range);
    return random_int;
}

int AVG(int a, int b)
{
    return (a+b)/2;
}


class Individual
{
public:
    vector<int> chromosome;
    int fitness;

    Individual(vector<int> chromosome)
    {
        this->chromosome = chromosome;
        this->fitness = this->calc_fitness();
    }

    int calc_fitness()
    {
        int prev_node = 1;
        int fitns = 0;

        for (int i = 0; i < chromosome.size(); i++)
        {
            if(PathCost[prev_node][chromosome[i]] == INT_MAX)
            return INT_MAX;

            fitns += PathCost[prev_node][chromosome[i]];
            prev_node = chromosome[i];
        }

        if(PathCost[prev_node][1] == INT_MAX)
        return INT_MAX;

        fitns += PathCost[prev_node][1];

        return fitns;
    }
};

Individual Generate_Individual(int startNode)
{
    vector<int> genes;

    genes.push_back(startNode);

    vector<bool> taken(N + 1, false);

    taken[0] = taken[1] = taken[startNode] = true;

    for (int i = 3; i <= N; i++)
    {
        int rnd = GenerateRandom(2, N);

        bool MoveLeft = false, MoveRight = false;

        float p = (((float)GenerateRandom(0, 100)) / 100.0);

        if (p <= 0.5)
            MoveLeft = true;
        else
            MoveRight = true;

        if (MoveLeft)
        {
            while (taken[rnd])
            {
                rnd--;

                if (rnd <= 1)
                    rnd = N;
            }

            genes.push_back(rnd);
            taken[rnd] = true;
        }
        else if (MoveRight)
        {
            while (taken[rnd])
            {
                rnd = (rnd + 1) % (N + 1);

                if (rnd == 0 || rnd == 1)
                    rnd = 2;
            }

            genes.push_back(rnd);
            taken[rnd] = true;
        }
    }

    Individual I(genes);

    return I;
}

bool static cmp(Individual &I1, Individual &I2)
{
    return I1.fitness < I2.fitness;
}

void Describe_Generation(vector<Individual> &p, int &gen)
{
    cout << "\nGeneration : " << gen << "\n";
    gen++;

    cout << "Fitness values of Individuals from this Generation are : \n";

    for (auto ob : p)
    {
        cout << ob.fitness << "\n";
    }

    cout << "\nFittest Individaual is : \n\n";

    cout << "1 -> ";

    for (auto node : p[0].chromosome)
        cout << node << " -> ";

    cout << "1\n";

    cout << "\nFittness : " << p[0].fitness << "\n";

    genFitness.push_back(p[0].fitness);
}


bool isMutationHelpful(vector<int>&g, int i, int j)
{
    int prev_i , after_i, prev_j, after_j;

    if(i-1 >= 0)
    prev_i = g[i-1];
    else
    prev_i = 1;

    if(j-1 >= 0)
    prev_j = g[j-1];
    else
    prev_j = 1;


    if(i+1 < g.size())
    after_i = g[i+1];
    else
    after_i = 1;

    if(j+1 < g.size())
    after_j = g[j+1];
    else
    after_j = 1;

    ll beforeMutation = 0;


    beforeMutation += (ll)PathCost[prev_i][g[i]];
    beforeMutation += (ll)PathCost[g[i]][after_i];
    beforeMutation += (ll)PathCost[prev_j][g[j]];
    beforeMutation += (ll)PathCost[g[j]][after_j];

    ll afterMutation = 0;

    afterMutation += (ll)PathCost[prev_i][g[j]];
    afterMutation += (ll)PathCost[g[j]][after_i];
    afterMutation += (ll)PathCost[prev_j][g[i]];
    afterMutation += (ll)PathCost[g[i]][after_j];

    if(afterMutation <= beforeMutation)
    return true;
    else
    return false;
    
}


Individual Crossover(Individual &p1, Individual &p2)
{
    vector<int>gnome;

    vector<bool>taken(N+1,false);

    taken[0] = taken[1] = true;

    int i = 0 , j = 0;

    float p = ((float)GenerateRandom(0,100))/100.0;

    while(gnome.size() < (N-1))
    {
        p = ((float)GenerateRandom(0,100))/100.0;

        if(p <= 0.5)
        {
            i = GenerateRandom(0,p1.chromosome.size()-1);
            while(taken[p1.chromosome[i]])
            {
                i = (i+1)%(p1.chromosome.size());  
            }

            gnome.push_back(p1.chromosome[i]);
            taken[p1.chromosome[i]] = true;
           // i = (i+1)%(p1.chromosome.size());
           
        }
        else
        {
            j = GenerateRandom(0,p2.chromosome.size()-1);
            while(taken[p2.chromosome[j]])
            {
                j = (j+1)%(p2.chromosome.size());
            }   

            gnome.push_back(p2.chromosome[j]);
            taken[p2.chromosome[j]] = true;
           // j = (j+1)%(p2.chromosome.size());

        }
    }

    bool isMutation;

    p = ((float)GenerateRandom(0,100))/100.0;

    if(p <= 0.5)
    isMutation = false;
    else
    isMutation = true;


    if(!isMutation)
    {
        Individual child(gnome);
        return child;
    }
    else
    {
        int mutationLimit = GenerateRandom(10,20);

        while(mutationLimit--)
        {
            int ind1 = GenerateRandom(0,gnome.size()-1);
            int ind2 = GenerateRandom(0,gnome.size()-1);

            if(isMutationHelpful(gnome,ind1,ind2))
            {
                swap(gnome[ind1] , gnome[ind2]);
            }
        }

        Individual child(gnome);
        return child;
    }
}


void GeneticAlgorithm()
{
    vector<Individual> population, new_Population;

    int startNode = 2;
    for (int i = 0; i < POPULATION_SIZE; i++)
    {
        Individual I = Generate_Individual(startNode);
        startNode = (startNode + 1) % N;

        if (startNode == 0)
            startNode = N;
        else if (startNode == 1)
            startNode = 2;

        population.push_back(I);
    }

    sort(population.begin(), population.end(), cmp);

    int gen = 1;

    Describe_Generation(population, gen);
    int threshold_Gen = (N*1000)/2;

    while (gen <= threshold_Gen)
    {
        int s = (POPULATION_SIZE * 10) / 100;

        new_Population.clear();

        for (int i = 0; i < s; i++)
        {
            new_Population.push_back(population[i]);
        }

        int rs = (POPULATION_SIZE - s);

        int i = 0;

        while(i<rs)
        {
           int p1 = 0 , p2 = 0;

           while(p1 == p2)
           {
                p1 = GenerateRandom(0, (POPULATION_SIZE)/2);
                p2 = GenerateRandom(s, (POPULATION_SIZE)-2);
           }

            Individual child = Crossover(population[p1],population[p2]);

            if(child.fitness <= AVG(population[p1].fitness,population[p2].fitness))
            {
                new_Population.push_back(child);
                i++;
            }
            else
            {
                float p = ((float)GenerateRandom(0,100))/100.0;

                if(p <= 0.25)
                {
                    new_Population.push_back(child);
                    i++;
                }

            }
            
        }

        population = new_Population;

        sort(population.begin(),population.end(),cmp);
        Describe_Generation(population,gen);
    }
}


int main()
{
    srand(time(0));
    cout << "Enter the number of nodes (1-N):  ";

    cin >> N;

    cout << "\nEnter the number of Edges : ";

    cin >> E;

    Initialize();
    cout << "\n\nEnter the Edges with Edge cost (u,v,c => Depicts Edge from u to v with cost c) :  \n";

    int u, v, c;

    for (int i = 0; i < E; i++)
    {
        cin >> u >> v >> c;

        PathCost[u][v] = c;
        PathCost[v][u] = c;
    }

    GeneticAlgorithm();

    //cout<<"\nFitness of all generations over evolutions are : \n";

    // for(auto f : genFitness)
    // cout<<f<<" ";
}