########################################
# Jam Session - Patterns               #
########################################
# Aufgabe: 
# Schreibe die Funktion pattern2

use_bpm 120

define :melodie1 do
  play :G
  sleep 1
  play :F
  sleep 1
  play :G
  sleep 1
  play :E
  sleep 1
end

define :melodie2 do
  play :A
  sleep 1
  play :C
  sleep 1
  play :B
  sleep 1
  play :D
  sleep 1
end

define :pattern1 do
  p = :G, :F, :G, :E
  play_pattern p
end

# Melodien abspielen
melodie1
pattern1
melodie2

