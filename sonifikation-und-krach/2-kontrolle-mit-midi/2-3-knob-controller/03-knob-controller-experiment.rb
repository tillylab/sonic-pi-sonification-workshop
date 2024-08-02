########################################
# 03 knob row sequencer experiment     #
########################################
# Wir experimentieren mit den rings

use_bpm 120

run_file '~/sonic-pi/midi-input/midi-input-16knobs.rb'
run_file '~/sonic-pi/midi-input/midi-input-utils.rb'

# EXPERIMENTE !

define :bend_pitches1 do |pitches|
  # Pitch zufuällig wählen
  pitches.pick
end

define :bend_delays2 do |delays|
  # Delays mischen und Einträge verdoppeln ...
  delays.shuffle.stretch(2)
end

define :bend_notes3 do |notes|
  # Noten spiegeln
  notes.mirror
end

define :bend_delays4 do |delays|
  # Einträge verdoppeln
  delays = delays.stretch(2)
end


# Live-Coding Loop 1
live_loop :loop_1 do
  
  # Keine Verzögerung
  use_real_time
  
  # Knöpfe auslesen
  lautstärke = get_value :knob1
  
  shift = get_value :knob2, -2, 2
  pitch1 = get_pitch :knob3
  pitch2 = get_pitch :knob4
  
  # Wir machen KRACH
  with_fx :level, amp: lautstärke do
    pitches = ring pitch1, pitch1, pitch2
    # EXPERIMENT!
    pitches = bend_pitches1 pitches
    delays = ring 0.25, 0.25, 0.5
    sample :drum_cowbell, rpitch: pitches.look + shift
    sleep delays.look
  end
  
  tick
  
end


# Live-Coding Loop 2
live_loop :loop_2 do
  use_real_time
  
  # Knöpfe auslesen
  lautstärke = get_value :knob5
  note1 = get_note :knob6
  note2 = get_note :knob7
  note3 = get_note :knob8
  
  # Wir machen KRACH
  with_fx :level, amp: lautstärke do
    with_synth :tri do
      notes = ring note1, note2, note3
      delays = ring 0.5, 0.5, 1
      # EXPERIMENT!
      delays = bend_delays2 delays
      play notes.look
      sleep delays.look
    end
  end
  
  tick
  
end

# Live-Coding Loop 2
live_loop :loop_3 do
  use_real_time
  
  # Knöpfe auslesen
  lautstärke = get_value :knob9
  note1 = get_note :knob10
  note2 = get_note :knob11
  note3 = get_note :knob12
  
  # Wir machen KRACH
  with_fx :level, amp: lautstärke do
    with_synth  :fm do
      notes = knit note1, 4, note2, 2, note3, 1
      # EXPERIMENT!
      notes = bend_notes3 notes
      delays = knit 0.5, 6, 2.0, 1
      play notes.look
      sleep delays.look
    end
  end
  
  tick
  
end


# Live-Coding Loop 4
live_loop :loop_4 do
  use_real_time
  
  # Knöpfe auslesen
  lautstärke = get_value :knob13
  pitch1 = get_pitch :knob14
  pitch2 = get_pitch :knob15
  pitch3 = get_pitch :knob16
  
  # Wir machen KRACH
  with_fx :level, amp: lautstärke do
    with_synth  :gabberkick do
      with_transpose 12 do
        samples = (knit :drum_bass_hard, 1, :drum_snare_hard, 2)
        pitches = (ring pitch1, pitch2, pitch3)
        delays = (ring 0.5, 0.5, 1)
        # EXPERIMENRT!
        delays = bend_delays4 delays
        sample samples.look, rpitch: pitches.look
        sleep delays.look
      end
    end
  end
  
  tick
  
end