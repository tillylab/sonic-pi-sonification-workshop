########################################
# Keyboard Synth - Velocity            #
########################################
# Einfaches Klavier mit Anschlagsdynamik

live_loop :midi_piano do
  use_real_time
  note, velocity = sync "/midi:*:*/note_on"
  synth :piano, note: note, amp: velocity / 127.0
end

