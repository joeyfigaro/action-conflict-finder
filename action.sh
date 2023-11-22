#!/bin/bash -l
set -eu

grepExit () {
	# grep returns 1 if pattern is not found, > 1 is an error
	if [ $1 -eq 1 ]; then
		printf "\033[0;32mNo conflict markers found.\033[0m\n"
		exit 0;
	fi
	printf "\033[1;31mGrep Error.\033[0m\n"
	exit 1;
}

# EXCLUDE=(${INPUT_EXCLUDES/,/ })
# EXCLUDE_DIR=(${INPUT_EXCLUDE_DIR/,/ })
INCLUDE=(${INPUT_INCLUDES/,/ })
INCLUDE_DIR=(${INPUT_INCLUDE_DIR/,/ })

CONFLICTS="$(grep -lr -r --exclude-dir=.git "${INCLUDE_DIR[@]/#/--include-dir=}" "${INCLUDE[@]/#/--include=}" -E -- '^<<<<<<<|^>>>>>>>' .)" || grepExit $?

printf "\033[1;31mFound conflict markers.\033[0m\n"

for file in "$CONFLICTS"
do
	echo "::error file="$file"::Conflict markers found in $file"
done

exit 1;
