currentQuestion = 0;
layout = global.layout.results;
TopBar = global.layout.results.TopBar;

#region Methods
updateQuestion = function(val) {
    //Increase/decrease question counter
    currentQuestion += val;
    currentQuestion = wrapValue(currentQuestion, 0, array_length(global.playerAnswers) - 1);
    
    //Update question number text
    ui_get("results-question-num").setText($"[{qNum.color}][scale, {qNum.scale}]Question {currentQuestion + 1}");
    
    //Update player answer text and color
    var playerAnsw = layout.PlayerAnswer;
    var color = isAnswerCorrect(currentQuestion, global.playerAnswers[currentQuestion]) ? playerAnsw.text_color.correct : playerAnsw.text_color.incorrect;
    var blend = isAnswerCorrect(currentQuestion, global.playerAnswers[currentQuestion]) ? playerAnsw.blend.correct : playerAnsw.blend.incorrect;
    ui_get("results-player-answer").setText($"[{color}]{getAnswer(currentQuestion, global.playerAnswers[currentQuestion]).str}").setImageBlend(make_color_rgb(blend[0], blend[1], blend[2]));
    
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
text = new UIText("results-question-num", qNum.x, qNum.y, $"[{qNum.color}][scale, {qNum.scale}]Question {currentQuestion + 1}", qNum.anchor);
topBar.add(text);
#endregion


#region Results
//Player answer
var playerAnsw = layout.PlayerAnswer;
var color = isAnswerCorrect(currentQuestion, global.playerAnswers[currentQuestion]) ? playerAnsw.text_color.correct : playerAnsw.text_color.incorrect;
var blend = isAnswerCorrect(currentQuestion, global.playerAnswers[currentQuestion]) ? playerAnsw.blend.correct : playerAnsw.blend.incorrect;

button = new UIButton("results-player-answer", playerAnsw.x, playerAnsw.y, sprite_get_width(sButton) * playerAnsw.xscale, sprite_get_height(sButton) * playerAnsw.yscale, $"[{color}]{getAnswer(currentQuestion, global.playerAnswers[currentQuestion]).str}", sButton, playerAnsw.anchor);
button.setImageBlend(make_color_rgb(blend[0], blend[1], blend[2]));

text = new UIText("results-player-answer-label", playerAnsw.label.xoffset, playerAnsw.label.yoffset, $"[{playerAnsw.label.color}][scale, {playerAnsw.label.scale}]Your answer:");

button.add(text);
panel.add(button);


//Question
var questionTxt = layout.Question;
text = new UIText("results-question-text", questionTxt.x, questionTxt.y, $"[{questionTxt.color}][scale, {questionTxt.scale}]{global.data[currentQuestion].Question}", questionTxt.anchor);
panel.add(text);
#endregion