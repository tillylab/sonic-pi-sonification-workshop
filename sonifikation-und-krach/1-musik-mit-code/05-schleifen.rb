########################################
# Musik mit Code - Schleifen           #
########################################
# Aufgabe: 
# Ändere die Anzahl der Durchläufe für 
# jede Schleife
#
# 1. Tipp: Mit Schleifen können wir Code 
#          mehr als einmal ausführen
# 2. Tipp: Kontrolliere mit use_bpm die Geschwin-
#          digkeit der Nachfolgende Melodie
# 2. Tipp: Kontrolliere mit use_synth das 
#          verwendete Instrument

# 120 Beats pro Minute
use_bpm 120

# Diesen Teil vier mal ausführen
4.times do
  
  # Synthesizer: Schöne Glocke
  use_synth :pretty_bell
  
  # diesen Teil zwei mal (CDCD)
  2.times do
    play :C4
    sleep 0.25
    play :D4
    sleep 0.25
  end
  
  # diesen Teil drei mal
  3.times do
    
    # Dumpfe Glocke
    use_synth :dull_bell
    2.times do
      play :E4
      sleep 0.5
    end
    
    # Schöne Glocke
    use_synth :pretty_bell
    2.times do
      play :F4
      sleep 0.5
    end
    
    play :G4
    sleep 1
    
  end
  
end
