/* 
This script contains every constant (macros and enums) in the game
If you wish to add new constant, do it here
*/

#region Macros
#macro      Quiz            new _quizMethods()
#macro      Transition      oGameController.__transition
#macro      Sounds          new _sound()
#macro      Music           undefined
#endregion

#region Enums
enum TRANSITION_STATES {
    DISABLED,
    FADE_IN,
    FADE_OUT
}
#endregion