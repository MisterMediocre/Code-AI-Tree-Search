qwen="--load Qwen/Qwen2.5-Coder-1.5B-Instruct"
tutorials="--indices scripts/tutorials.json"


# run on APPS, problems with tutorials attached

# bs
bs_extra="--alg bs --num-beams 5 --horizon 2048"
bs_prefix="--prefix bs_"

python synthesis_exp.py $tutorials $prefix $bs_extra $qwen $bs_prefix


# sample
sample_extra="--alg sample --num-samples 50 --horizon 2048"
sample_prefix="--prefix sample_"
python synthesis_exp.py $tutorials $prefix $sample_extra $qwen $sample_prefix

# MCTS
mcts_extra="--alg mcts --rollout 500 --horizon 2048 --max-sample-times 50"
mcts_prefix="--prefix mcts_"
python synthesis_exp.py $tutorials $prefix $mcts_extra $qwen $mcts_prefix
