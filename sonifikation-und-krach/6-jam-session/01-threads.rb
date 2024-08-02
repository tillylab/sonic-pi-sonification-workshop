########################################
# Jam Session - Threads                #
########################################
# Aufgabe: 
# Erzeuge noch einen weiteren Thread

# Eine kleine Melodie
define :melodie do
    play :G
    sleep 0.5
    play :F
    sleep 0.5
    play :G
    sleep 0.5
    play :E
    sleep 0.5
  end
  
  # Melodie abspielen (1. Takt)
  melodie
  sleep 1
  
  # Thread starten (2. Takt)
  in_thread do
    # viertel Takt Pause
    sleep 0.25
    # Eine Oktave höher abspielen
    with_octave 1 do
      melodie
    end
  end
  
  # Melodie abspielen (2. Takt)
  melodie
  