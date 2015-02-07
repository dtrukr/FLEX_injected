mkdir temp
find FLEX -type f -name \*.h -exec cp \{\} temp \;
find FLEX -type f -name \*.m -exec cp \{\} temp \;
make package
