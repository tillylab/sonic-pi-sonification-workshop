##############################################
# Vernetzen mit OSC - DataOSC - Controller   #
##############################################
# Aufgabe:
# 1. Installiere DataOSC App (nur iOS)
#    http://heestand.xyz/
# 2. Kopple einen Bluetooth-Controller mit
#    deinem iPhone
# 3. Sende OSC-Nachrichten mit dem Controller
#    und mache KRACH!

osc_in = "/osc:*:*/data/"

# Zustand des Buttons anzeigen
define :show do |name, state|
  puts "#{name}: #{state ? 'pressed' : 'released'}"
end

# DPAD-Buttons (vier Buttons auf der linken Seite)
live_loop :dpad_right do
  state, = sync osc_in + "gameController/dpad/right"
  show "DPAD RIGHT", state
end

live_loop :dpad_left do
  state, = sync osc_in + "gameController/dpad/left"
  show "DPAD LEFT", state
end

live_loop :dpad_up do
  state, = sync osc_in + "gameController/dpad/up"
  show "DPAD UP", state
end

live_loop :dpad_down do
  state, = sync osc_in + "gameController/dpad/down"
  show "DPAD DOWN", state
end

# ACTION-Buttons (vier Buttons auf der rechten Seite)
#
# Achtung:
# Beim Switch-Controller sind die Action-Buttons
# right und down sowie left und up vertauscht.

live_loop :action_right do
  state, = sync osc_in + "gameController/action/right"
  show "ACTION DOWN", state
end

live_loop :action_left do
  state, = sync osc_in + "gameController/action/left"
  show "ACTION UP", state
end

live_loop :action_up do
  state, = sync osc_in + "gameController/action/up"
  show "ACTION LEFT", state
end

live_loop :action_down do
  state, = sync osc_in + "gameController/action/down"
  show "ACTION RIGHT", state
end

# JOYSTICKS

live_loop :joystick_left do
  # Auf beide OSC-Nachrichten warten
  x, = sync osc_in + "gameController/stick/left/x"
  y, = sync osc_in + "gameController/stick/left/y"
  puts "JOYSTICK LEFT x: #{x} y: #{y}"
end

live_loop :joystick_right do
  # Auf beide OSC-Nachrichten warten
  x, = sync osc_in + "gameController/stick/right/x"
  y, = sync osc_in + "gameController/stick/right/y"
  puts "JOYSTICK RIGHT x: #{x} y: #{y}"
end

# Sonstige Buttons

live_loop :shoulder_left do
  # Auf beide OSC-Nachrichten warten
  state, = sync osc_in + "gameController/shoulder/left"
  show "SHOULDER LEFT", state
end

live_loop :shoulder_right do
  # Auf beide OSC-Nachrichten warten
  state, = sync osc_in + "gameController/shoulder/right"
  show "SHOULDER RIGHT", state
end

live_loop :trigger_left do
  # Auf beide OSC-Nachrichten warten
  state, = sync osc_in + "gameController/trigger/left"
  show "TRIGGER LEFT", state == 1
end

live_loop :trigger_right do
  # Auf beide OSC-Nachrichten warten
  state, = sync osc_in + "gameController/trigger/right"
  show "TRIGGER RIGHT", state == 1
end

live_loop :menu do
  # Auf beide OSC-Nachrichten warten
  state, = sync osc_in + "gameController/menu"
  show "MENU", state
end

live_loop :options do
  # Auf beide OSC-Nachrichten warten
  state, = sync osc_in + "gameController/options"
  show "OPTIONS", state
end