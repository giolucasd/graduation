"""
Paradigmas de Programacao - Projeto 3

Giovanne RA173317
"""

import sys
from enum import Enum
from math import inf
from typing import List, Optional, Tuple

readline = sys.stdin.readline


class Mode(Enum):
    """An Enum for allowed edge 'weight' modes."""
    DISTANCE = 0
    TRAVEL_TIME = 1


class Edge:
    """
    The representation of a graph edge.

    Args:
        origin: the origin vertex of the edge.
        destiny: the destiny vertex of the edge.
        distance: the distance, in km, between the two vertices.
        max_speed: the maximum speed, in km/h, allowed to travel from the origin
            to the destiny.

    Attributes:
        origin: the origin vertex of the edge.
        destiny: the destiny vertex of the edge.
        distance: the distance, in km, between the two vertices.
        travel_time: the travel time, in minutes, to travel from the origin to
            the destiny.
        mode: 'weight' mode that indicates if distance or travel time should be
            used.
    """

    def __init__(
        self,
        origin: 'Vertex', destiny: 'Vertex', distance: float, max_speed: float
    ):
        self.origin = origin
        self.destiny = destiny
        self.distance = distance
        self.update_speed(max_speed)
        self.mode = Mode.DISTANCE

        origin.edges.append(self)
        origin.adjacency.append(destiny)

    def update_speed(self, new_max_speed: float):
        """Updates the travel time based on the new maximum speed."""
        if new_max_speed:
            self.travel_time = 60 * (self.distance / new_max_speed)
        else:
            self.travel_time = inf


def weight(edge: Edge) -> float:
    """Returns the distance or travel time from origin to destiny."""
    return edge.distance if edge.mode is Mode.DISTANCE else edge.travel_time


class Vertex:
    """
    The representation of a graph vertex.

    Stores information for path searches in graphs.

    Args:
        name: the identifier of the vertex.

    Attributes:
        name: the identifier of the vertex.
        edges: a list of the edges in which the vertex is the origin.
        adjacency: a list of the adjacent vertices.
    """

    def __init__(self, name: str):
        self.name = name
        self.edges = list()
        self.adjacency = list()

        self.source_weight_sum = inf
        self.previous = None

    def weight_to(self, vertex: 'Vertex') -> float:
        """Returns the distance or travel time from self to the given vertex."""
        for edge in self.edges:
            if edge.destiny is vertex:
                return weight(edge)
        return inf


def source_weight_sum(destiny: Vertex) -> float:
    """Returns the current distance or travel time from source to vertex."""
    return destiny.source_weight_sum


class VertexPriorityQueue:
    """
    The representation of a minimum priority queue for vertex.

    Compares based on the distance from the source.
    """

    def __init__(self):
        self.queue = list()

    def insert(self, vertex: Vertex):
        """Insert the given vertex into the priority queue."""
        self.queue.append(vertex)

    def pop(self) -> Edge:
        """Returns the lowest travel time vertex to the origin in the queue."""
        self.queue.sort(key=source_weight_sum, reverse=True)
        return self.queue.pop()


class Graph:
    """
    The representation of a graph.

    Args:
        edges: a list with all edges in the graph.

    Attributes:
        vertices: a list with all vertices in the graph.
        edges: a list with all edges in the graph.
    """

    def __init__(self, vertices: List[Vertex], edges: List[Edge]):
        self.vertices = vertices
        self.edges = edges

    def set_mode(self, mode: Mode):
        """Set the 'weight' mode to distance or travel time."""
        for edge in self.edges:
            edge.mode = mode


