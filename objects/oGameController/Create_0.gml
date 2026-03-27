global.data = json_load("data.json");
global.layout = json_load("Layouts/default.json");
global.question = 1;
var panel = new UIPanel("PanelQuiz", 0, 0, 1280, 720, undefined);
panel.setResizable(false).setMovable(false).setVisible(false);