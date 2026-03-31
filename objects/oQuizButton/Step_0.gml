if (mouse(mb_left, MOUSE.RELEASE)){
    if (is_method(callback.onMousePressed) && !isPressed){
        callback.onMousePressed();
    }
}