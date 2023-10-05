#!/bin/bash

# Set the file name
TGZ_FILE="oss-cad-suite-linux-x64-20231004.tgz"

# Set the destination directory
DEST_DIR="$HOME/local/fpga-toolchain/"

# Check if the .tgz file exists
if [[ -f $TGZ_FILE ]]; then
    # Check if destination directory exists, if not, create it
    if [[ ! -d $DEST_DIR ]]; then
        mkdir -p $DEST_DIR
    fi

    # Extract the .tgz file to the destination directory
    tar -xzf $TGZ_FILE -C $DEST_DIR

    echo "Extraction complete!"
else
    echo "Error: $TGZ_FILE not found."
    #exit 1
fi

echo '# set the environment variable for VHDL toolchain' >> ~/.bashrc

echo 'export PATH="~/local/fpga-toolchain/oss-cad-suite/bin:$PATH"' >> ~/.bashrc
echo 'export GHDL_PREFIX=~/local/fpga-toolchain/oss-cad-suite/lib/ghdl' >> ~/.bashrc
