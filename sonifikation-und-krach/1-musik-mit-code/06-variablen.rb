########################################
# Musik mit Code - Variablen           #
########################################
# Aufgabe:
# Ändere den Code so ab, dass die Melodie 
# mit jedem Durchgang schneller wird

# 1. Tipp: Alles zwischen with_bpm ... do 
#          und end wird mit der entsprechenden 
#          BPM-Zahl abgespielt

# Wir definieren die Variable mit dem Namen 
# "bpm" und weisen ihr den Wert 120 zu.
bpm = 120

# Diesen Teil 5 mal ausführen
5.times do
  
  # Wir übergeben den Wert der Variable 
  # der Funktion "use_bpm".
  with_bpm bpm do
    
    use_synth :dull_bell
    play :E4
    sleep 0.5
    play :E4
    sleep 0.5
    use_synth :pretty_bell
    play :F4
    sleep 0.25
    play :F4
    sleep 0.75
    
    play :G4
    sleep 1
    
    # Der neue Wert von bpm ist nun genau 
    # um 20 kleiner als vorher
    bpm = bpm - 20
    
    # Wir können den aktuellen Wert auch ausgeben
    puts bpm

  end
  
end
