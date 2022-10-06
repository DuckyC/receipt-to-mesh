#!/bin/bash

docker build -t blender-receipts .
docker run -it --rm\
    -v $(pwd)/renders:/blender/renders\
    blender-receipts\
    --output /blender/renders\
    $@
