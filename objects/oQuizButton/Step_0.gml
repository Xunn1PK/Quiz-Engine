if (image_alpha <= 0) {
    str = methods.getStr(ButtonID);
    correct = methods.isCorrect(ButtonID);
    var color = global.layout.quiz.Answer.color[ButtonID];
    image_blend = make_colour_rgb(color[0], color[1], color[2]);
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