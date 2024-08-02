########################################
# Launchpad - Text                     #
########################################
# Demo to show text on the launchpad
# (Launchpad Mini MK3)

# Midi ports
launchpad_out = "launchpad_mini_mk3_lpminimk3_midi_out"
launchpad_in = "launchpad_mini_mk3_lpminimk3_midi_in"

# Midi messages
launchpad_cc = "/midi:" + launchpad_out + ":1/control_change"
launchpad_notes = "/midi:" + launchpad_out + ":1/note_on"

# Set novation mini to programmer mode
define :set_programmer_mode do
  midi_sysex 0xf0, 0x00, 0x20, 0x29, 0x02, 0x0D, 0x0E, 0x01, 0xf7, port: launchpad_in
end

# Light up multiple leds from novation launchpad
define :led_sysex do |values|
  midi_sysex 0xf0, 0x00, 0x20, 0x29, 0x02, 0x0d, 0x03, *values, 0xf7, port: launchpad_in
end

define :stop_text do
  midi_sysex 0xf0, 0x00, 0x20, 0x29, 0x02, 0x0d, 0x07, 0xf7, port: launchpad_in
end

define :scroll_text do |text, rgb=[255,255,255], speed=8, loop=1|
  if speed < 0
    speed = 128 + speed
  end
  text = text.chars.map { |b| b.ord }
  midi_sysex 0xf0, 0x00, 0x20, 0x29, 0x02, 0x0d, 0x07, loop, speed, 0x01, *rgb.map {|color| ((127*color)/255) }, *text, 0xf7, port: launchpad_in
end

define :led_light do |note, color_idx=4, color_change=1|
  # color_change: 1 = static, 2 = flashing, 3 = pulsing
  midi_note_on note, color_idx, channel: color_change, port: launchpad_in
end

# set_programmer_mode

live_loop :midi_control do
  use_real_time
  note, velocity = sync launchpad_cc
  cc = case note
  when 91
    "▲"
  when 92
    "▼"
  when 93
    "◀"
  when 94
    set :color, 0 # black
    "▶"
  when 95
    set :color, 3 # white
    "Session"
  when 96
    set :color, 5 # red
    "Drums"
  when 97
    set :color, 9 # amber
    "Keys"
  when 98
    set :color, 21 # green
    "User"
  when 89
    scroll_text "Sonifikation und KRACH", [50, 50, 50]
    "➡️ 8"
  when 79
    scroll_text ">>>", [0, 50, 50], -8
    "➡️ 7"
  when 69
    scroll_text "<<<", [50, 50, 0]
    "➡️ 6"
  when 59
    scroll_text "/\\/\\/\\/\\/", [50, 0, 50]
    "➡️ 5"
  when 49
    scroll_text "Dieser Text scrollt rueckwaerts ...", [0, 50, 50], -8
    "➡️ 4"
  when 39
    scroll_text "Rot, rot, rot sind alle meine Farben ...", [50, 0, 0]
    "➡️ 3"
  when 29
    scroll_text "Tillylab 2024", [0, 50, 25]
    "➡️ 2"
  when 19
    stop_text
    "Stop/Solo/Mute"
  else
    "unknown"
  end
  
  print "Control Key: " + cc
  
end

live_loop :midi_notes do
  use_real_time
  
  # receive midi note from launchpad
  note, velocity = sync launchpad_notes
  
  # set the color of the pad via midi
  color = get :color
  led_light note, color, 1
  
end

## initialize
set :color, 3
set_programmer_mode
