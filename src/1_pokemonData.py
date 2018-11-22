import argparse

import numpy as np
import pandas as pd

def get_args():
    parser = argparse.ArgumentParser()
    parser.add_argument('file_path', help='Data file path')
    parser.add_argument('output_file_path', help='Output file path')
    parser.add_argument('--with_extra_features', help='Include additional features in clean data')
    args = parser.parse_args()

    return args.file_path, args.output_file_path, args.with_extra_features

def get_data(file_path):
    data = pd.read_csv(file_path)
    print(data.head(10))

    return data

#TODO: Add permutations of all stats 7! options in case we have poor accuracy... should be programmatic
def add_features_pokemon_data(data):
    print("Not implemented")
    return data

def write_clean_pokemon_data(pokemon_data_file_path, pokemon_data_output_file_path, with_extra_features):
    pokemon_data = get_data(pokemon_data_file_path)
    pokemon_data = pokemon_data.drop(["Generation", "Total"], axis=1);

    if with_extra_features:
        pokemon_data = add_features_pokemon_data(pokemon_data)

    pokemon_data.to_csv(pokemon_data_output_file_path)

if __name__ == "__main__":
    pokemon_data_file_path, pokemon_data_output_file_path, with_extra_features = get_args()
    print("args:[file_path:",pokemon_data_file_path, "output_file_path:", pokemon_data_output_file_path, "with_extra_features:", with_extra_features,"]")

    write_clean_pokemon_data(pokemon_data_file_path, pokemon_data_output_file_path, with_extra_features)
