clear
search_dir="audio/input"
output_dir="audio/output"
echo 'Deleting and recreating output folder'
echo '.'
echo '.'
`rm -rf $output_dir`

ls $search_dir | while read entry; do
	echo "Converting files in $entry"
	out_dir=`echo "$output_dir/$entry"`
	`mkdir -p $out_dir`
	subdir=`echo "$search_dir/$entry"`
	ls $subdir | while read fileentry; do
		echo '.'
		echo $fileentry
		outfile=`echo "$out_dir/$(basename "$fileentry" | sed 's/\(.*\)\..*/\1/').amr"`
		echo $outfile
		infile=`echo $subdir/"$fileentry"`
		echo $infile
		`bin/ffmpeg -y -i "$infile" -ar 16000 -ab 19.85k -ac 1  -loglevel quiet -stats -acodec libvo_amrwbenc "$outfile"`
		outfile=""	
	done
	echo '.'
i	echo '.'
done
