import numpy as np
import pandas as pd
from sklearn.tree import DecisionTreeClassifier, export_graphviz

import pokemonData

def main():
    pokemon_data = pokemonData.get_pokemon_data(True)

if __name__ == "__main__":
    main()
