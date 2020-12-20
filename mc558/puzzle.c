/**********************************
** MC558-2S-2019                 **
** Project II                    **
** Giovanne Lucas D. P. Mariano  **
** RA173317                      **
**********************************/

/************************ Sobre o problema ****************************
# As informacoes recebidas sobre o puzzle podem ser utilizadas para   *
construir um grafo conexo com pesos nas arestas de acordo com o       * 
enunciado.                                                            *
# Com este grafo construido, para se obter o menor peso maximo em um  *
caminho de s a t, basta encontrar a arvore geradora minima do grafo e *
tomar o máximo peso no caminho unico entre s e t.                     *
# Para tanto, o codigo aqui apresentado implementa:                   *
1. Uma funcao para ler a entrada e construir o grafo de acordo com a  *
estrutura de dados adequada (representação com lista de adjacencias)  *
2. Uma funcao que toma como entrada o grafo e determina uma MST       *
3. Uma funcao que recebe uma MST do grafo, s e t e determina o maximo *
peso no caminho unico entre s e t na MST                              *
# Referências:                                         *
[1]Cormen, Thomas H., et al. Introduction to algorithms. MIT press.   *
[2]https://www.geeksforgeeks.org/disjoint-set-data-structures/        *
[3]https://www.geeksforgeeks.org/                                     *
kruskals-minimum-spanning-tree-algorithm-greedy-algo-2/               *
[4]https://www.programiz.com/dsa/graph-bfs                            *
**********************************************************************/

#include <stdio.h>
#include <stdlib.h>
#include <math.h>

/*************************************
**  Data Sctructure Implementation  **
*************************************/
#define SIZE 500
typedef struct{
    int items[SIZE];
    int front;
    int rear;
}queue;

// a structure to represent a weighted edge in graph 
typedef struct{ 
    int v1;
    int v2;
    int w;
}edge;

// a structure to represent edges in adjacency list
typedef struct node{
    int vertex;
    int w;
    struct node* next;
}node;
  
// A structure to represent a connected, undirected 
// and weighted graph 
typedef struct{ 
    int nV;
    int nE; 
    edge *E;
    node **adj;
}graph;

/**********************************
**  Node Management Declaration  **
**********************************/
// reference [4]
node* createNode(int v, int w);

/*********************************
**  Priority Queue Declaration  **
*********************************/
// reference [4]
queue* createQueue();
void enqueue(queue* q, int);
int dequeue(queue* q);
void display(queue* q);
int isEmpty(queue* q);
void printQueue(queue* q);

/*****************************************
**  Disjoint-Set Forest Implementation  **
*****************************************/
// reference [2]
// Finds the representative of the set that i is an element of
// With path compression
int findSet(int x, int *parent){
  if (parent[x] == x){
    return x;
  }else{
    int newParent = findSet(parent[x], parent);
    parent[x] = newParent;
    return newParent;
  }
}

// Unites the set that includes x and the set that includes y
// With union by rank
void unioN(int x, int y, int *parent, int *rank){
    int xrep = findSet(x, parent);
    int yrep = findSet(y, parent);

    if(xrep == yrep)
        return;

    int xrank, yrank;
    xrank = rank[xrep];
    yrank = rank[yrep];
    if(xrank < yrank){
        parent[xrep] = yrep;
    }else if(yrank < xrank){
        parent[yrep] = xrep;
    }else{
        parent[xrep] = yrep;
        rank[yrep]++;
    }
}

int compare(const void* x, const void* y){ 
    edge *a = (edge*)x; 
    edge *b = (edge*)y; 
    return (a->w > b->w);
} 

/**************************************
**  Core Problem Oriented Functions  **
**************************************/
// Processes the input and create the graph
graph* process(void){
	int nV, nE, v1, v2, w;
	scanf("%d %d", &nV, &nE);
	graph *G = (graph *)malloc(sizeof(graph));
	G->nV = nV; 
    G->nE = nE; 
    G->E = (edge *)malloc(nE * sizeof(edge));
	// build the adjacency list for all vertices in G
	for(int i = 0; i < nE; i++){
		scanf("%d %d %d", &v1, &v2, &w);
		G->E[i].v1 = v1;
		G->E[i].v2 = v2;
		G->E[i].w = w;
	}
	return G;
}

