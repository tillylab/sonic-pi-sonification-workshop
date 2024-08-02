########################################
# Keyboard Synth - Simple              #
########################################
# Einfaches Klavier ohne Anschlagsdynamik

live_loop :midi_piano do
  note, velocity = sync "/midi:*:*/note_on"
  synth :piano, note: note
end