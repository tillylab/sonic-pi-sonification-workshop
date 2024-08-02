########################################
# Vernetzen mit OSC - Sensors2OSC App  #
########################################
# Aufgabe:
# 1. Installiere Sensors2OSC (nur Android)
#    https://sensors2.org/osc/
# 2. Sende Sensor-Daten von dein Handy
#    und mache KRACH!    

osc_in = "/osc:*:*/"

# In welche Richtung wird das Handy beschleunigt?
live_loop :accelerometer do
  x, y, z = sync osc_in + "accelerometer"
  puts "ACCEL x: #{x}, y: #{y}, z:#{z}"
end

# Wo ist der 1. Finger?
live_loop :touch0 do
  x, y = sync osc_in + "touch0"
  puts "TOUCH 0 x: #{x}, y: #{y}"
end

# Wo ist der 2. Finger?
live_loop :touch1 do
  x, y = sync osc_in + "touch0"
  puts "TOUCH 1 x: #{x}, y: #{y}"
end

# Stärke des Erdmagnetfelds (Kompass)
live_loop :magneticfield do
  x, y, z = sync osc_in + "magneticfield"
  puts "MAGNETIC FIELD x #{x}, y: #{y}, z: #{z}"
end

# Um welche Achsen wird das Smartphone gedreht?
live_loop :gyroscope do
  x, y, z = sync osc_in + "gyroscope"
  puts "GYROSCOPE x #{x}, y: #{y}, z: #{z}"
end

# Wiviel Licht erreicht den Lichtsensor?
live_loop :light do
  l, = sync osc_in + "light"
  puts "LIGHT #{l}"
end

# In welche Richtung wird das Smartphone gehalten?
live_loop :gravity do
  x, y, z = sync osc_in + "gravity"
  puts "GRAVITY x #{x}, y: #{y}, z: #{z}"
end


# In welche Richtung wird das Smartphone beschleunigt?
live_loop :linearacceleration do
  x, y, z = sync osc_in + "linearacceleration"
  puts "LINEAR ACC x #{x}, y: #{y}, z: #{z}"
end

# Rotations-Achse (Quaternion?)
live_loop :rotationvector do
  x, y, z, w, u = sync osc_in + "rotationvector"
  puts "ROTATION VEC x #{x}, y: #{y}, z: #{z}, w: #{w}, u: #{u}"
end

# Hall-Effect (Magnetischer Verschluss)
live_loop :halleffect do
  h, = sync osc_in + "65600"
  puts "HALL EFFECT #{h}"
end

# Grip-Sensor (Tablet in der Hand)
live_loop :gripsensor do
  g = sync osc_in + "65575"
  puts "GRIP SENSOR #{g}"
end