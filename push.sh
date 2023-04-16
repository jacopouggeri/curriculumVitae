# Push and commit to overleaf and github
echo "\n"
echo "< ---- STARTED PUSH AND COMMIT ROUTINE ---- >"

# Build PNG files for README.md if flag is passed
if [[ "$1" == "-p" ]]; then
    pdftopng_flag=true
else
    pdftopng_flag=false
fi

if $pdftopng_flag; then
    echo "\n"
    echo "< ---- CONVERTING TO PNG ---- >"
    ./pdftopng.sh command here
    git add png
    git add README.md
fi

echo "\n"
echo "< ---- COMMIT ---- >"
git commit -a -m "Modified files"
echo "\n"
echo "< ---- PUSH ---- >"
git push all