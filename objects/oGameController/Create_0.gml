global.data = json_load("Data/data.json");
global.layout = json_load("Data/Layouts/default.json");
global.question = 0;
var panel = new UIPanel("PanelQuiz", 0, 0, 1280, 720, undefined);
panel.setResizable(false).setMovable(false);

scribble_font_set_default("fMain");
scribble_font_force_bilinear_filtering("fMain", false);
scribble_font_force_bilinear_filtering("fEditor", false);