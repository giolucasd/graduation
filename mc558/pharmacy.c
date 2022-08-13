/**********************************
** MC558-2S-2019                 **
** Project I                     **
** Giovanne Lucas D. P. Mariano  **
** RA173317                      **
**********************************/

/************************ Sobre o problema ****************************
# As informações recebidas sobre a pilula podem ser utilizadas para   *
construir um grafo simples no qual:                                   *
* cada vértice representa uma molécula (T, J, G ou A) e               *
* cada aresta representa uma ligação entre duas moléculas             *
# Como não é possível saber o tipo de cada molécula informada, as     *
informações que se têm são suficientes apenas para afirmar-se que:    *
* Uma pílula representada pelo grafo G pode ser Doturacu se,          *
* e somente se, G admite uma 3-coloração de vértices.                 *
# Desta forma, a não existência de uma 3-coloração de vértices em G   *
implica que a pílula seja Dotutama e a existência de uma implica que  *
a pílula pode ser Doturacu ou Dotutama.                               *
# Sendo assim, o código aqui apresentado executa duas tarefas:        *
1. dada uma entrada válida, constrói um grafo G que representa a      *
pílula inserida.                                                      *
2. estima a existencia de uma 3-coloração de vértices                 *
2*. verifica se G possui uma 3-coloração de vértices através do       *
algoritmo de Beigel e Eppstein [2].                                   *
# Para a corretude deste código, seria necessário substituir 2 po 2*. *
referências bibliográficas:                                           *
[1]Cormen, Thomas H., et al. Introduction to algorithms. MIT press.   *
[2]Lima, Alane M. "Algoritmos exatos para o problema da coloração de  *
grafos".                                                              *
**********************************************************************/

#include <stdio.h>
#include <stdlib.h>
#include <math.h>
//#include <vector>
//#include <queue>

// struct to represent one object of the adjacency list of a vertex
typedef struct adjacency
{
int vert;
struct adjacency *next;
}adjacency;

// struct to represent a vertex of a graph with adjacency list representation
typedef struct
{
int key;
adjacency *adj;
}vertex;


// function to process the input and create the graph
vertex* process(void){
	int nE, nV, v1, v2;
	scanf("%d %d", &nV, &nE);
	vertex *G;
	G = (vertex *)malloc(nV * sizeof(vertex));
	int i = 0;
	// set a vector of all vertices in G
	for(i = 0; i < nV; i++){
		G[i].key = i + 1;
		G[i].adj = NULL;
	}
	// build the adjacency list for all vertices in G
	for(int i = 0; i < nE; i++){
		scanf("%d %d", &v1, &v2);
		adjacency *node1 = malloc(sizeof(adjacency));
		adjacency *node2 = malloc(sizeof(adjacency));
		// check if vector is 0 based
		node1->vert = v2;
		node2->vert = v1;
		node1->next = G[v1-1].adj;
		G[v1-1].adj = node1;
		node2->next = G[v2-1].adj;
		G[v2-1].adj = node2;
	}
	return G;
}

int answer(vertex *G){
	int i, nV, nE;
	nV = sizeof(G)/sizeof(vertex);
	for(i = 0; i < nV; i++){
		adjacency *aux = G[i].adj;
	    while(aux){
	    	nE++;
	        aux=aux->next;
	    }
	}
	int estimate = nV / 4;
	estimate = pow(4, estimate);
	if(nE > estimate){
		return 1;
	}
	return 0;
}

// main function
int main(void){
	vertex *G;
	// call function to process the input and create the graph
	G = process();
	/* call function to determine if:
	the graph represents a compound that contains poison
	and print the answer */
	if (answer(G)){
		printf("dotutama\n");
	}else{
		printf("doturacu ou dotutama\n");
	}
	return 0;
}