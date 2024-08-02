########################################
# Musik mit Code - Akkorde             #
########################################
# Aufgabe: Erstelle eine Folge von Akkorden

# 1. Tipp: Wir können mehrere Noten 
#          gleichzeitig abspielen. Das nennt 
#          man  Akkorde (deutsch Zusammenklang)
# 2. Tipp: Mit der :amp Option lässt sich die 
#          Lautstärke eines Tons steuern
# 3. Tipp: Die Funktion play kann auch mehrere 
#          Töne auf einmal spielen
# 4. Tipp: Eine einfache Möglichkeit Akkorde zu 
#          erzeugen ist die chord-Funktion
# 5. Tipp: tick gibt immer den nächsten Eintrag 
#          einer Liste zurück

# Noten gleichzeitig starten, alle etwas leiser
play 64, amp: 0.3
play 68, amp: 0.3
play 71, amp: 0.3
sleep 1

# Mit play  eine Liste von Noten 
# gleichzeitig spielen
liste = 64, 68, 71
play liste
sleep 1

# chord erstellt einen Akkord mit 
# klassischer Notation (hier E-Dur)
liste = chord :e4, :major
play liste
sleep 1

# Man kann die Noten der Akkorde auch 
# einzeln abspielen
play liste.tick
sleep 1
play liste.tick
sleep 1
play liste.tick
sleep 1