currentQuestion = 0;
layout = global.layout.results;
TopBar = global.layout.results.TopBar;

#region Methods
updateQuestion = function(val) {
    //Increase/decrease question
    currentQuestion += val;
    currentQuestion = wrapValue(currentQuestion, 0, array_length(global.playerAnswers) - 1);
    
    //Change question number text
    ui_get("results-question-num").setText($"[{qNum.color}][scale, {qNum.scale}]Question {currentQuestion + 1}");
    
    //Change player answer text and color
    var pb = other.layout.PlayerAnswer;
    var col = isAnswerCorrect(currentQuestion, global.playerAnswers[currentQuestion]) ? pb.text_color.correct : pb.text_color.incorrect;
    var blend = isAnswerCorrect(currentQuestion, global.playerAnswers[currentQuestion]) ? pb.blend.correct : pb.blend.incorrect;
    ui_get("results-player-answer").setText($"[{col}]{getAnswer(currentQuestion, global.playerAnswers[currentQuestion]).str}").setImageBlend(make_color_rgb(blend[0], blend[1], blend[2]));
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
var ALeft = TopBar.arrow_left;
sprite = new UISprite("results-arrow-left", ALeft.x, ALeft.y, sArrow, ALeft.width, ALeft.height, 0, ALeft.anchor);
sprite.setImageBlend(make_color_rgb(ALeft.blend[0], ALeft.blend[1], ALeft.blend[2]));
topBar.add(sprite);

//Arrow right
var ARight = TopBar.arrow_right;
sprite = new UISprite("results-arrow-right", ARight.x, ARight.y, sArrow, ARight.width, ARight.height, 1, ARight.anchor);
sprite.setImageBlend(make_color_rgb(ARight.blend[0], ARight.blend[1], ARight.blend[2]));
topBar.add(sprite);

//Question number text
qNum = TopBar.question_num;
text = new UIText("results-question-num", qNum.x, qNum.y, $"[{qNum.color}][scale, {qNum.scale}]Question {currentQuestion + 1}", qNum.anchor);
topBar.add(text);
#endregion


#region Results
//Player answer
var pb = layout.PlayerAnswer;
var col = isAnswerCorrect(currentQuestion, global.playerAnswers[currentQuestion]) ? pb.text_color.correct : pb.text_color.incorrect;
var blend = isAnswerCorrect(currentQuestion, global.playerAnswers[currentQuestion]) ? pb.blend.correct : pb.blend.incorrect;

button = new UIButton("results-player-answer", pb.x, pb.y, sprite_get_width(sButton) * pb.xscale, sprite_get_height(sButton) * pb.yscale, $"[{col}]{getAnswer(currentQuestion, global.playerAnswers[currentQuestion]).str}", sButton, pb.anchor);
button.setImageBlend(make_color_rgb(blend[0], blend[1], blend[2]));

text = new UIText("results-player-answer-label", pb.label.xoffset, pb.label.yoffset, $"[{pb.label.color}]Your answer:");

button.add(text);
panel.add(button);
#endregion