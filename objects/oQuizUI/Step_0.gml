if (!global.answersActive) {
    if (oQuizButton.image_alpha == 1) {
        var l = layout;
        with (oQuizButton) {
            other.changeAlpha(self, EASING[l.easing], l.move_time, 0);
        }
        
        with (oPlate) {
            other.changeAlpha(self, EASING[l.easing], l.move_time, 0);
        }
    }
    
    if (keyboard_check_pressed(vk_space) && oQuizButton.image_alpha == 0){
        moveQuestion(layout.x, layout.y, layout.move_time, EASING[layout.easing]);
        global.answersActive = true;
        Quiz._answerButtonReset();
    }
} else if (oQuizButton.image_alpha == 0) {
    var l = layout;
    with (oQuizButton) {
        other.changeAlpha(self, EASING[l.easing], l.move_time, 1);
    }
    
    with (oPlate) {
        other.changeAlpha(self, EASING[l.easing], l.move_time, 1);
    }
}