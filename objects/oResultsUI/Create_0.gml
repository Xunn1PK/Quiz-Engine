currentQuestion = 0;
layout = global.layout.results;
TopBar = global.layout.results.TopBar;

var button, text, blend;

panel = new UIPanel("results", 0, 0, display_get_gui_width(), display_get_gui_height(), undefined).setResizable(false).setMovable(false);

#region Top Bar
var tbxsize = real(TopBar.x_size) < display_get_gui_width() ? TopBar.x_size : display_get_gui_width();
var tbysize = real(TopBar.y_size) < display_get_gui_height() ? TopBar.y_size : display_get_gui_height();
topBar = new UIPanel("results-top-bar", TopBar.x, TopBar.y, tbxsize, tbysize, sPanel, TopBar.anchor).setResizable(false).setMovable(false);

//Left button
var BLeft = TopBar.button_left;
blend = make_color_rgb(BLeft.blend[0], BLeft.blend[1], BLeft.blend[2]);
button = new UIButton("results-left", BLeft.x, BLeft.y, BLeft.x_size, BLeft.y_size, "[c_black][scale, 0.6][sArrow, 0]", sButton, BLeft.anchor);
button.setImageBlend(blend);
button.setImageMouseover(1).setImageClick(2).setCallback(UI_EVENT.LEFT_RELEASE, function() {
    currentQuestion--;
    currentQuestion = wrapValue(currentQuestion, 0, array_length(global.playerAnswers) - 1);
    ui_get("results-question-num").setText($"[{qNum.color}][x_scale, {qNum.x_scale}][y_scale, {qNum.y_scale}]Question: {currentQuestion + 1}");
});
topBar.add(button);

//Right button
var BRight = TopBar.button_right;
blend = make_color_rgb(BRight.blend[0], BRight.blend[1], BRight.blend[2]);
button = new UIButton("results-right", BRight.x, BRight.y, BRight.x_size, BRight.y_size, "[c_black][scale, 0.6][sArrow, 1]", sButton, BRight.anchor);
button.setImageMouseover(1).setImageClick(2).setCallback(UI_EVENT.LEFT_RELEASE, function() {
    currentQuestion++;
    currentQuestion = wrapValue(currentQuestion, 0, array_length(global.playerAnswers) - 1);
    ui_get("results-question-num").setText($"[{qNum.color}][x_scale, {qNum.x_scale}][y_scale, {qNum.y_scale}]Question: {currentQuestion + 1}");
});
topBar.add(button);

//Question number text
qNum = TopBar.question_num;
text = new UIText("results-question-num", qNum.x, qNum.y, $"[{qNum.color}][scale, {qNum.scale}]Question: {currentQuestion + 1}", qNum.anchor);
topBar.add(text);
#endregion