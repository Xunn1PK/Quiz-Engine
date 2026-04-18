function _quizButtonMethods() constructor {
    inst = other;
    
    isStatic = false;
    isHover = false;
    isHold = false;
    __setStates = function(_static, _hover, _hold){
        isStatic = _static;
        isHover = _hover;
        isHold = _hold;
    }
    
    callbackStatic = function() {
        //Code that should be executed on every tick
        inst.image_index = 0;
        
        //Code that should be executed only on 1st tick
        if (!isStatic){
            
            
            //Do NOT touch this!
            __setStates(true, false, false);
        }
    }
    onMouseHover = function() {
        //Code that should be executed on every tick
        inst.image_index = 1;
        
        //Code that should be executed only on 1st tick
        if (!isHover){
            audio_play_sound(sndMouseHover, 0, false);
            
            //Do NOT touch this!
            __setStates(false, true, false);
        }
    }
    onMouseHold = function() {
        //Code that should be executed on every tick
        inst.image_index = 2;
        
        //Code that should be executed only on 1st tick
        if (!isHold){
            audio_play_sound(sndMouseClick, 0, false);
            
            //Do NOT touch this!
            __setStates(false, false, true);
        }
    }
    onMouseReleased = function() {
        //Code to execute
        var snd = inst.correct ? sndCorrect : sndWrong;
        audio_play_sound(snd, 0, false);
        
        //Danger zone (do NOT touch this!)
        Quiz._answerButtonPress();
        __setStates(false, false, false);
    }
    
    static getStr = function(ButtonID) {
        return global.data[global.question].Answer[ButtonID].str;
    }
    static isCorrect = function(ButtonID) {
        return global.data[global.question].Answer[ButtonID].correct;
    }
}