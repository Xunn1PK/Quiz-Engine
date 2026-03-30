nextQuestion = function(){
    if (global.question < array_length(global.data) - 1){
        global.question++;
    } else {
        //It will be added later
        show_message("Not implemented yet! :)");
    }
}
executeCreationCode = function(inst, id){
    with (inst){
        global.creationCode[id]();
    }
}