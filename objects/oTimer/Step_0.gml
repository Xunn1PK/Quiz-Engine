if (!Quiz.getButtonsPressed()){
    if (global.timer > 0){
        global.timer -= 1 / game_get_speed(gamespeed_fps);
    } else if (global.timer == 0 && active){
        Quiz._answerButtonPress();
        active = false;
    } 
}

var maxTime = global.data[global.question].Time;
filledScale = (global.timer / maxTime) * image_xscale;