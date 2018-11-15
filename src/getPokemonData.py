import sys

import numpy as np
import pandas as pd
from sklearn.tree import DecisionTreeClassifier, export_graphviz

if len(sys.argv) != 2:
    print("ERROR: Incorrect number of parameters\nUsage:", "python", sys.argv[0], "<path/to/Pokemon.csv>")
    exit(1)

pokemon_data_file_path = sys.argv[1]
pokemon_data = pd.read_csv(pokemon_data_file_path)
print(pokemon_data.head(10))
