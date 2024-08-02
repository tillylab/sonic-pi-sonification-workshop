########################################
# Vernetzen mit OSC - DataOSC App      #
########################################
# Aufgabe: 
# 1. Installiere DataOSC App (nur iOS)
#    http://heestand.xyz/
# 2. Sende Sensor-Daten von dein Handy
#    und mache KRACH!

osc_in = "/osc:*:*/data/"

# In welche Richtung wird das Handy beschleunigt?
live_loop :accelerometer do
  # Auf alle drei OSC-Nachrichten warten ...
  x, = sync osc_in + "motion/accelerometer/x"
  y, = sync osc_in + "motion/accelerometer/y"
  z, = sync osc_in + "motion/accelerometer/z"
  puts "ACCELOREMETER x: #{x}, y: #{y}, x: #{z}"
end

# Um welche Achsen wird das Smartphone gedreht?
live_loop :gyroscope do
  # Auf alle drei OSC-Nachrichten warten ...
  x, = sync osc_in + "motion/gyroscope/x"
  y, = sync osc_in + "motion/gyroscope/y"
  z, = sync osc_in + "motion/gyroscope/z"
  puts "GYROSCOPE x: #{x}, y: #{y}, x: #{z}"
end

# GPS-Koordinaten
live_loop :location do
  # Auf beide OSC-Nachrichten warten ...
  lat, = sync osc_in + "location/latitude"
  lon, = sync osc_in + "location/longitude"
  puts "LOCATION latitude: #{lat}, longitude: #{lon}"
end

# Lage des Smartphones zum Erdmagnetfeld
live_loop :compass do
  # Auf beide OSC-Nachrichten warten ...
  tn, = sync osc_in + "compass/trueNorth"
  mn, = sync osc_in + "compass/magneticNorth"
  puts "COMPASS true N: #{tn}, magnetic N: #{mn} "
end
