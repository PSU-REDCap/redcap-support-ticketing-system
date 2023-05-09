$('#prev_notes_s').text($('#sql_s-tr select').children('option').map(function(i, e){
    if (i == 0) {
        return;
    }
    return e.text;
}).get().join('\n\n'));