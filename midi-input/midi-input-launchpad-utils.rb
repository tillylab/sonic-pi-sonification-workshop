########################################
# Midi Input - Launchpad Utils         #
########################################
# Helper for  Novation Launchpad Mini mk3

# MIDI output port
launchpad_in = "launchpad_mini_mk3_lpminimk3_midi_in"

# activate programmer mode
define :set_programmer_mode do
  midi_sysex 0xf0, 0x00, 0x20, 0x29, 0x02, 0x0D, 0x0E, 0x01, 0xf7, port: launchpad_in
end

# compute pad index
# bottom left is (0, 0)
define :pad_index do |note|
  col = note / 10 - 1
  row = note % 10 - 1
  index = 8 * row + col
  [ index, col, row ]
end

set_programmer_mode