str = global.data[global.question].Answer[ButtonID].str;
correct = global.data[global.question].Answer[ButtonID].correct;
isPressed = false;
callback = {
    "onMousePressed": function(){
        isPressed = true;
        call_later(global.options.nextQuestionDelay, time_source_units_seconds, function(){
            Quiz.nextQuestion();  
            isPressed = false;
        });
    }
}