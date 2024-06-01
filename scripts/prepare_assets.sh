#!/bin/bash

echo "Starting to copy assets for en-US translation"
wget https://github.com/mrthinger/wow-voiceover/releases/download/v1.3.1/AI_VoiceOverData_Vanilla-v1.0.0.zip

unzip AI_VoiceOverData_Vanilla-v1.0.0.zip
cp -r AI_VoiceOverData_Vanilla-v1.0.0/ ../translator/assets/wow-classic-en/AI_VoiceOverData_Vanilla/
rm -rf AI_VoiceOverData_Vanilla-v1.0.0
