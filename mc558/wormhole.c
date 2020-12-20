/**********************************
** MC558-2S-2019                 **
** Project III                   **
** Giovanne Lucas D. P. Mariano  **
** RA173317                      **
**********************************/

/************************ Sobre o problema *******************************
# As informacoes recebidas sobre o problema podem ser utilizadas para    *
construir um grafo direcionado com pesos nas arestas de acordo com o     * 
enunciado. Neste grafo, os vertices representam sistemas solares e as    *
arestas representam buracos de minhoca.                                  *
# Com este grafo construido, para decidir se e possivel Ellie estudar o  *
Big Bang viajando para o passado, basta determianr se existe algum ciclo *
cuja soma dos pesos no caminho seja negativa que é alcancavel a partir   *
do sistema solar da Terra (zero).                                        *
# Note que o maior deslocamento possível para o passado vale 1000 anos,  *
de forma que para viajar 15 bilhões de anos para o passado, é necessário *
utilizar um ciclo negativo. Aqui assumo que é necessário voltar para os  *
primórdios do universo e desconsidero a possibilidade de informações num *
passado recente serem conclusivas para a física da origem do universo.   *
# Para tanto, o codigo aqui apresentado implementa:                      *
1. Uma funcao para ler a entrada e construir o grafo de acordo com as    *
estruturas de dados adequadas (representacao com lista de adjacencias).  *
2. Uma funcao que toma como entrada o grafo e determina, atraves do algo-*
ritmo de Bellman-Ford para caminhos mínimos com fonte única, se existe   *
algum ciclo de peso negativo alcancavel a partir da Terra.               *
# Referências:                                                           *
[1]Cormen, Thomas H., et al. Introduction to algorithms. MIT press.      *
*************************************************************************/

#include <stdio.h>
#include <stdlib.h>
#include <math.h>

/*************************************
**  Data Sctructure Implementation  **
*************************************/
#define NIL -1 // vertices de 0 a 1000

// a structure to represent a weighted edge in graph 
typedef struct{
    int source;
    int destiny;
    float weight;
}edge;

// A structure to represent a directed and weighted graph
typedef struct{
    int nV;
    int nE;
    edge *E;
}graph;

/**************************************
**  Core Problem Oriented Functions  **
**************************************/

// Processes the input and create the graph
graph* Process(void){
	int nV, nE, source, destiny, weight;
	scanf("%d %d", &nV, &nE);
	graph *G = (graph *)malloc(sizeof(graph));
	G->nV = nV;
    G->nE = nE;
    G->E = (edge *)malloc(nE * sizeof(edge));
	// build the adjacency list for all vertices in G
	for(int i = 0; i < nE; i++){
		scanf("%d %d %d", &source, &destiny, &weight);
		G->E[i].source = source;
		G->E[i].destiny = destiny;
		G->E[i].weight = (float)weight;
	}
	return G;
}

// Initialize the shortest-path estimates and predecessors
void InitializeSingleSource(graph *G, int s, float *d, int *pi){
    for(int i = 0; i < G->nV; i++){
        d[i] = INFINITY;
        pi[i] = NIL;
    }
    d[s] = 0;
    return;
}
// After initialization, we have pi[v] = NIL for all v in V(G), d[s] = 0, 
// and d[v] = INF for all v in V(G)-{s}.

// Performs a relaxation step on edge (u,v)
void Relax(float *d, int *pi, int u, int v, int w){
    if(d[v] > (d[u] + w)){
        d[v] = d[u] + w;
        pi[v] = u;
    }
    return;
}

// Solves the single-source shortest-paths problem in the general case,
// in which edge weights may be negative.
int BellmanFord(graph *G, int s){
    float *d = (float *)malloc(G->nV * sizeof(float));
    int *pi = (int *)malloc(G->nV * sizeof(int));
    InitializeSingleSource(G, s, d, pi);
    for(int i = 0; i < (G->nV - 1); i++){
        for(int e = 0; e < G->nE; e++){
            int u = G->E[e].source;
            int v = G->E[e].destiny;
            int w = G->E[e].weight;
            Relax(d, pi, u, v, w);
        }
    }
    for(int e = 0; e < G->nE; e++){
        int u = G->E[e].source;
        int v = G->E[e].destiny;
        int w = G->E[e].weight;
        if(d[v] > (d[u] + w))
            return 1; // Contains negative-weight cycles
    }
    // Teste do universo nenem
    //for(int v = 0; v < G->nV; v++)
    //	if(d[v] <= -2163)
    //		return 1;
    return 0; // Contains no negative-weight cycles
}
// The algorithm returns 0 if and only if the graph does not contain 
// negative-weight cycles.

/********************
**  Main Function  **
********************/
int main(void){
	graph *G;
	// call function to process the input and create the graph
	G = Process();
	/* call function to decide if is possible to go arbitrarily backwards in time
    and prints the answer */
    if(BellmanFord(G, 0))
		printf("Possivel\n");
    else
        printf("Impossivel\n");
	return 0;
}