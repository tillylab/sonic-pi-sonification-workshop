########################################
# Keyboard Synth - Live Loop           #
########################################
# Klavier mit Loop-Funktion
# Alles was du spielst wird im Loop wiederholt

# Loop-Dauer in Sekunden
interval = 2

# Wie oft soll der Klang wiederholt werden?
repeat = 3

# Welche Instrumente sollen verwendet werden?
instruments = (ring :saw, :piano)

# Verzeichnis der laufenden Synths
synths = {}


live_loop :midi_note_on do
  
  use_real_time
  
  # Mit der Note-On Nachricht synchronisieren
  note, velocity = sync "/midi:*:*/note_on"
  new_synth = synth :saw, release: 0, sustain: 1000, note: note, amp: velocity / 127.0, amp_slide: 0.05
  
  # Klang-Daten im Verzeichnis speichern
  synths[note] = {synth: new_synth, start_time: vt, velocity: velocity}
  
end

live_loop :midi_note_off do
  
  use_real_time
  
  # Mit der Note-Off Nachricht synchronisieren
  note, _ = sync "/midi:*:*/note_off"
  
  # Klang im Verzeichnis enthalten?
  if synths[note]
    
    # Klang-Daten aus dem Verzeichnis lesen
    data = synths[note]
    old_synth = data[:synth]
    start_time = data[:start_time]
    velocity = data[:velocity]
    
    # Dauer des Klangs aus der aktuellen Zeit und der Startzeit berechnen
    duration = vt - start_time
    
    # Klang dämpfen und aus dem Verzeichnis entfernen
    control old_synth, amp: 0
    synths.delete(note)
    
    # Kopien des aktuellen Klangs in die Zukunft schicken
    repeat.times do |i|
      index = i + 1
      # Zeitmaschine starten
      time_warp (-duration + interval * index) do
        # Neue Note: einen Ton höher
        new_note = note + 2 * index
        # Nächstes Instrument
        new_instrument = instruments[index]
        synth new_instrument, release: 0, sustain: duration, note: new_note, amp: velocity / 127.0
      end
    end
    
  end
end
