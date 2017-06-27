#!/bin/bash
# workspace_git.sh

while true;
do
	git pull origin periodic
	if [ -z $(git status --s) ];
	then
		echo "Nothing to do here."
	else
		git add --all
		git commit -m "$(date)"
		git push origin periodic
	fi
	
	echo "Updated at: "
	date
	sleep 300
done
