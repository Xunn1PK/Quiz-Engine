if (global.timer == 0 && active){
    if (!Quiz.getButtonsPressed()){
        Quiz._answerButtonPress();
        active = false;
    }
} if (global.timer > 0){
    global.timer -= 1 / game_get_speed(gamespeed_fps);
}
var maxTime = global.data[global.question].Time;
filledScale = (global.timer / maxTime) * image_xscale;