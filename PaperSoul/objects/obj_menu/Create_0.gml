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
audio_play_sound(snd_soundtrack,0,0)

global.volumesfx = 1
global.volumemusic = 1

var file = "volume.txt"
if file_exists(file)
{
    var f = file_text_open_read(file)
    if !file_text_eof(f)
    {
        var linha1 = string_trim(file_text_readln(f))
        if linha1 != "" global.volumesfx = real(linha1)
    }
    if !file_text_eof(f)
    {
        var linha2 = string_trim(file_text_readln(f))
        if linha2 != "" global.volumemusic = real(linha2)
    }
    file_text_close(f)
}
else
{
    var f = file_text_open_write(file)
    file_text_write_string(f, "1")
    file_text_writeln(f)
    file_text_write_string(f, "1")
    file_text_close(f)
    global.volumesfx = 1
    global.volumemusic = 1
}