cd ../translator/assets/wow-classic-ru/AI_VoiceOverData_Vanilla/generated/sounds/gossip
for f in *.mp3; do mv -- "$f" "${f%.mp3}.wav"; done && for f in *.wav; do ffmpeg -i "$f" -vn -ar 44100 -ac 2 -b:a 192k "${f%.*}.mp3"; done
for f in *.mp3; do ffmpeg -i "$f" -n -c:a libvorbis -q 0 -vbr on -compression_level 10 -frame_duration 60 -application voip "${f%.*}.ogg"; done

cd ../quests
for f in *.mp3; do mv -- "$f" "${f%.mp3}.wav"; done && for f in *.wav; do ffmpeg -i "$f" -vn -ar 44100 -ac 2 -b:a 192k "${f%.*}.mp3"; done
for f in *.mp3; do ffmpeg -i "$f" -n -c:a libvorbis -q 0 -vbr on -compression_level 10 -frame_duration 60 -application voip "${f%.*}.ogg"; done

cd ../../../../../../../

python cli-main.py gen_lookup_tables --lang=ruRU

cd ./translator/assets/wow-classic-ru/

mv ./AI_VoiceOverData_Vanilla/generated/sounds/quests/*.ogg AI_VoiceOverData_Vanilla_OGG/generated/sounds/quests
mv ./AI_VoiceOverData_Vanilla/generated/sounds/gossip/*.ogg AI_VoiceOverData_Vanilla_OGG/generated/sounds/gossip
rm -rf ./**/*.wav

git checkout ./AI_VoiceOverData_Vanilla/generated/sounds/gossip
git checkout ./AI_VoiceOverData_Vanilla/generated/sounds/quests

zip -r AI_VoiceOverData_Vanilla-RU.zip AI_VoiceOverData_Vanilla_OGG
