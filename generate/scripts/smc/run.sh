cc="--test-loc ../CodeContest_data_split/test.json"
qwen="-l Qwen/Qwen2.5-Coder-1.5B-Instruct"

extra="--pop-size 200"

# run on APPS
start=0
end=5000
./scripts/run_smc.sh $start $end "smc-200-qwen-" "results" "$extra $qwen"

# run on CodeContests
start=0
end=165
./scripts/run_smc.sh $start $end "smc-200-qwen" "cc_results" "$extra $cc$qwen"
