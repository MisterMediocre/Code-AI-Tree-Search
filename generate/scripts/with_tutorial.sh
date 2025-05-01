./scripts/basis.sh
qwen="--load Qwen/Qwen2.5-Coder-1.5B-Instruct"
extra='--alg bs --num-beams 5'
tutorials="--indices scripts/tutorials.json"
peek_tutorials="--peek-tutorial"
prefix="--prefix bs_tutorials_"

# run on APPS
$submit python synthesis_exp.py $tutorials $peek-tutorial $prefix $extra $qwen

