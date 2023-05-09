$('#prev_notes_pc').text($('#sql_pc-tr select').children('option').map(function(i, e){
    if (i == 0) {
        return;
    }
    return e.text;
}).get().join('\n\n'));