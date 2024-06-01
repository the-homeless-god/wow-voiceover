for f in *.mp3; do mv -- "$f" "${f%.mp3}.wav"; done
for f in *.mp3; do ffmpeg -i "$f" -n -c:a libvorbis -q 0 -vbr on -compression_level 10 -frame_duration 60 -application voip "${f%.*}.ogg"; done

mv ./AI_VoiceOverData_Vanilla/generated/sounds/quests/*.ogg AI_VoiceOverData_Vanilla_OGG/generated/sounds/quests
mv ./AI_VoiceOverData_Vanilla/generated/sounds/gossip/*.ogg AI_VoiceOverData_Vanilla_OGG/generated/sounds/gossip
