search_dir="audio/input"
output_dir="audio/output"
for entry in `ls $search_dir`; do
	out_dir=`echo $output_dir/$entry`
	`mkdir -p $out_dir`
	subdir=`echo $search_dir/$entry`
	for fileentry in `ls $subdir`; do
		outfile=`echo "$out_dir/${fileentry%.*}.amr"`
		infile=`echo $subdir/$fileentry`
		echo $infile
		`bin/ffmpeg -y -i $infile -ar 16000 -ab 19.85k -ac 1  -loglevel quiet -stats -acodec libvo_amrwbenc $outfile`
	
	done
done
