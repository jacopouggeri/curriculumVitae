# Generate png images to display in README.md

mkdir -p png/  # create the png/ directory if it does not already exist

for pdfile in curriculum_vitae.pdf ; do
    convert -verbose -density 500 -background white -alpha remove -alpha off "${pdfile}" "png/${pdfile%.*}_${counter}.png"
    if ! grep -q "${pdfile%.*}_${counter}.png" README.md; then
        echo "- Added ${pdfile%.*}_${counter}.png"
    fi
    counter=$((counter+1))  # increment the counter variable
done

# create an array of PNG filenames
png_files=(png/curriculum_vitae-*.png)

# generate Markdown text for each PNG file
for ((i=0; i<${#png_files[@]}; i++)); do
    echo "![Page $((i+1))](${png_files[$i]})" >> README.md
done

git add png
git add README.md