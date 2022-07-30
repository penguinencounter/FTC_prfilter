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
        *) echo "$j ain't it" ;;
    esac
    count=${#target}
    if [[ count -gt 0 ]]; then
        echo "diff origin/$target"
        echo "$(git diff origin/$target HEAD -- TeamCode)"
        break
    fi
done