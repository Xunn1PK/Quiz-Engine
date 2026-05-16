currentQuestion = 0;
currentCorrectAnsw = 0;
layout = global.layout.results;
TopBar = global.layout.results.TopBar;

tid = TID.Results;

#region Methods
updateQuestion = function(val) {
    var button, text;
    
    //Increase/decrease question counter
    currentQuestion += val;
    currentQuestion = wrapValue(currentQuestion, 0, array_length(global.playerAnswers) - 1);
    
    //Reset 'currentCorrectAnsw'
    currentCorrectAnsw = 0;
    
    //Update question number text
    ui_get("results-question-num").setText($"[{qNum.color}][scale, {qNum.scale}]{tid.questionNum}{currentQuestion + 1}", true);
    
    //Update player answer text and color
    var playerAnsw = layout.PlayerAnswer;
    var color = global.playerAnswers[currentQuestion] != -1 && isAnswerCorrect(currentQuestion, global.playerAnswers[currentQuestion]) ? playerAnsw.text_color.correct : playerAnsw.text_color.incorrect;
    var blend = global.playerAnswers[currentQuestion] != -1 && isAnswerCorrect(currentQuestion, global.playerAnswers[currentQuestion]) ? playerAnsw.blend.correct : playerAnsw.blend.incorrect;
    var str = global.playerAnswers[currentQuestion] != -1 ? getAnswer(currentQuestion, global.playerAnswers[currentQuestion]).str : "-";
    button = ui_get("results-player-answer");
    text = ui_get("results-player-answer-text");
    text.setText($"[{color}]{str}", true);
    button.setImageBlend(make_color_rgb(blend[0], blend[1], blend[2]));
    
    //Update correct answer text
    var correctAnswStr = getAnswer(currentQuestion, getCorrectAnswers(currentQuestion)[currentCorrectAnsw]).str;
    text = ui_get("results-correct-answer-text");
    text.setText($"[{layout.CorrectAnswer.text_color}]{correctAnswStr}", true);
    
    //Update question text
    var questionTxt = layout.Question;
    ui_get("results-question-text").setText($"[{questionTxt.color}][scale, {questionTxt.scale}]{global.data[currentQuestion].Question}");
}
getAnswer = function(question, answer) {
    return global.data[question].Answer[answer];
}
getCorrectAnswers = function(question) {
    var correctAnswers = [];
    for (var i = 0; i < global.layout.quiz.Answer.count; i++) {
        if (getAnswer(question, i).correct) {
            array_push(correctAnswers, i);
        }
    }
    return correctAnswers;
}
isAnswerCorrect = function(question, answer) {
    var correctAnswers = getCorrectAnswers(question);
    for (var i = 0; i < array_length(correctAnswers); i++) {
        if (correctAnswers[i] == answer) {
            return true;
        }
    }
    
    return false;
}
#endregion

var button, sprite, text;
panel = new UIPanel("results", 0, 0, display_get_gui_width(), display_get_gui_height(), undefined).setResizable(false).setMovable(false);

#region Top Bar
var tbxsize = real(TopBar.x_size) < display_get_gui_width() ? TopBar.x_size : display_get_gui_width();
var tbysize = real(TopBar.y_size) < display_get_gui_height() ? TopBar.y_size : display_get_gui_height();
topBar = new UIPanel("results-top-bar", TopBar.x, TopBar.y, tbxsize, tbysize, sPanel, TopBar.anchor).setResizable(false).setMovable(false);

//Arrow left
var ArrowL = TopBar.arrow_left;
sprite = new UISprite("results-arrow-left", ArrowL.x, ArrowL.y, sArrow, ArrowL.width, ArrowL.height, 0, ArrowL.anchor);
sprite.setImageBlend(make_color_rgb(ArrowL.blend[0], ArrowL.blend[1], ArrowL.blend[2]));
topBar.add(sprite);

