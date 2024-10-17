# Importare la libreria networkx per creare e gestire grafi
import networkx as nx 

# Creare un grafo
G = nx.Graph()

# Aggiungere un nodo
G.add_node([a])

# Aggiungere piu nodi
G.add_nodes_from([b,c])  

# Puoi aggiungere delle caratteristiche nel seguente modo 
# G.add_nodes_from([(b,{"color" : "red"})])