def shortest_path(graph: Graph, source: Vertex, target: Vertex, mode: Mode):
    """
    Dijkstra algorithm for finding the shortest paths between nodes in a graph.

    Args:
        graph: the directed weighted graph in which the shortest path from a
            sorce should be calculated.
        source: the vertex from which the shortest path should be calculated.
        target: the target vertex of the path.
        mode: the path weight mode. Can be either distance or travel time.
    """
    graph.set_mode(mode)

    remaining_vertices = VertexPriorityQueue()

    for vertex in graph.vertices:
        vertex.source_weight_sum = inf
        vertex.previous = None
        remaining_vertices.insert(vertex)

    source.source_weight_sum = 0

    while remaining_vertices.queue:
        current_vertex = remaining_vertices.pop()

        if current_vertex is target:
            break

        for neighbor in current_vertex.adjacency:
            weight_sum = (
                current_vertex.source_weight_sum
                + current_vertex.weight_to(neighbor)
            )
            if weight_sum < neighbor.source_weight_sum:
                neighbor.source_weight_sum = weight_sum
                neighbor.previous = current_vertex


def process_input() -> Tuple[Graph, Vertex, Vertex]:
    """
    Process input and retrieve the graph along the source and target vertices.
    """

    def read_graph_line(line: str) -> Tuple[str, str, float, Optional[float]]:
        """Read the origin, destiny, distance and, if exists, maximum speed."""
        literals = line.split(' ')
        literals.append(None)
        return literals[:4]

    def find_vertex_for_name(vertices: List[Vertex], name: str) -> Vertex:
        """Find the vertex object for the given name if in the given list."""
        for vertex in vertices:
            if vertex.name == name:
                return vertex

    def process_graph() -> Tuple[List[Vertex], List[Edge]]:
        """Read the input and build the graph relations."""

        def build_vertice(
            vertices: List[Vertex], vertices_names: List[str], vertex: str
        ) -> Vertex:
            """Get or create a vertex, append it on the given lists."""
            if vertex not in vertices_names:
                vertex = Vertex(vertex)
                vertices.append(vertex)
                vertices_names.append(vertex.name)
            else:
                vertex = find_vertex_for_name(vertices, vertex)

            return vertex

        vertices, vertices_names, edges = list(), list(), list()

        line = readline().strip('\n')
        while line:
            origin, destiny, distance, max_speed = read_graph_line(line)

            # There's always distance, but max_speed may not be defined
            # In the last case, should be assumed the default max_speed
            distance = float(distance)
            try:
                max_speed = float(max_speed)
            except (TypeError, ValueError):
                max_speed = default_max_speed

            # Build vertices
            origin = build_vertice(vertices, vertices_names, origin)
            destiny = build_vertice(vertices, vertices_names, destiny)

            # Build edge
            edge = Edge(origin, destiny, distance, max_speed)
            edges.append(edge)

            line = readline().strip('\n')

        return vertices, edges

    def update_edges() -> List[str]:
        """Read the input and update the edges traffic speeds."""
        line = readline().strip('\n')
        literals = line.split(' ')

        while len(literals) > 1:
            origin, destiny, new_max_speed = literals[:3]
            new_max_speed = float(new_max_speed)

            # find the edge
            for edge in edges:
                if edge.origin.name == origin and edge.destiny.name == destiny:
                    edge.update_speed(new_max_speed)
                    break

            line = readline().strip('\n')
            literals = line.split(' ')

        return literals[0]

    # The first line is the default max_speed
    default_max_speed = float(readline().strip('\n'))

    # The following lines, until white line, describes the graph structure
    vertices, edges = process_graph()

    # The following lines, until single vertex name, describes the updated
    # traffic speeds
    # Finally, the last two lines determine the source and the target vertices
    source = update_edges()
    source = find_vertex_for_name(vertices, source)

    line = readline().strip('\n')
    target = line.split(' ')[0]
    target = find_vertex_for_name(vertices, target)

    graph = Graph(vertices, edges)

    return graph, source, target


NO_PATH_STR = 'Nao existe caminho'


def print_shortest_path(target: Vertex):
    """
    Print the shortest path total distance and the route between the source and
    the target vertices.
    """
    if target.source_weight_sum is inf:
        print(NO_PATH_STR)
    else:
        print("{:.1f}".format(target.source_weight_sum))

        current = target
        while current.previous:
            print(current.name + ' ', end='')
            current = current.previous
        print(current.name)
        print()