//Arrow right
var ArrowR = TopBar.arrow_right;
sprite = new UISprite("results-arrow-right", ArrowR.x, ArrowR.y, sArrow, ArrowR.width, ArrowR.height, 1, ArrowR.anchor);
sprite.setImageBlend(make_color_rgb(ArrowR.blend[0], ArrowR.blend[1], ArrowR.blend[2]));
topBar.add(sprite);

//Question number text
qNum = TopBar.question_num;
text = new UIText("results-question-num", qNum.x, qNum.y, $"[{qNum.color}][scale, {qNum.scale}]{tid.questionNum}{currentQuestion + 1}", qNum.anchor);
topBar.add(text);
#endregion


#region Results
//Player answer
var playerAnsw = layout.PlayerAnswer;
var color = global.playerAnswers[currentQuestion] != -1 && isAnswerCorrect(currentQuestion, global.playerAnswers[currentQuestion]) ? playerAnsw.text_color.correct : playerAnsw.text_color.incorrect;
var blend = global.playerAnswers[currentQuestion] != -1 && isAnswerCorrect(currentQuestion, global.playerAnswers[currentQuestion]) ? playerAnsw.blend.correct : playerAnsw.blend.incorrect;
var str = global.playerAnswers[currentQuestion] != -1 ? getAnswer(currentQuestion, global.playerAnswers[currentQuestion]).str : "-";

button = new UIButton("results-player-answer", playerAnsw.x, playerAnsw.y, sprite_get_width(sButton) * playerAnsw.xscale, sprite_get_height(sButton) * playerAnsw.yscale, "", sButton, playerAnsw.anchor);
button.setImageBlend(make_color_rgb(blend[0], blend[1], blend[2])).setInteractable(false);

text = new UIText("results-player-answer-text", 0, 0, $"[{color}]{str}");
text.setMaxWidth(sprite_get_width(sButton) * playerAnsw.xscale - 24);
button.add(text);

text = new UIText("results-player-answer-label", playerAnsw.label.xoffset, playerAnsw.label.yoffset, $"[{playerAnsw.label.color}][scale, {playerAnsw.label.scale}]{tid.playerAnswer}");

button.add(text);
panel.add(button);

//Correct answer
var correctAnsw = layout.CorrectAnswer;
var correctAnswStr = getAnswer(currentQuestion, getCorrectAnswers(currentQuestion)[currentCorrectAnsw]).str;
button = new UIButton("results-correct-answer", correctAnsw.x, correctAnsw.y, sprite_get_width(sButton) * correctAnsw.xscale, sprite_get_height(sButton) * correctAnsw.yscale, "", sButton, correctAnsw.anchor);
button.setImageBlend(make_color_rgb(correctAnsw.blend[0], correctAnsw.blend[1], correctAnsw.blend[2]));

text = new UIText("results-correct-answer-text", 0, 0, $"[{layout.CorrectAnswer.text_color}]{correctAnswStr}");
text.setMaxWidth(sprite_get_width(sButton) * correctAnsw.xscale - 24);
button.add(text);

button.setCallback(UI_EVENT.LEFT_RELEASE, function() {
    currentCorrectAnsw++;
    currentCorrectAnsw = wrapValue(currentCorrectAnsw, 0, array_length(getCorrectAnswers(currentQuestion)) - 1);
    
    var correctAnswStr = getAnswer(currentQuestion, getCorrectAnswers(currentQuestion)[currentCorrectAnsw]).str;
    var text = ui_get("results-correct-answer-text");
    text.setText($"[{layout.CorrectAnswer.text_color}]{correctAnswStr}", true);
});

text = new UIText("results-player-answer-label", correctAnsw.label.xoffset, correctAnsw.label.yoffset, $"[{correctAnsw.label.color}][scale, {correctAnsw.label.scale}]{tid.correctAnswer}");

button.add(text);
panel.add(button);

//Question
var questionTxt = layout.Question;
text = new UIText("results-question-text", questionTxt.x, questionTxt.y, $"[{questionTxt.color}][scale, {questionTxt.scale}]{global.data[currentQuestion].Question}", questionTxt.anchor);
panel.add(text);
#endregion