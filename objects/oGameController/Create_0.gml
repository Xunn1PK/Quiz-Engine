#region Common
scribble_font_set_default("fMain");
scribble_font_force_bilinear_filtering("fMain", false);
#endregion

#region MainMenu
new UIPanel("main-menu", 0, 0, room_width, room_height, undefined, UI_RELATIVE_TO.TOP_LEFT).setResizable(false).setDraggable(false);
#endregion

#region Quiz
global._quizMethods = new _quizMethods();
global.data = json_load("Data/data.json");
global.layout = json_load("Data/Layouts/default.json");
global.question = 0;
global.creationCode = [function(){return 0}];
global.timer = 0;
global.options = {
    "nextQuestionDelay": 3
}

#macro Quiz global._quizMethods
#endregion

#region Editior
scribble_font_force_bilinear_filtering("fEditor", false);
#endregion