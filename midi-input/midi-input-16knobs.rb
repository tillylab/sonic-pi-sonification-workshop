########################################
# Midi Input - 16 Knobs                #
########################################
# Helper for a noname MIDI-Controller
# with 4 x 4 knobs

# The values of :knob1 .. :knob16 
# are set by midi events in a liveloop

# Initialize or retrieve existing values
define :get_default do |key, default|
  (get(key) || default)
end

# Setting default values if not already set
set :knob1, get_default(:knob1, 0)
set :knob2, get_default(:knob2, 0)
set :knob3, get_default(:knob3, 0)
set :knob4, get_default(:knob4, 0)
set :knob5, get_default(:knob5, 0)
set :knob6, get_default(:knob6, 0)
set :knob7, get_default(:knob7, 0)
set :knob8, get_default(:knob8, 0)
set :knob9, get_default(:knob9, 0)
set :knob10, get_default(:knob10, 0)
set :knob11, get_default(:knob11, 0)
set :knob12, get_default(:knob12, 0)
set :knob13, get_default(:knob13, 0)
set :knob14, get_default(:knob14, 0)
set :knob15, get_default(:knob15, 0)
set :knob16, get_default(:knob16, 0)

# Remap the knobs according to their spatial arrangement
live_loop :midi_cc_handler do
  use_real_time
  control, value = sync "/midi:arduino_leonardo:1/control_change"
  case control
  when 12
    set :knob1, value
  when 13
    set :knob2, value
  when 14
    set :knob3, value
  when 15
    set :knob4, value
  when 8
    set :knob5, value
  when 9
    set :knob6, value
  when 10
    set :knob7, value
  when 11
    set :knob8, value
  when 4
    set :knob9, value
  when 5
    set :knob10, value
  when 6
    set :knob11, value
  when 7
    set :knob12, value
  when 17
    set :knob13, value
  when 16
    set :knob14, value
  when 2
    set :knob15, value
  when 3
    set :knob16, value
  end
end