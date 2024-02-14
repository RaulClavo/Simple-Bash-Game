if ! [[ $1 =~ ^[0-9]+$ && $2 =~ ^[0-9]+$ && -n "$3" && ! "$3" =~ [0-9] ]]; then
    echo "Error: Los dos primeros argumentos deben ser números enteros y el tercer argumento debe ser el nombre de tu mascota."
    exit 1
fi

mkdir -p RulsGame

for ((i = 1; i <= $2; i++)); do
    mkdir -p RulsGame/Folder_$i
    for ((j = 1; j <= $1; j++)); do
        mkdir -p RulsGame/Folder_$i/Subfolder_$j
    done
done

random_folder=$((1 + RANDOM % $2))
random_subfolder=$((1 + RANDOM % $1))

echo "Enorabuena has conseguido rescatar a $3" > RulsGame/Folder_$random_folder/Subfolder_$random_subfolder/Celda.txt

echo "Perfecto, he secuestrado a tu mascota, buscala dentro del directorio "RulsGame" "

for ((countdown = $1*$2+20; countdown > 0; countdown--)); do
    echo -ne "Borrando directorio en $countdown segundos, date prisa y recata a tu mascota antes de que se acabe el tiempo. \r"
    sleep 1
done

rm -r RulsGame
exit 1
