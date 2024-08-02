########################################
# Sonifikation - Aktien-Crash          #
########################################

# CSV library
require 'csv'

# Funktion:
# Werte in Midi-Noten verwandeln
define :normalize_to_midi do |val, min_val, max_val, min_midi=48, max_midi=84|
  # Normierter Wert zwischen 0 und 1 (Fließkommazahl)
  norm_val = (val - min_val) / (max_val - min_val).to_f
  # Midi-Note zwischen min_midi und max_midi (Fließkommazahl)
  midi_val= (min_midi + norm_val * (max_midi - min_midi))
  return midi_val
end

# Funktion:
# CSV-Datei in MIDI-noten verwandeln
define :csv_to_midi do |csv_file, column|
  
  # Ort der CSV-Datei
  file = ENV["HOME"] + "/sonic-pi/data/" + csv_file
  
  # Werte aus der CSV-Datei lesen
  values = []
  CSV.foreach(file, headers: true) do |row|
    values << row[column].to_f
  end
  
  # kleinsten und größten Wert bestimmen
  min_val = values.min
  max_val = values.max
  puts("Die Werte liegen zwischen #{min_val} und #{max_val}")
  
  # Werte in Noten verwandeln
  notes = []
  values.each do |value|
    notes << normalize_to_midi(value, min_val, max_val)
  end
  
  # Noten zurück geben
  notes
  
end

# Werte als Noten-Folge auf dem Klavier
define :play_piano do |notes, duration=0.5|
  # Klavier-Synthesizer
  with_synth :piano do
    notes.each do |midi_note|
      # Note runden
      full_note = midi_note.to_i
      # Note spielen
      play full_note
      sleep duration
    end
  end
end

# Werte als kontinuierlicher Ton
define :play_theremin do |notes, duration=0.5|
  # Sinus-Synthesizer
  with_synth :fm do
    # Note starten
    note = play notes.first, sustain: notes.length * duration
    # Ton über die Zeit verändern
    notes.each do |midi_note|
      control note, note: midi_note
      sleep duration
    end
  end
end

# CSV sonifizieren
notes = csv_to_midi "stock-market.csv", "Close"
duration = 0.01

# Noten auf dem Klavier spielen
set_volume! 0.2
play_piano notes, duration

sleep 1

# Noten auf dem Theremin spielen
set_volume! 0.8
play_theremin notes, duration
