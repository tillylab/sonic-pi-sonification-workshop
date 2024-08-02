########################################
# Musik mit Code - Effekte             #
########################################
# Aufgabe: 
# Experimentiere mit verschiedenen Effekten

# Zupf-Instrument
use_synth :pluck

# Eine kleine Melodie
define :melodie do
  play :E4
  sleep 0.5
  play :F4
  sleep 0.5
  play :G4
  sleep 0.5
  play :F4
  sleep 0.5
end

# Kein Effekt
melodie
sleep 1

# Echo-Effekt
puts "echo"
with_fx :echo do
  melodie
end
sleep 1

# Wobble-Effekt
puts "wobble"
with_fx :wobble do
  melodie
end
sleep 1

# Effekte kombinieren
puts "wobble und echo"
with_fx :wobble do
  with_fx :echo do
    melodie
  end
end
sleep 1

# Effekte kombinieren (andersrum)
puts "echo und wobble"
with_fx :echo do
  with_fx :wobble do
    melodie
  end
end
sleep 1