########################################
# Midi Input -  Utils                  #
########################################
# Von Midi-Reglern zu Werten und Noten

# Skaliert den wert "value" vom Intervall {imin .. imax} auf {omin .. omax}
define :map_value do |value, imin, imax, omin, omax|
  omin + (value - imin) * (omax - omin) / (imax - imin)
end

# Gibt den Wert des Reglers zwischen 0 (ganz links) und 1 (ganz rechts) zurück
define :get_value do |knob, min=0.0, max=1.0|
  map_value (get knob), 0.0, 127.0, min, max
end

# Gibt eine Note zwischen C4 (Regler ganz links) und C5 (Regler ganz rechts) zurück
define :get_note do |knob, min=:C3, max=:C5|
  get_value knob, (note min), (note max)
end

# Gibt eine relative Note zwischen -12 (Regler ganz links) und +12 (Regler ganz rechts) zurück
define :get_pitch do |knob, pitch_range=12|
  get_value knob, -pitch_range, pitch_range
end
