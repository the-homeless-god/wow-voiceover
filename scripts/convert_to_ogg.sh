for f in *.mp3; do mv -- "$f" "${f%.mp3}.wav"; done
for f in *.wav; do ffmpeg -i "$f" -y -n -c:a libvorbis -vbr on -compression_level 10 -frame_duration 60 -application voip "${f%.*}.ogg"; done
