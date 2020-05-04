arr = [329.63, 246.94,196.00, 146.83, 110.00, 82.41]

use_synth :pluck

cords = {
    str1: {
        hz: 82.41,
        attr: {
            release: 1,
            sustane: 1,
            attack: 0.125
        }
    },
    str2: {
        hz: 110.00,
        attr: {
            release: 0.75,
            sustane: 0.5,
            attack: 0.125
        }
    },
    str3: {
        hz: 146.83,
        attr: {
            release: 0.25,
            sustane: 0.25,
            attack: 0.125
        }
    }
}

play_arr = [cords[:str1], cords[:str2], cords[:str1], cords[:str3]]
play_arr2 = []
str = "12113121213121321312121312131213211212131211211213"
str.each_char do |c|
  num = c.to_i
  play_arr2 << cords["str#{num}".to_sym]
end
live_loop :flibble do
  play_arr.each do |item|
    play hz_to_midi(item[:hz]), **item[:attr]
    sleep 0.75
  end
end


