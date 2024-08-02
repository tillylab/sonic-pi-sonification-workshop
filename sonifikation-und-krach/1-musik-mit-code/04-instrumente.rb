########################################
# Musik mit Code - Instrumente         #
########################################
# Aufgabe:
# Benutze verschiedene Instrumente 
# (Synthesizer) um Klänge zu erzeugen!

# 1. Tipp: Autocompletion nutzen
# 2. Tipp: Im Hilfebereich gibt es einen Synth Tab 
#          mit allen verfügbaren Synthesizern

# Ab hier alles mit dem tb303-Synth spielen
use_synth :tb303
play 38
sleep 1

# Ab hier alles mit dem Sägezahn-Synth spielen
use_synth :saw
play 50
sleep 1

# Ab hier alles mit Pretty Bell spielen
use_synth :pretty_bell
play 57
sleep 1

# Alles bis "end" mit dem Piano spielen
with_synth :piano do
  play 38
  sleep 1
  play 50
  sleep 1
end

# Mit welchem Synthesizer wird diese Note gespielt?
play 50
sleep 1
