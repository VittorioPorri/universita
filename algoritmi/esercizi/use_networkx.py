import networkx as nx 

G = nx.Graph()

#nodes
G.add_node(1)                   #per aggiungere un singolo nodo
G.add_nodes_from([2,3,4,5])     #per aggiungere piu nodi contemporaneamente da un contenitore

#edges
G.add_edge(1,2)
e = (2,3)
G.add_edge(*e)                  # l' * separa e in "2", "3" 
G.add_edges_from([(1,4),(4,5)]) #per aggiungere piu edge contemporanemente da un contenitore

#Per visualizzare
print(list(G.nodes))
print(list(G.edges))
print(G.neighbors(1))           # elenco di nodi ragiungibili utilizzando un solo edge
print(G.degree[1])              # numero di archi incidenti su un nodo

#Per rimuovere node or edge
G.remove_node(5)
#G.remove_nodes_from([2,3,4,5]) 
G.remove_edge(4,5)
#G.remove_edges_from([(1,4),(4,5)]) 

#Come creare un grafo 

