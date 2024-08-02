########################################
# Vernetzen mit OSC - ZigSim App (iOS) #
########################################
# Aufgabe:
# 1. Installiere die ZigSim-App:
#    https://1-10.github.io/zigsim/
# 2. Sende Sensor-Daten von dein Handy
#    und mache KRACH!
#
# Achtung: Android und iOS Apps nutzen
#          unterschiedliche OSC-Adressen (!)

# Alle User
user_id = "*"

# Android-App
osc_in = "/osc:*:*/" + user_id  + "/"

# iOS-App
# osc_in = "/osc:*:*/ZIGSIM/" + user_id + "/"


# Um welche Achsen wird das Smartphone gedreht?
live_loop :gyro do
  x, y, z = sync osc_in + "gyro"
  puts "GYRO x: #{x}, y: #{y}, z:#{z}"
end

# In welche Richtung wird das Smartphone gehalten?
live_loop :gravity do
  x, y, z = sync osc_in + "gyravity"
  puts "GRAVITY x: #{x}, y: #{y}, z:#{z}"
end

# In welche Richtung wird das Smartphone beschleunigt?
live_loop :accel do
  x, y, z = sync osc_in + "accel"
  puts "ACCEL x: #{x}, y: #{y}, z:#{z}"
end

# Lage des Smartphones als Quaternion
live_loop :quaternion do
  x, y, z, w = sync osc_in + "quaternion"
  puts "QUATERNION x: #{x}, y: #{y}, z:#{z} w:#{w}"
end

# Lage des Smartphones zum Erdmagnetfeld
live_loop :compass do
  a, f = sync osc_in + "compass"
  puts "COMPASS angle: #{a}, faceup: #{f}"
end

# Wie laut ist es?
live_loop :miclevel do
  max, average = sync osc_in + "miclevel"
  # Wert ausgeben
  puts "MICLEVEL max: #{max} average: #{average}"
end

# Wiviele Finger berühren das Display?
live_loop :touchcount do
  count, = sync osc_in + "touchcount"
  puts "TOUCHCOUNT #{count}"
end

# Wo ist der 1. Finger?
live_loop :touch0 do
  x, y = sync osc_in + "touch0"
  puts "TOUCH 0 x: #{x}, y: #{y}"
end

# Wo ist der 2. Finger?
live_loop :touch1 do
  x, y = sync osc_in + "touch1"
  puts "TOUCH 1 x: #{x}, y: #{y}"
end

# Welchen Radius hat die Fläche wo der
# 1. Finger das Display berührt?
live_loop :touchradius0 do
  r = sync osc_in + "touchradius0"
  puts "TOUCH 0 r: #{r}"
end

# Welchen Radius hat die Fläche wo der
# 2. Finger das Display berührt?
live_loop :touchradius1 do
  r = sync osc_in + "touchradius1"
  puts "TOUCH 1 r: #{r}"
end

# Wiviel Licht erreicht den Lichtsensor?
live_loop :light do
  l, = sync osc_in + "light"
  puts "LIGHT #{l}"
end

# Knöpfe der Bluetooth Kopfhörer/Earpods gedrückt?
live_loop :remotecontrol do
  p, u, d  = sync osc_in + "remote_control"
  puts "REMOTE playpause: #{p} volume up: #{u} volume down: #{d}"
end