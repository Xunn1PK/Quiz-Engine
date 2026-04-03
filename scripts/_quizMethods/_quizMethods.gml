function _quizMethods() constructor {
    #region Private methods. Do NOT touch it
    static __nextQuestion = function() {
        if (global.question < array_length(global.data) - 1) {
            global.question++;
        } else {
            //It will be added later
            showMsg("Not implemented yet! :)");
        }
    }
    
    static __executeCreationCode = function(inst, id) {
        with (inst) {
            global.creationCode[id]();
        }
    }
    #endregion
    
    #region System methods. In 99.9% cases you do NOT need to touch it
        
    static _answerButtonPress = function() {
        with (oQuizButton) {
            isPressed = true;
            image_index = correct ? 3 : 4;
        }
        call_later(global.options.nextQuestionDelay, time_source_units_seconds, function() {
            __nextQuestion();
            with(oQuizButton) { 
                isPressed = false;
                image_index = 0;
            }
        });
    }
    #endregion
    
    #region Public methods.
    static getButtonsPressed = function() {
        return oQuizButton.isPressed;
    }
}