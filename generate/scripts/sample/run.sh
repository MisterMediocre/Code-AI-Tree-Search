cc="--test-loc ../CodeContest_data_split/test.json"
neo="-l Qwen/Qwen2.5-Coder-1.5B-Instruct"

extra="--num-samples 512 --alg sample"

# run on APPS
start=0
end=5000
./scripts/run.sh $start $end "s-qwen-" "results" "$extra $qwen"

# run on CodeContests
start=0
end=165
./scripts/run.sh $start $end "s-qwen-" "cc_results" "$extra $cc $qwen"
