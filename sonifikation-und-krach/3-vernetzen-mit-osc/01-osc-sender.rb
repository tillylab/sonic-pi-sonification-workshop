########################################
# OSC - Sender                         #
########################################
# Aufgabe: 
# - Aktiviere OSC in den Settings
# Fragen:
# - Was ist deine IP-Adresse ?
# - Was ist dein OSC-Port ?

my_port = 4560
my_ip = "localhost"

use_bpm 120

live_loop :send_local do
  with_osc my_ip, my_port do
    # :C4 an die OSC-Adresse /piano schicken
    osc "/piano", :C4
    sleep 0.5
    # :C5 an die OSC-Adresse /piano schicken
    osc "/piano", :C5
    sleep 0.5
    # :sn_dub an die OSC-adresse /sample schicken
    osc "/sample", :sn_dub
    sleep 0.5
    # :sn_dolf an die OSC-adresse /sample schicken
    osc "/sample", :sn_dolf
    sleep 0.5
  end
end
