# Creates a design library
vlib work

# Defines a mapping between a logical library name and a directory
vmap work ./work

# Compiles Verilog design units and SystemVerilog extensions
vlog CRC.v
vlog -work work tb_CRC.v

# Loads a new design into the simulator
vsim -gui -novopt work.tb_CRC

# Specify command(s) to be executed when a running script encounters an error
# Options:quit -f; break; add wave b; etc.
onerror {resume}

# Create pane
quietly WaveActivateNextPane {} 0

# add wave to windows
# -noupdate: Prevents the Wave window from updating when a series of add wave commands are executed in series.
# logic: Logic signals may be U, X, 0, 1, Z, W, L, H, or ‘-’.
# literal: Literal waveforms are displayed as a box containing the object value.
add wave -position insertpoint sim:/tb_CRC/*
add wave -position insertpoint  \
sim:/tb_CRC/dut/temp_din
add wave -position insertpoint  \
sim:/tb_CRC/dut/temp_1

# Wave configuration
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 fs} 0}
WaveRestoreZoom {0 fs} {200 ns}
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -signalnamewidth 0
configure wave -justifyvalue left
configure wave -timeline 0
configure wave -timelineunits ns
update

run 100ns
