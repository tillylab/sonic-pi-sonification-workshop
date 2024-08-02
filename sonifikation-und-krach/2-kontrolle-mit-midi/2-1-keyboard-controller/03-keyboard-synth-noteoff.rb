########################################
# Keyboard Synth - NoteOff             #
########################################
# Klavier mit Anschlagsdynamik und Dämpfung

# Verzeichnis der laufenden Synths
playing_synths = {}

live_loop :midi_piano do
  use_real_time
  note, velocity = sync "/midi:*:*/note_on"
  
  # Sample starten und im V erzeichnis eintragen.
  # amp_slide kontrolliert die Dämpfung
  playing_synths[note] = synth :saw, release: 0, sustain: 1000, note: note, amp: velocity / 127.0, amp_slide: 0.05
end

live_loop :midi_piano_off do
  use_real_time
  off_note, _ = sync "/midi:*:*/note_off"
  
  # Stop the sample associated with the note_off event
  if playing_synths[off_note]
    control playing_synths[off_note], amp: 0
    playing_synths.delete(off_note)
  end
end

