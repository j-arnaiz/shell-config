backupFolder=$(date +%Y%m%d_%H%M%S)
mkdir $backupFolder
for (( i=0; i<${#files[*]}; i++)) do
  mv ~/.${files[${i}]} $backupFolder/ 2> /dev/null
done
