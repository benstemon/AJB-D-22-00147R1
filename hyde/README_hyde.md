## HyDe analysis
In this directory there are two subdirectories:
* [infiles](infiles/)
	* `allseqs_min25.phy`: The input phylip file.
	* `popmap_allseqs_min25.txt`: The population map, matching sequence ID to population ID.
	* `run_new_hyde_tests.sh`: The bash script used to run HyDe.
	* `triplets.txt`: The triplets tested in HyDe.
* [outfiles](outfiles/)
	* `allseq_full-out-filtered.txt`: The significant HyDe results for full analysis.
	* `allseq_full-out.txt`: All HyDe results for full analysis.
	* `allseq_ind-ind.txt`: HyDe results for individual analysis.

## HyDe commands
To run HyDe, after installation, use this command:
`bash run_new_hyde_tests.sh`

