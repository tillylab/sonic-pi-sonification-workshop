########################################
# Drum Sample - Simple                 #
########################################
# Einfaches Drumpad

# Liste aller Drum-Samples
samples = (sample_names :drum)

live_loop :midi_drums do

  # Mit note_on events synchronisieren
  note, velocity = sync "/midi:*:*/note_on"

  # Sample abspielen
  sample samples[note]

end