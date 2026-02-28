function save_game() {
    var file = file_text_open_write("save.txt")
    var data = ""
    for (var i = 0; i < 7; i++) {
        data += string(global.fases[i])
        if (i < 6) {
            data += ","
        }
    }

    file_text_write_string(file, data)
    file_text_close(file)
}

function load_game() {
    if !file_exists("save.txt") {
        global.fases = [0,0,0,0,0,0,0]
        save_game()
        return
    }
    var file = file_text_open_read("save.txt")
    var line = file_text_read_string(file)
    file_text_close(file)
    var parts = string_split(line, ",")
    global.fases = []
    for (var i = 0; i < 7; i++) {
        global.fases[i] = real(parts[i])

    }
}

function salvar_volume()
{
    var f = file_text_open_write("volume.txt")
    file_text_write_string(f, string(global.volumesfx))
    file_text_writeln(f)
    file_text_write_string(f, string(global.volumemusic))
    file_text_close(f)
}