// Kruskal's algorithm to construct one MST for G
// references [1] and [3]
graph* KruskalMST(graph *G){
	// A = void
	graph *T = (graph *)malloc(sizeof(graph));
	T->E = (edge *)malloc((G->nV - 1) * sizeof(edge));
	T->adj = (node **)malloc(G->nV * sizeof(node*));
	T->nV = G->nV;
	T->nE = G->nV - 1;
    int i, e = 0;
	// sort the edges of G.E into nondecreasing order by weight w
    qsort(G->E, G->nE, sizeof(G->E[0]), compare);
  	// for each vertex v in G.V
	//   MAKE-SET(v)
  	int *parent, *rank;
  	parent = (int *)malloc(G->nV * sizeof(int));
  	rank = (int *)malloc(G->nV * sizeof(int)); 
    for (i = 0; i < G->nV; i++){ 
        parent[i] = i; 
        rank[i] = 0;
        T->adj[i] = NULL;
    }
    i = 0;
    // for each edge (x,y) i G.E, taken in nondecreasing order by weight
    while ((e < (G->nV - 1)) && (i < G->nE)){
        edge nextE = G->E[i++];
        int x = findSet(nextE.v1, parent);
        int y = findSet(nextE.v2, parent);
        // if FIND-SET(x) != FIND-SET(y)
        if (x != y){
        	// A = A union {(x,y)}

        	node* v1 = createNode(nextE.v2, nextE.w);
        	node* v2 = createNode(nextE.v1, nextE.w);
    		v1->next = T->adj[nextE.v1];
    		v2->next = T->adj[nextE.v2];
    		T->adj[nextE.v1] = v1;
    		T->adj[nextE.v2] = v2;

            T->E[e++] = nextE;
            // unioN(x,y)
            unioN(x, y, parent, rank);
        }
    }
    return T;
}

// Search the MST to find the
// higher weight in the minimum maximum weight path
int modifiedBFS(graph* G, int s, int t){
	// create the queue for BFS
    queue* q = createQueue();
    // create the arrays to store if the vertex has already been visited
    // and to store the vertex who discovered him first (an only)
    int *visited, *dad;
    visited = (int *)malloc(G->nV * sizeof(int));
    dad = (int *)malloc(G->nV * sizeof(int));
    // initialize both arrays
    for(int i = 0; i < G->nV; i++){
    	visited[i] = 0;
    }
    visited[s] = 1;
    // initialize the queue
    enqueue(q, s);

    // runs the standard BFS
    node *temp;
    int currentVertex;
    while(!isEmpty(q)){
        currentVertex = dequeue(q);
    	temp = G->adj[currentVertex];
       	while(temp){
            int adjVertex = temp->vertex;
            if(visited[adjVertex] == 0){
            	dad[adjVertex] = currentVertex;
                visited[adjVertex] = 1;
                enqueue(q, adjVertex);
            }
            temp = temp->next;
       	}
    }

    // go back in the reverse order of BFS discovering to find the maximum weight
    // in the path from s to t
    currentVertex = t;
    int answer = 0;
    while(currentVertex != s){
    	temp = G->adj[currentVertex];
    	while(temp && (temp->vertex != dad[currentVertex])){
    		temp = temp->next;
    	}
    	if(temp->w > answer)
    		answer = temp->w;
    	currentVertex = dad[currentVertex];
    }
    return answer;
}

/********************
**  Main Function  **
********************/
int main(void){
	graph *G, *T;
	// call function to process the input and create the graph
	G = process();
	T = KruskalMST(G);
	// read the number k
	int k;
	scanf("%d", &k);
	/* call function to compute for each one of the k pairs s and t:
	the lower maximum dificulty from s to t */
	int i, s, t;
	for(i = 0; i < k; i++){
		scanf("%d %d", &s, &t);
		printf("%d\n", modifiedBFS(T, s, t));

	}
	return 0;
}

/**********************************
**  Node Management Declaration  **
**********************************/
node* createNode(int v, int w){
    node* newNode = (node *)malloc(sizeof(node));
    newNode->vertex = v;
    newNode->w = w;
    newNode->next = NULL;
    return newNode;
}

/************************************
**  Priority Queue Implementation  **
************************************/
queue* createQueue(){
    queue* q = (queue *)malloc(sizeof(queue));
    q->front = -1;
    q->rear = -1;
    return q;
}
int isEmpty(queue* q){
    if(q->rear == -1) 
        return 1;
    else 
        return 0;
}
void enqueue(queue* q, int value){
    if(q->rear < SIZE-1){
        if(q->front == -1)
            q->front = 0;
        q->rear++;
        q->items[q->rear] = value;
    }
}
int dequeue(queue* q){
    int item;
    if(isEmpty(q)){
        item = -1;
    }else{
        item = q->items[q->front];
        q->front++;
        if(q->front > q->rear){
            q->front = q->rear = -1;
        }
    }
    return item;
}