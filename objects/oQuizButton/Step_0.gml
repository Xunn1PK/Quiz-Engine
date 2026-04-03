if (!isPressed) {
    if (mouse(mb_left, MOUSE.RELEASE)) {
        callback.onMouseReleased();
    } else if (mouse(mb_left, MOUSE.HOLD)) {
        callback.onMouseHold();
    } else if (mouse_hover()) {
        callback.onMouseHover();
    } else {
        callback.normal();
    }
}