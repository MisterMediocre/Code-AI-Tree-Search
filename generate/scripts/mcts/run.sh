cc="--test-loc ../CodeContest_data_split/test.json" # specify the location of CodeContests test set
qwen="-l Qwen/Qwen2.5-Coder-1.5B"


rollout=5000 # maximum number of rollouts of tree search
extra="--rollout $rollout"

# run on APPS
start=0
end=5000
# use GPT-Neo
./scripts/run.sh $start $end "t-qwen-" "results" "$extra $qwen"

# run on CodeContests
start=0
end=165
./scripts/run.sh $start $end "t-qwen-" "cc_results" "$extra $cc $qwen"
