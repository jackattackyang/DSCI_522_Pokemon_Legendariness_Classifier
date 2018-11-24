import numpy as np
import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt
import argparse

from sklearn.neighbors import KNeighborsClassifier

from sklearn.tree import DecisionTreeClassifier, export_graphviz
from sklearn.model_selection import train_test_split
from sklearn.model_selection import cross_val_score

def get_args():
    parser = argparse.ArgumentParser()
    parser.add_argument('file_path', help='Data file path')
    parser.add_argument('output_file_path', help='Output file path')
    args = parser.parse_args()

    return args.file_path, args.output_file_path

def main():
    # Set random state
    rstate = 1263

    # Get command line arguments
    pokemon_data_file_path, pokemon_data_output_file_path = get_args()

    # Load data
    pokemon_data = pd.read_csv(pokemon_data_file_path)
    pokemon_data = pd.get_dummies(pokemon_data, columns=["Type 1", "Type 2"])

    # Separate features and target
    features = pokemon_data.loc[:, "HP":"Type 2_Water"]
    features = features.drop(["Legendary"], axis=1);

    target = pokemon_data.loc[:, ["Legendary"]]

    # Calculate best hyper parameter (max_depth) for DecisionTreeClassifier
    depths = []
    scores_train = []
    scores_test = []

    for depth in range(1, 10):
        tree = DecisionTreeClassifier(max_depth = depth, random_state=rstate)
        #tree = KNeighborsClassifier(n_neighbors = depth)
        tree.fit(features, target)

        depths.append(depth)
        #scores_train.append(np.mean(cross_val_score(tree, X_train, y_train, cv=10)))
        scores_test.append(np.mean(cross_val_score(tree, features, target, cv=10)))

    depth_score_test_df = pd.DataFrame(scores_test, index=depths, columns=['score'])

    print(depth_score_test_df)

    # Read depth of highest score
    depth_of_max_test = depth_score_test_df.loc[depth_score_test_df['score'].idxmax()].name

    #print(depth_of_max_test)
    #print(depth_score_test_df.iloc[[depth_of_max_test]])

    # Fit with best hyper parameters
    bestTree = DecisionTreeClassifier(max_depth = depth_of_max_test, random_state=42)
    bestTree.fit(features, target)
    print("Testing score:\n", depth_score_test_df.iloc[[depth_of_max_test]])

    # Calculate most important features
    feature_importances = bestTree.feature_importances_
    importance_df = pd.DataFrame({"Feature": features.columns.values, "Importance": feature_importances})
    importance_df = importance_df.query("Importance > 0.01")
    importance_df = importance_df.sort_values(by="Importance", ascending=False)
    importance_df = importance_df.round(2)

    importance_df.to_csv(pokemon_data_output_file_path + ".csv")

    # Save importance bar graph
    plt.rcParams["figure.figsize"] = (15, 4)
    plt.rcParams["xtick.labelsize"] = 10
    importance_plot = sns.barplot(data=importance_df, x="Feature", y="Importance")
    importance_plot_fig = importance_plot.get_figure()
    importance_plot_fig.savefig(pokemon_data_output_file_path + "_plot.png")


if __name__ == "__main__":
    main()
