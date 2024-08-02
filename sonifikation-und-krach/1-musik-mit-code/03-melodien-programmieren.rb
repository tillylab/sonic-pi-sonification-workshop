############################################
# Musik mit Code - Melodien Programmieren  #
############################################
# Aufgabe: 
# Spiele die Teile des Liedes in einer anderen 
# Reihenfolge ab!
#
# 1. Tipp: Das Lied heißt "Freude schöner 
#          Götterfunken" und ist die Europahymne.
# 2. Tipp: Um eine Melodie in einzelne Abschnitte 
#          zu zerlegen kann man Funktionen nutzen
# 3. Tipp: Eine Funktion definert man mit "define" 
#          (siehe z.B. Zeile 12)
# 4. Tipp: Man kann die Funktion später mit 
#          ihrem Namen aufrufen (ganz am Ende)

use_bpm 120

# Funktion teil1 definieren
define :teil1 do
  
  play :E4 # Freu
  sleep 0.5
  play :E4 # de
  sleep 0.5
  play :F4 # schö
  sleep 0.5
  play :G4 # ner
  sleep 0.5
  play :G4 # Göt
  sleep 0.5
  play :F4 # ter
  sleep 0.5
  play :E4 # fun
  sleep 0.5
  play :D4 # ken
  sleep 0.5
  play :C4 # Toch
  sleep 0.5
  play :C4 # ter
  sleep 0.5
  play :D4 # aus
  sleep 0.5
  play :E4 # E
  sleep 0.5
  play :E4 # ly
  sleep 0.75
  play :D4 # si
  sleep 0.25
  play :D4 # um
  sleep 1.0
  
end

# Funktion teil2 definieren
define :teil2 do
  
  play :E4 # wir
  sleep 0.5
  play :E4 # be
  sleep 0.5
  play :F4 # tre
  sleep 0.5
  play :G4 # ten
  sleep 0.5
  play :G4 # feu
  sleep 0.5
  play :F4 # er
  sleep 0.5
  play :E4 # trun
  sleep 0.5
  play :D4 # ken
  sleep 0.5
  play :C4 # Himm
  sleep 0.5
  play :C4 # li
  sleep 0.5
  play :D4 # sche
  sleep 0.5
  play :E4 # dein
  sleep 0.5
  play :D4 # Hei
  sleep 0.75
  play :C4 # lig
  sleep 0.25
  play :C4 # tum!
  sleep 1.0
  
end

# Funktion teil3 definieren
define :teil3 do
  
  play :D4 # Dei
  sleep 0.5
  play :D4 # ne
  sleep 0.5
  play :E4 # Zau
  sleep 0.5
  play :C4 # ber
  sleep 0.5
  play :D4 # bind
  sleep 0.5
  play :E4 # -
  sleep 0.25
  play :F4 # en
  sleep 0.25
  play :E4 # wie
  sleep 0.5
  play :C4 # der
  sleep 0.5
  play :D4 # was
  sleep 0.5
  play :E4 # die
  sleep 0.25
  play :F4 # -
  sleep 0.25
  play :E4 # Mon
  sleep 0.5
  play :D4 # de
  sleep 0.5
  play :C4 # streng
  sleep 0.5
  play :D4 # ge
  sleep 0.5
  play :G3 # teilt
  sleep 0.5
  
end

# Funktion teil4 definieren
define :teil4 do
  
  play :E4 # A
  sleep 1.0
  play :E4 # le
  sleep 0.5
  play :F4 # Men
  sleep 0.5
  play :G4 # schen
  sleep 0.5
  play :G4 # wer
  sleep 0.5
  play :F4 # den
  sleep 0.5
  play :E4 # Brü
  sleep 0.5
  play :D4 # der
  sleep 0.5
  play :C4 # wo
  sleep 0.5
  play :C4 # dein
  sleep 0.5
  play :D4 # sanf
  sleep 0.5
  play :E4 # ter
  sleep 0.5
  play :D4 # Flü
  sleep 0.75
  play :C4 # gel
  sleep 0.25
  play :C4 # weilt.
  sleep 1.0
  
end

# Alle vier Funktionen nacheinander aufrufen
teil1
teil2
teil3
teil4