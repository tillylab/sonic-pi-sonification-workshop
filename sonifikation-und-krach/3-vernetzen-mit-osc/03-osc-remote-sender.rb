########################################
# OSC - Remote Sender                  #
########################################
# Aufgabe: 
# - Aktiviere OSC in den Settings
#   (Auch Empfang von anderen Rechnern)
# - An welche IP-Adresse möchtest du senden?
# - An welchen OSC-Port möchtest du senden?

# IP-Adresse des Empfängers
remote_ip = "192.168.0.111"
# OSC-Port des Empfängers
remote_port = 10101

use_bpm 120

live_loop :send_remote do
  with_osc remote_ip, remote_port do
    osc "/piano", :C4
    sleep 0.5
    osc "/piano", :C5
    sleep 0.5
    osc "/sample", :sn_dub
    sleep 0.5
    osc "/sample", :sn_dolf
    sleep 0.5
  end
end
