########################################
# Drum Sample - NoteOff                #
########################################
# Verbessertes Drumpad mit Dämpfung.
# Bei NoteOn mit Velocity Null dämpfen

# Liste der Drumsamples
samples = sample_names :drum

# Verzeichnis der laufenden Samples
running = {}

live_loop :midi_note_on do
  
  # Echtzeit
  use_real_time
  
  # Mit note_on events synchronisieren
  note, velocity = sync "/midi:*:*/note_on"
  
  if velocity > 0
    # Sample starten und im Verzeichnis eintragen
    running[note] = sample samples[note], amp: velocity / 127.0, amp_slide: 0.1
  else
    # Sample stoppen
    control running[note], amp: 0
    running.delete(note)
  end
  
end
