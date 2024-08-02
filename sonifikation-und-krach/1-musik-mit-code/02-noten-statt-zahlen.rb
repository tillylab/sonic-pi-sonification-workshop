########################################
# Musik mit Code - Noten statt Zahlen  #
########################################
# Aufgabe: 
# Nutze Noten statt Zahlen

# 1. Tipp: #C5 ist das C der 5. Oktave, es ent-
#          spricht der MIDI-Note mit der Zahl 72
# 2. Tipp: Hier die Midi-Noten für die Notenfolge 
#          C, D, E, F, G, A, H, C
#
#    72 = :C5
#    74 = :D5
#    76 = :E5
#    77 = :F5
#    79 = :G5
#    81 = :A5
#    83 = :B5
#    84 = :C6
# 
# 3. Tipp: Diese Noten liegen beim Klavier auf 
#          den weißen Tasten
# 4. Tipp: Die deutsche Note H heisst im 
#          englischen B
# 5. Tipp: C6 ist genau 12 Töne (eine Oktave) 
#          höher als C5
# 6. Tipp: Man kann auch Halbtöne schreiben 
#          (schwarze Tasten auf dem Klavier)
#          Eine Note mit # davor ist einen 
#          Halbton höher (s = sharp)
#          Eine Note mit b davor ist einen 
#          Halbton tiefer (f = flat)
#
#    73 = :Cs5 = :Df5 (C sharp = D flat) (cis = des)
#    75 = :Ds5 = :Ef5 (D sharp = E flat) (dis = es)
#    78 = :Fs5 = :Gf5 (F sharp = G flat) (fis = ges)
#    80 = :Gs5 = :Af5 (G sharp = A flat) (gis = as)
#    82 = :As5 = :Bf5 (A sharp = B flat) (ais = b)

# Note starten
play :C5
# Warten
sleep 1

# Welche Note kommt hier hin?
play 75
# Warten
sleep 1

# Welche Note kommt hier hin?
play 79