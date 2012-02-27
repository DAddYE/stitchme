all:
	mkdir -p ./bin
	echo "#!/usr/bin/env node" > ./bin/stitchme
	coffee -p ./src/stitchme.coffee >> ./bin/stitchme && chmod 755 ./bin/stitchme
