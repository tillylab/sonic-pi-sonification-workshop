########################################
# Knob Controller - Notes              #
########################################
# Wir nutzen Play und Sleep

use_bpm 120

# Knöpfe auslesen 
run_file '~/sonic-pi/midi-input/midi-input-16knobs.rb'
# get_pitch, get_value, get_note
run_file '~/sonic-pi/midi-input/midi-input-utils.rb'

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
    sample :drum_cowbell, rpitch: pitch1 + shift
    sleep 0.25
    sample :drum_cowbell, rpitch: pitch1 + shift
    sleep 0.25
    sample :drum_cowbell, rpitch: pitch2 + shift
    sleep 0.5
  end
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
      play note1
      sleep 0.5
      play note2
      sleep 0.5
      play note3
      sleep 1
    end
  end
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
      4.times do
        play note1
        sleep 0.5
      end
      2.times do
        play note2
        sleep 0.5
      end
      play note3
      sleep 2
    end
  end
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
        sample :drum_bass_hard, rpitch: pitch1
        sleep 0.5
        sample :drum_snare_hard, rpitch: pitch2
        sleep 0.5
        sample :drum_snare_hard, rpitch: pitch3
        sleep 1
      end
    end
  end
end


