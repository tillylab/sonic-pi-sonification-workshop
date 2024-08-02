########################################
# Sonifikation - Wetter-Daten          #
########################################

# CSV library
require 'csv'

# Funktion:
# Temperatur-Werte in Midi-Noten verwandeln
# Temperatur in °celsius [0..12] => Midi-Note [48 .. 84]
define :normalize_to_midi do |val, min_val=0, max_val=12, min_midi=48, max_midi=84|
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
  notes = []
  CSV.foreach(file, headers: true) do |row|
    notes << normalize_to_midi(row[column].to_f).to_i
  end
  # Noten zurück geben
  notes
end

# Werte als Noten-Folge auf dem Klavier spielen
define :play_piano do |notes, duration=0.1|
  # Klavier-Synthesizer
  with_synth :piano do
    notes.each do |midi_note|
      # Note spielen
      play midi_note
      sleep duration
    end
  end
end

# Arrays nach dem Reißverschlußprinzip verzahnen:
# [[1, 10], [2, 20], [3, 30] => [[1, 2, 3], [10, 20, 30]]
define :zip do |*arr|
  arr[0].zip(*arr.drop(1))
end


# CSV sonifizieren
stuttgart = csv_to_midi "wetter.csv", "Stuttgart"
münchen = csv_to_midi "wetter.csv", "München"
berlin = csv_to_midi "wetter.csv", "Berlin"

set_volume! 0.2

# Temperaturverlauf in Stuttgart
play_piano stuttgart

sleep 1

# Stuttgart,  München und Berlin im Akkord
dreiklang = zip stuttgart, münchen, berlin
play_piano dreiklang

sleep 1

# Stuttgart, München und Berlin als gebrochener Akkord
# (Töne nacheinander, mit kurzer Pause)
argpeggio = (zip stuttgart, münchen, berlin, []).flatten
play_piano arpeggio

