./scripts/basis.sh
cc="--test-loc ../CodeContest_data_split/test.json" # specify the location of CodeContests test set
qwen="--load Qwen/Qwen2.5-Coder-1.5B-Instruct"
extra='--alg bs --num-beams 5'

# beam search is much faster than the other algorithms, so we can call synthesis_exp.py once to run all problems in a dataset

# run on APPS
start=0
end=5000
$submit python synthesis_exp.py -s $start -e $end --prefix "qwen-" $extra $qwen

# run on CodeContests
start=0
end=165
$submit python synthesis_exp.py -s $start -e $end --save "cc_results" --prefix "qwen-" $extra $cc $qwen
