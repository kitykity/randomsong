# randomsong.bash by Susan Pitman
# randomize mp3 songs by changing
# their filenames to random numbers.
# 7/28/2014 Script created.
# susan.a.pitman@gmail.com

find . -name "*.mp3" > songlist
find . -name "*.MP3" >> songlist

mkdir output 2>/dev/null
printf "New Song Titles... File Created on `date`\n\n" > output/00000_songlist
printf "New Name \tOld Name\n" >> output/00000_songlist
while read SONG ; do
  NEWNAME=`printf "%05d\n" $RANDOM`
  SONGNAME=`echo "${SONG}" | awk -F/ '{print $NF}'`
  printf "."
  while [ -f "output/${NEWNAME}.mp3" ] ; do
    printf "!"
    NEWNUM=`expr ${NEWNAME} + 1`
    NEWNAME=`printf "%05d\n" ${NEWNUM}`
  done
  printf "${NEWNAME}.mp3 \t${SONGNAME}\n" >> output/00000_songlist
  touch output/${NEWNAME}.mp3
done < songlist
rm songlist

