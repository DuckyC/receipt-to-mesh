#!/bin/bash
blender -b -noaudio\
    receipt.blend\
    -P receipts.py\
    -- $@
