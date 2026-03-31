if (!isPressed) {
    if (mouse(mb_left, MOUSE.RELEASE)) {
        Quiz.answerButtonPress();
    } else if (mouse(mb_left, MOUSE.HOLD)) {
        image_index = 2;
    } else if (mouse_hover()) {
        image_index = 1;
    } else {
        image_index = 0;
    }
}