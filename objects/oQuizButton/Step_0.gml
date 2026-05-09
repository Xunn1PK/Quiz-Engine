if (image_alpha <= 0) {
    str = methods.getStr(ButtonID);
    correct = methods.isCorrect(ButtonID);
}

if (!isPressed && global.answersActive) {
    if (mouse(mb_left, MOUSE.RELEASE)) {
        methods.onMouseReleased();
    } else if (mouse(mb_left, MOUSE.HOLD)) {
        methods.onMouseHold();
    } else if (mouse_hover()) {
        methods.onMouseHover();
    } else {
        methods.callbackStatic();
    }
}