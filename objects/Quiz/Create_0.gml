nextQuestion = function() {
    if (global.question < array_length(global.data) - 1) {
        global.question++;
    } else {
        //It will be added later
        showMsg("Not implemented yet! :)");
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
        image_index = correct ? 3 : 4;
    }
    call_later(global.options.nextQuestionDelay, time_source_units_seconds, function() {
        Quiz.nextQuestion();
        with(oQuizButton) { 
            isPressed = false;
            image_index = 0;
        }
    });
}