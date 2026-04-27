/* 
This script contains every constant (macros and enums) in the game
If you wish to add new constant, do it here
*/

#region Macros
#macro      Quiz            new _quizMethods()
#macro      Transition      oGameController.__transition
#macro      Sounds          new _sound()
#macro      Music           new _music()

#macro      EASING         [EaseInSine, EaseOutSine, EaseInOutSine, EaseInQuad, EaseOutQuad, EaseInOutQuad, EaseInCubic, EaseOutCubic, EaseInOutCubic, EaseInQuart, EaseOutQuart, EaseInOutQuart, EaseInQuint, EaseOutQuint, EaseInOutQuint, EaseInExpo, EaseOutExpo, EaseInOutExpo, EaseInCirc, EaseOutCirc, EaseInOutCirc, EaseInBack, EaseOutBack, EaseInOutBack, EaseInBackSoft, EaseOutBackSoft, EaseInOutBackSoft, EaseInBackSofter, EaseOutBackSofter, EaseInOutBackSofter, EaseInElastic, EaseOutElastic, EaseInOutElastic, EaseInBounce, EaseOutBounce, EaseInOutBounce]
#endregion

#region Enums
enum TRANSITION_STATES {
    DISABLED,
    FADE_IN,
    FADE_OUT
}

enum EASINGS {
    IN_SINE,
    OUT_SINE,
    IN_OUT_SINE,
    IN_QUAD,
    OUT_QUAD,
    IN_OUT_QUAD,
    IN_CUBIC,
    OUT_CUBIC,
    IN_OUT_CUBIC,
    IN_QUART,
    OUT_QUART,
    IN_OUT_QUART,
    IN_QUINT,
    IN_OUT_QUINT,
    IN_EXPO,
    OUT_EXPO,
    IN_OUT_EXPO,
    IN_CIRC,
    OUT_CIRC,
    IN_OUT_CIRC,
    IN_BACK,
    OUT_BACK,
    IN_OUT_BACK,
    IN_BACK_SOFT,
    OUT_BACK_SOFT,
    IN_OUT_BACK_SOFT,
    IN_BACK_SOFTER,
    OUT_BACK_SOFTER,
    IN_OUT_BACK_SOFTER,
    IN_ELASTIC,
    OUT_ELASTIC,
    IN_OUT_ELASTIC,
    IN_BOUNCE,
    OUT_BOUNCE,
    IN_OUT_BOUNCE
}
#endregion