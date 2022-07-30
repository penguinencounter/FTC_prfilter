a="'as/df'"
chopped=$(echo $a | cut -d "'" -f 2)
IFS="/"
arr=($b)
unset IFS
echo ${arr[0]}