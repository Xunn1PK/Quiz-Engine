function _quizButtonMethods() constructor {
    inst = other;
    callbackStatic = function() {
        inst.image_index = 0;
    }
    onMouseHover = function() {
        inst.image_index = 1;
    }
    onMouseHold = function() {
        inst.image_index = 2;
    }
    onMouseReleased = function() {
        Quiz._answerButtonPress();
    }
    
    static getStr = function(ButtonID) {
        return global.data[global.question].Answer[ButtonID].str;
    }
    static isCorrect = function(ButtonID) {
        return global.data[global.question].Answer[ButtonID].correct;
    }
}