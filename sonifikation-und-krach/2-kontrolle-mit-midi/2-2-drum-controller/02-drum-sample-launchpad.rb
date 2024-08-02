########################################
# Drum Sample - Launchpad              #
########################################
# Einfaches Drumpad
# Verbesserung:
# Bei NoteOn mit Velocity Null keinen 
# Sound erzeugen

samples = (sample_names :drum)

live_loop :midi_note_on do

  # Echtzeit
  use_real_time
  
  # Mit note_on events synchronisieren
  note, velocity = sync "/midi:*:*/note_on"

  # Sample nur starten wenn Velocity > 0 ist
  if velocity > 0
    sample samples[note], amp: velocity / 127.0
  end

end