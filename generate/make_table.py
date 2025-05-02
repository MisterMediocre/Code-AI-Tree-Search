import json, os

average = lambda arr: sum(arr)/len(arr)

SCORE_KEY = "rewards"   #what in the json is the right number
SCORE_REDUCE = max      #how to turn array into single number
PROBLEMS = [2, 112, 115, 124, 141, 149, 178, 182, 184, 4036]
ALGORITHMS = ['sample', 'sample_tutorials', 'bs', 'bs_tutorials', 'mcts', 'mcts_tutorials']
ALG_TABLE_NAMES = { #note that there are "category headers" indicating with/without tutorial
    "sample": "Sampling",
    "sample_tutorials": "Sampling+",
    "bs": "Beam Search",
    "bs_tutorials": "Beam Search+",
    "mcts": "Monte Carlo",
    "mcts_tutorials": "Monte Carlo+"
}

#read in all the data from files:
results = dict()
for filename in os.listdir("results"):
    if not filename.endswith(".json"):
        continue
    try:
        with open(f"results/{filename}") as f:
            data = json.load(f)
        problem_num = int(filename[:-5].split("_")[-1])
        algorithm = "_".join(filename[:-5].split("_")[:-1])
        
        results[(problem_num, algorithm)] = SCORE_REDUCE(data[SCORE_KEY])
    except Exception as ex:
        print(f"Problem on filename: {filename}")
        print(ex)

latex = []
latex.append(r"\begin{tabular}{|c|cc|cc|cc|}")
latex.append(r"\hline")
#latex.append(r"& \multicolumn{3}{c|}{Base Algorithm} & \multicolumn{3}{c}{With Tutorial} \\")
latex.append("Problem & " + " & ".join(ALG_TABLE_NAMES[a] for a in ALGORITHMS) + r"\\")
latex.append(r"\hline")
for prob in PROBLEMS:
    scores = [results[(prob,a)] for a in ALGORITHMS]
    latex.append(str(prob) + " & " + " & ".join(f"{s:.2f}" for s in scores) + r"\\")
latex.append(r"\hline")
latex.append(r"\end{tabular}")

print("\n".join(latex))
