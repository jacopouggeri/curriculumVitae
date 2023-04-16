mkdir -p png/  # create the png/ directory if it does not already exist
for pdfile in curriculum_vitae.pdf ; do
    convert -verbose -density 500 -background white -alpha remove -alpha off "${pdfile}" "png/${pdfile%.*}".png
done
git add png