./scripts/basis.sh
qwen="--load Qwen/Qwen2.5-Coder-1.5B-Instruct"
extra0='--alg bs --num-beams 5 --prefix bs-8-qwen-10-'
extra1='--alg mcts --rollout 24 --max-sample-times 8 --prefix mcts-8-qwen-10-' # rollout >> max sample times for this test
extra2='--alg sample --num-samples 8 --max-sample-times 8 --prefix sample-8-qwen-10-'

# run on APPS
start=4000
end=4010
$submit python synthesis_exp.py -s $start -e $end $extra0 $qwen
$submit python synthesis_exp.py -s $start -e $end $extra1 $qwen
$submit python synthesis_exp.py -s $start -e $end $extra2 $qwen
