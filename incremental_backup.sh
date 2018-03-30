#!/bin/bash
# This script creates incremental backups and makes a full backup every week.
# CONFIG

backupFrom="/home/alufers"
weekFolder="/media/alufers/toshiba_1tb/BackupsUbuntu/incrementals_`date +"%V_%Y"`"
checkDrive="/media/alufers/toshiba_1tb"
weekJournal="$weekFolder/journal.txt"

# END CONFIG

if [ ! -d $checkDrive ]
then
    echo "$weekJournal does not exist please plug in the drive"
    exit 1
fi

mkdir -p $weekFolder

if [ ! -f "$weekJournal" ] 
then
    echo "Creating journal at $weekJournal"
    echo "# Backup journal for week `date +"%V %Y"`" > "$weekJournal"
    echo "Created by incremental_backup.sh" >> "$weekJournal"
    echo "---" >> "$weekJournal"
fi


number=0

while compgen -G "$weekFolder/$suffix*" > /dev/null; do
    (( ++number ))
    suffix="$( printf -- '%02d' "$number" )"
done


backupName="$weekFolder/$suffix-`date +"%d_%m_%Y_%H_%M"`.tar.gz"
echo "Creating backup at $backupName"


find $backupFrom -type f -not -path "*/\.*" -not -path "*/node_modules/*" | tar --listed-incremental $weekFolder/last.snar -czpf $backupName -T -

echo "Created $backupName on `date +"+"%H_%M_%d_%m_%Y""`" >> "$weekJournal"
echo "Updated $weekFolder/last.snar on `date +"+"%H_%M_%d_%m_%Y""`" >> "$weekJournal"

echo "====DONE===="
