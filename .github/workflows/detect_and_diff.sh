#! /bin/bash
git for-each-ref --shell --format='%(refname)' refs/remotes/ | while read ref; do
    chopped=$(echo $ref | rev | cut -d "'" -f 2)
    IFS="/"
    choparr=($chopped)
    unset IFS
    for i in $choparr; do j=$(echo $i | rev); done  # this is so janky lol
    case "$j" in
        main) target="main" ;;
        master) target="master" ;;
        *) ;;
    esac
    count=${#target}
    if [[ count -gt 0 ]]; then
        if [ "$(git diff origin/$target HEAD -- TeamCode)" ]; then
            echo changed
        fi
        break
    fi
done