layout = global.layout.Question;

qX = layout.x;
qY = layout.y;

moveQuestion = function(target_x, target_y, time, easing) {
    TweenFire(oQuizUI, easing, 0, true, 0, time, "oQuizUI.qX", oQuizUI.qX, target_x);
    TweenFire(oQuizUI, easing, 0, true, 0, time, "oQuizUI.qY", oQuizUI.qY, target_y);
}

changeAlpha = function(inst_or_obj, easing, time, target) {
    var start = target == 1 ? 0 : 1;
    TweenFire(inst_or_obj, easing, 0, true, 0, time, "image_alpha", start, target);
}

moveQuestion(layout.start_x, layout.start_y, layout.move_time, EASING[layout.easing]);