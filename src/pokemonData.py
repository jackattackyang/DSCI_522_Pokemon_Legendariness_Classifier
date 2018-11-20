import argparse

def getFilePathFromCMD():
    parser = argparse.ArgumentParser()
    parser.add_argument('file_path')
    args = parser.parse_args()

    pokemon_data_file_path = args.file_path

    if len(pokemon_data_file_path) <= 1:
        print("ERROR: File path not found.\nUsage:", "python pokemonAnalysis.py <path/to/Pokemon.csv>")
        exit(1)

    return pokemon_data_file_path
