enum MOUSE {
    HOLD,
    PRESS,
    RELEASE
}

function mouse(button, type, hover = true){
    var m;
    var isHover = mouse_hover();
    switch (type){
        case MOUSE.HOLD:
            m = mouse_check_button(button);
        break;
        case MOUSE.PRESS:
            m = mouse_check_button_pressed(button);
        break;
        case MOUSE.RELEASE:
            m = mouse_check_button_released(button);
        break;
        default:
            m = 0;
        break;
    }
    if (hover){
        m *= isHover;
    }
    return m;
}

function mouse_hover(){
    return position_meeting(mouse_x, mouse_y, self);
}