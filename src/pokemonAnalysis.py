import numpy as np
import pandas as pd
from sklearn.tree import DecisionTreeClassifier, export_graphviz

import pokemonData

def main():
    pokemon_data = pd.read_csv(pokemonData.getFilePathFromCMD())
    print(pokemon_data.head(10))

if __name__ == "__main__":
    main()
