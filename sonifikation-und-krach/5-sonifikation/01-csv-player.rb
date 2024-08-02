########################################
# Sonifikation - CSV player            #
########################################

# CSV library laden
require 'csv'

# Ort der CSV-Datei
file = ENV["HOME"] + "/sonic-pi/data/melody.csv"

# Liste der Töne anlegen
notes = []

# Liste der Tondauern anlegen
times = []

# Listen aus der CSV-Datei füllen
CSV.foreach(file, headers: true) do |row|
  notes << row['tone']
  times << row['time'].to_f
end

# Song spielen
use_bpm 120
set_volume! 0.2
use_synth :piano
play_pattern_timed notes, times