def print_fastest_path(target: Vertex):
    """
    Print the fastest path total distance and the route between the source and
    the target vertices.
    """
    if target.source_weight_sum is inf:
        print(NO_PATH_STR)
    else:
        print("{:.0f}".format(target.source_weight_sum))

        current = target
        while current.previous:
            print(current.name + ' ', end='')
            current = current.previous
        print(current.name)


def project():
    """Main function."""
    graph, source, target = process_input()
    shortest_path(graph, source, target, Mode.DISTANCE)
    print_shortest_path(target)
    shortest_path(graph, source, target, Mode.TRAVEL_TIME)
    print_fastest_path(target)


if __name__ == "__main__":
    project()


#################################
# Reference project description #
#################################


# Projeto Python

# Data de entrega: 14/12 ate 23: 59

# Escreva um programa em Python que vai calcular o caminho mais rápido entre uma
# origem em um destino dado. O programa recebe um grafo direcionado e informação
# sobre a distancia e velocidade máxima na aresta, e recebe também informação
# sobre a velocidade real na áreas e deve calcular o cominho mais rápido
# (assumindo que o motorista andará na maior velocidade permitida em cada
# aresta) entre uma origem e um destino dados.

# Os dados tem a seguinte forma:

# 25.0
# a b 0.4
# a c 0.5 50.0
# b d 1.2
# b z 0.2
# z f 0.3 40.0

# a b 12.5
# a c 4.1
# b z 0
# a
# z

# A primeira linha indica a velocidade máxima default nas ruas da cidade, neste
# case, se não ha indicação de velocidade máxima na rua, assume-se que seja
# 25k/h

# As linhas seguintes são as arestas direcionadas que possuem 3 ou quatro
# valores. Os dois primeiros são os vértices. O terceiro valor é a distancia em
# quilômetros entre os vértices. Se houver um quarto valor ele é a velocidade
# máxima naquele trecho e naquele sentido. O fato da velocidade máxima entre a
# e c ser 50k/h não significa que ele seja a velocidade no sentido de c para a.
# Na verdade pode não haver uma aresta de c para a(ou seja esse trecho da rua é
# mão única).

# Ao final do grafo haverá uma linha sem dados. A partir deste ponto os dados
# indicam as velocidades atuais nas arestas. Neste momento a velocidade possível
# de a para b é só 12.5 k/h. Note que nem todas as arestas terão uma linha de
# atualização da sua velocidade real. Note também que algumas ruas podem ter
# velocidade máxima de 0k/h ou seja a rua esta fechada e aquela aresta
# temporariamente não existe.

# Finalmente haverá duas linhas com a origem(a) e o destino(z).

# Calcule

# o caminho mais curto entre origem destino e
# o caminho mais rápido entre a origem e o destino(assumindo que o motorista
# dirigirá na maior velocidade possível em cada segmento)

# Se:

#     se não houver caminho possível entre a origem e o destino imprima Nao
# existe caminho
#     para o caminho mais curto imprima o numero de kilometros(com uma casa
# decimal) deste caminho, e na próxima linha a sequencia de vértices, da origem
# ate o destino separados por um branco.
#     imprima uma linha em branco
#     para o caminho mais curto, imprima o tempo de transito em minutos(sem
# casas decimais), e na próxima linha a sequencia de vértices, da origem ate o
# destino separados por um branco.

# Por exemplo:

# 3.4
# a b d f g

# 18
# a b d e g z

# Que indica que o caminho mais curto tem 3.4 kilometros, e que o caminho mais
# rápido tera o tempo de transito de 18 minutos

# Seu programa será executado como

# python3 proj.py < dados.txt

# Ou seja, seu programa precisa ter as linhas no final:

# if __name__ == "__main__":
#     funcprincipa()

# que indica que o Python executará funcprincipal(use o nome que vc quiser) como
# a primeira chamada do programa.
# Restrições

# o programa nao pode usar modulos que nao estão na biblioteca padrão.
