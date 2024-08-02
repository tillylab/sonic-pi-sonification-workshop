########################################
# Jam Session - Patterns bauen         #
########################################
# Aufgabe: 
# Baue deine eigenen Patterns

########################################
# Patterns abspielen                   #
########################################

# Pattern abspielen, ausgeben und warten
define :spiele do |p|
  puts p
  play_pattern p
  sleep 1
end

# MIDI-Noten in symbolische Noten verwandeln
define :noten do |zahlen|
  zahlen.map { |n| note_info(n).midi_string.to_sym }
end

# Markierung im Output
define :titel do |text|
  puts '-' * 60
  puts text
  puts '-' * 60
end

########################################
# Patterns bauen                       #
########################################

# Alle Zahlen zwischen zwei Zahlen
define :folge do |von, bis, schritt=1|
  puts "folge"
  range von, bis, schritt, inclusive:true
end

# Alle Noten einer Tonart
define :tonleiter do |grundton=:C, geschlecht=:major, oktaven=1|
  puts "Tonleiter für #{grundton} #{geschlecht}"
  leiter = scale grundton, geschlecht, num_octaves: oktaven
  noten leiter
end

# Alle Noten zwischen zwei Noten (nach Tonart gefiltert)
define :notenfolge do |von, bis, tonart=scale(:c, :major)|
  grundton, geschlecht = tonart.to_a.tonic, tonart.to_a.name
  puts "Notenfolge von #{von} bis #{bis} in der Tonart #{grundton} #{geschlecht}"
  folge = note_range von, bis, pitches: tonart
  noten folge
end

########################################
# Patterns verändern                   #
########################################

# Pattern von links nach rechts abspielen
define :vorwärts do |p|
  puts "Folge #{p} vorwärts."
  p
end

# Pattern von rechts nach links abspielen
define :rückwärts do |p|
  puts "Folge #{p} rückwärts"
  p.reverse
end

# Pattern mehrfach abspielen
define :wiederholt do |p, n|
  puts "Spiele die Folge #{p} #{n} mal"
  p * n
end

# Pattern durchmischen
define :gemischt do |p|
  puts "Mische die Noten der Folge #{p}"
  p.shuffle
end

# Pattern rotieren
define :rotiert do |p|
  puts "Rotiere die Noten der Folge #{p}"
  p.rotate
end

# Pattern strecken
define :gestreckt do |p, n|
  puts "Strecke die Folge #{p} so dass jede Note #{n} mal gespielt wird"
  p.ring.stretch(n).to_a
end

# Zwei Pattern verketten
define :verkettet do |p1, p2|
  puts "Verkette die Folgen #{p1} und #{p2}"
  p1 + p2
end

# Zwei Patterns verzahnen
define :verzahnt do |p1, p2|
  puts "Verzahne die Folgen #{p1} und #{p2}"
  p1.to_a.zip(p2).flatten
end

# Pattern sortieren
define :sortiert do |p|
  puts "Sortiere die Noren der Folge #{p}}"
  p1.sort
end

# Noten aus dem Pattern ziehen
define :zufällig do |p, n|
  puts "Ziehe #{n} Noten aus der Folgen #{p}} (mit Zurücklegen)"
  p.pick(n)
end

# Pattern beschneiden
define :schnippschnapp do |p, vorn=1, hinten=1|
  puts "Schneide vorne #{vorn} und hinten #{hinten} von #{p} ab"
  p[vorn .. -1-hinten]
end

# Pattern vorne beschneiden
define :schnipp  do |p, vorn=1|
  puts "Schneide vorne #{vorn} von #{p} ab"
  p[vorn ..]
end

# Pattern hinten beschneiden
define :schnapp do |p, hinten=1|
  puts "Schneide hinten #{hinten} von #{p} ab"
  p[.. -1 - hinten]
end

########################################
# Akkorde bauen                        #
########################################

# Akkorde zu allen Noten erzeugen
define :akkorde do |p, deltas=[0, 2, 4], tonart=scale(:c, :major)|
  grundton, geschlecht = tonart.to_a.tonic, tonart.to_a.name
  puts "Akkorde zur Folge #{p} in der Tonart #{grundton} #{geschlecht}"
  # Tonleidter der Skala plus minus 10 Oktaven um den Grundton
  tonleiter = scale grundton - 120, geschlecht, num_octaves: 20
  # Für alle Töne ...
  p.map do |n|
    num = note(n)
    # Position in der Tonleiter finden
    index = tonleiter.index(num)
    if index
      # Akkord-Noten aus der Tonleiter holen
      deltas.map { |delta| tonleiter[index + delta] }
    else
      # Noten die nicht in der Tonart enthalten sind ignorieren
      puts "Achtung: Note #{n} nicht in der Tonart enthalten."
      []
    end
  end
end

# Noten der Akkorde nacheinander spielen
define :arpeggio do |p, deltas=[0, 2, 4], tonart=scale(:c, :major)|
  (akkorde p, deltas, tonart).flatten
end

########################################
# Hauptprogramm                        #
########################################

use_bpm 120

titel "Patterns erzeugen"

p1 = notenfolge :G, :C5
spiele p1

p2 = rückwärts p1
spiele p2

p3 = akkorde p1, [0, 2, 4]
spiele p3

p4 = arpeggio p1, [0, 2, 4]
spiele p4

titel "Operationen mit 1 Pattern"
spiele schnippschnapp p1
spiele wiederholt p1, 2
spiele gemischt p1
spiele rotiert p1
spiele gestreckt p2, 2

# 20 zufällige Akkorde als Arpeggio
spiele (zufällig p3, 20).flatten

titel "Operationen mit 2 Patterns"
spiele verkettet p1, p2
spiele verzahnt p1, p2