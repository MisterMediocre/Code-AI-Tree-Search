qwen="--load Qwen/Qwen2.5-Coder-1.5B-Instruct"
extra='--alg bs --num-beams 5'
tutorials="--indices scripts/tutorials.json"
prefix="--prefix bs_"

# run on APPS
python synthesis_exp.py $tutorials $prefix $extra $qwen

