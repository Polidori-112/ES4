PROGRAM_NAME=top
echo "Building with ${PROGRAM_NAME}"

# Clean
rm *.json *.asc *.bin *.cf
set -ex
# Simulate
ghdl -a --std=08 *.vhdl
# Synthesize (and generate outputs for SVG render)
yosys -p "ghdl --std=08 ${PROGRAM_NAME}; synth_ice40 -json ${PROGRAM_NAME}.json"

# Route, generate, and flash
nextpnr-ice40 --pcf-allow-unconstrained --ignore-loops --up5k --package sg48 --pcf pins.pcf --json "${PROGRAM_NAME}.json" --asc "${PROGRAM_NAME}.asc"
icepack "${PROGRAM_NAME}.asc" "${PROGRAM_NAME}.bin"
sudo /home/polidori/.local/FPGA/bin/iceprog "${PROGRAM_NAME}.bin"
