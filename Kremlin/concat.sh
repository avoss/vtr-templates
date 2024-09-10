LANGUAGES=ar-SA,cmn-CN,de-DE,es-ES,fr-FR,ja-JP,pt-BR

PART1=Part_1/Part_1
PART2=Part_2/Part_2
PART3=Part_3/Part_3

JOB_ID=$(basename $(pwd))

createFilesTxt() {
    language=$1
    echo "file '${PART1}_${language}.mp4'" > files.txt
    echo "file '${PART2}_${language}.mp4'" >> files.txt
    echo "file '${PART3}_${language}.mp4'" >> files.txt
}
# Use the 'IFS' (Internal Field Separator) to split by commas
IFS=',' read -r -a language_array <<< "$LANGUAGES"
# Iterate over the array
for language in "${language_array[@]}"; do
    echo "Processing $language"
    createFilesTxt $language
    ffmpeg -y -loglevel warning -f concat -safe 0 -i files.txt -c:v h264_nvenc -b:v 1500k "${JOB_ID}_${language}.mp4"
done