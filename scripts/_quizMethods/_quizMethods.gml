function _quizMethods() constructor {
    #region Private methods. Do NOT touch it outside of this constructor
    static __nextQuestion = function() {
        if (global.question < array_length(global.data) - 1) {
            global.question++;
        } else {
            room_goto(rMainMenu);
        }
    }
    
    static __executeCreationCode = function(inst, id) {
        with (inst) {
            if (is_method(global.creationCode[id])) {
                global.creationCode[id]();
            }
        }
    }
    
    static __resetTimer = function() {
        with (oTimer) {
            active = true;
            filledScale = image_xscale;
        }
        global.timer = global.data[global.question].Time;
    }
    
    static __layoutCreateAnswer = function(id) {
        var answer = global.layout.Answer;
        instance_create_depth(answer.pos[id].x, answer.pos[id].y, 0, oQuizButton, {
            "image_xscale": answer.xscale,
            "image_yscale": answer.yscale,
            "image_blend": make_colour_rgb(answer.color[id][0], answer.color[id][1], answer.color[id][2]),
            "ButtonID": id
        });
    }
    
    static __layoutCreateObject = function(id) {
        var obj = global.layout.Object[id];
        var inst = instance_create_depth(obj.x, obj.y, obj.depth, asset_get_index(obj.object), {
            "image_xscale": obj.xscale,
            "image_yscale": obj.yscale,
            "image_blend": make_colour_rgb(obj.blend[0], obj.blend[1], obj.blend[2]),
            "image_alpha": obj.alpha,
            "image_index": obj.image_index,
            "image_speed": obj.image_speed
        });
        if (obj.creation_code != -1) {
            __executeCreationCode(inst, obj.creation_code);
        }
    }
    #endregion
    
    #region System methods. In 99.9% cases you do NOT need to touch it
    static _init = function() {
        for (var i = 0; i < global.layout.Answer.count; i++) {
            __layoutCreateAnswer(i);
        }
        for (var i = 0; i < array_length(global.layout.Object); i++) {
            __layoutCreateObject(i);
        }
        __resetTimer();
    }
    
    static _answerButtonPress = function() {
        with (oQuizButton) {
            isPressed = true;
            image_index = correct ? 3 : 4;
        }
        call_later(global.options.nextQuestionDelay, time_source_units_seconds, function() {
            __nextQuestion();
            __resetTimer();
            with(oQuizButton) { 
                isPressed = false;
                image_index = 0;
            }
        });
    }
    #endregion
    
    #region Public methods.
    static getButtonsPressed = function() {
        return oQuizButton.isPressed;
    }
    #endregion
}