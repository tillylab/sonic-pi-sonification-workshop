########################################
# OSC - Receiver                       #
########################################
# Aufgabe: 
# 1. Starte den OSC-Sender
# 2. Starte den OSC-Receiver
# - Ändere den Rhythmus und die BPM im Sender 
# - Ändere den erzeugten Klang im Receiver

live_loop :sample do
  # Name des Samples aus der OSC-Nachricht auslesen
  name = sync "/osc:*:*/sample"
  sample name
end

live_loop :piano do
  # Note aus der OSC-Nachricht auslesen
  note = sync "/osc:*:*/piano"
  use_synth :piano
  begin
    # Note spielen
    play note
  # Verbotene Noten einfach ignorieren
  rescue Exception => e
    puts "#{e.class}: #{e.message}"
  end
end