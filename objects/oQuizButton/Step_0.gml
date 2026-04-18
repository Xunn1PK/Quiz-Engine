if (!isPressed) {
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