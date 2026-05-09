currentQuestion = 0;
layout = global.layout.results;
TopBar = global.layout.results.TopBar;

updateQuestion = function(val) {
    currentQuestion += val;
    currentQuestion = wrapValue(currentQuestion, 0, array_length(global.playerAnswers) - 1);
    ui_get("results-question-num").setText($"[{qNum.color}][scale, {qNum.scale}]Question: {currentQuestion + 1}");
}

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