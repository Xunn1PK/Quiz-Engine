nextQuestion = function() {
    if (global.question < array_length(global.data) - 1) {
        global.question++;
    } else {
        //It will be added later
        show_message("Not implemented yet! :)");
    }
}


executeCreationCode = function(inst, id) {
    with (inst) {
        global.creationCode[id]();
    }
}


answerButtonPress = function() {
    with (oQuizButton) {
        isPressed = true;
        image_blend = correct ? c_lime : c_red;
    }
    call_later(global.options.nextQuestionDelay, time_source_units_seconds, function() {
        nextQuestion();
        with(oQuizButton) { 
            isPressed = false;
            image_blend = color;
        }
    });
}