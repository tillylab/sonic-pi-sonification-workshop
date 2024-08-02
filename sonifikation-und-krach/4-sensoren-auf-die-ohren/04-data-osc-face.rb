########################################
# Vernetzen mit OSC - DataOSC - Face   #
########################################
# Aufgabe: 
# 1. Installiere DataOSC App (nur iOS)
#    http://heestand.xyz/
# 2. Sende OSC-Nachrichten mit deinem Gesicht
#    und mache KRACH!
# 
# Tipp 1: Eine Übersicht der ARKit Blendshapes findest Du hier:
#         https://developer.apple.com/documentation/arkit/arfaceanchor/blendshapelocation

osc_in = "/osc:*:*/data/"

# Face-Tracking: Kamera-Orientierung
live_loop :camera do
  rw, = sync osc_in + "faceTracking/camera/rotation/w"
  rx, = sync osc_in + "faceTracking/camera/rotation/x"
  ry, = sync osc_in + "faceTracking/camera/rotation/y"
  rz, = sync osc_in + "faceTracking/camera/rotation/z"
  puts "FACETRACKING CAM x: #{rx}, y: #{ry}, z: #{rz}, w: #{rw}"
end

# Facetracking: Orientierung des Gesichts
live_loop :face do
  # Position
  x, = sync osc_in + "faceTracking/face/position/x"
  y, = sync osc_in + "faceTracking/face/position/y"
  z, = sync osc_in + "faceTracking/face/position/z"
  # Rotation
  rw, = sync osc_in + "faceTracking/face/rotation/w"
  rx, = sync osc_in + "faceTracking/face/rotation/x"
  ry, = sync osc_in + "faceTracking/face/rotation/y"
  rz, = sync osc_in + "faceTracking/face/rotation/z"
  puts "FACETRACKING FACE x: #{x}, y: #{y}, z: #{z}, rx: #{rx}, ry: #{ry}, rz: #{rz}, rw: #{rw}"
end

# Facetracking: Wie weit ist der Mund geöffnet?
live_loop :jawopen do
  jaw, = sync osc_in + "faceTracking/blendShape/jawOpen"
  puts "FACETRACKING jaw: #{jaw}"
end

# Facetracking: Augenzwinkern links
live_loop :blinkleft do
  blink, = sync osc_in + "faceTracking/blendShape/eyeBlinkLeft"
  if blink > 0.5 then
    puts "FACETRACKING blink: left"
  end
end

# Facetracking: Augenzwinkern rechts?
live_loop :blinkright do
  blink, = sync osc_in + "faceTracking/blendShape/eyeBlinkRight"
  if blink > 0.5 then
    puts "FACETRACKING blink: right"
  end
end

# Facetracking: Zunge raus?
live_loop :tongueout do
  t, = sync osc_in + "faceTracking/blendShape/tongueOut"
  if t == 1.0 then
    puts "FACETRACKING tongue out"
  end
end