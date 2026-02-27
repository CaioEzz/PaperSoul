blackScreenAlpha = 1
alarm[0] = 60
logoDraw = false

logoX = room_width/2
logoY = room_height/2
logoScale = 1
logoRot = 0

xx = logoX
yy = logoY

blinkTime = 0
blinkTimeAdd = 0.03
ZPressed = false
ZReady = false

menuReady = false

if !variable_global_exists("fases") {
    load_game()
}

audio_play_sound(snd_film,999,1)