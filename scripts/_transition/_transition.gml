function _transition() constructor {
    #region Private
    static __currentState = TRANSITION_STATES.DISABLED;
    static __isLocked = false;
    static __alpha = 0;
    static __inst = other;
    
    static __transitionStart = function() {
        __currentState = TRANSITION_STATES.FADE_IN;
        __isLocked = true;
    }
    
    static __transitionFadeOut = function() {
        __currentState = TRANSITION_STATES.FADE_OUT;
    }
    
    static __transitionEnd = function() {
        __currentState = TRANSITION_STATES.DISABLED;
        __isLocked = false;
    }
    
    static __roomGoto = function() {
        room_goto(_room);
        Transition.__transitionFadeOut();
    }
    #endregion
    
    
    
    
    #region System
    static _updateTransitionAlpha = function() {
        switch (__currentState) {
            case TRANSITION_STATES.FADE_IN:
                if (__alpha < 1){
                    __alpha += 1 / (global.options.transitionFadeInLength * game_get_speed(gamespeed_fps));
                }
                break;
            case TRANSITION_STATES.FADE_OUT:
                if (__alpha > 0){
                    __alpha -= 1 / (global.options.transitionFadeOutLength * game_get_speed(gamespeed_fps));
                }
                break;
        }
    }
    
    static _drawTransition = function() {
        //Get the previous color and alpha
        var prevColor = draw_get_color();
        var prevAlpha = draw_get_alpha();
        
        //Set depth, color and alpha
        draw_set_color(c_black);
        draw_set_alpha(__alpha);
        
        //Draw the transition itself
        draw_rectangle(0, 0, room_width, room_height, false);
        
        //Set alpha and color back to normal
        draw_set_color(prevColor);
        draw_set_alpha(prevAlpha);
    }
    #endregion
    
    
    
    
    #region Public
    static Goto = function(room, code_to_execute = undefined) {
        var fadeInLength = global.options.transitionFadeInLength;
        var fullLength = fadeInLength + global.options.transitionFadeOutLength;
        
        __transitionStart();
        
        //Executes code right when quiting current room, and entering target room (i.e. when screen is fully black)
        if (is_callable(code_to_execute)) {
            call_later(fadeInLength, time_source_units_seconds, code_to_execute);
        }
        
        
        call_later(fadeInLength, time_source_units_seconds, method({_room: room}, __roomGoto));
        call_later(fullLength, time_source_units_seconds, __transitionEnd);
    }
    #endregion
}