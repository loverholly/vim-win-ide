#!/bin/bash

touchempty() {
    find ${1:-.} -mindepth 1 -maxdepth 1 -type d | while read -r dir; do
        if [[ -z "$(find "$dir" -mindepth 1 -type f)" ]] >/dev/null; then
            touch $dir/.gitignore && echo "create .gitignore in $dir"
        fi
        if [ -d ${dir} ]; then
            touchempty "$dir"
        fi
    done
}

touchempty

exit 0
