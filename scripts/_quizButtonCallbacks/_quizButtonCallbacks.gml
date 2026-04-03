function _quizButtonCallbacks() constructor {
    inst = other;
    normal = function() {
        inst.image_index = 0;
    }
    onMouseHover = function() {
        inst.image_index = 1;
    }
    onMouseHold = function() {
        inst.image_index = 2;
    }
    onMouseReleased = function() {
        Quiz.__answerButtonPress();
    }
}