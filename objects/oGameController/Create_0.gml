global.data = json_load("Data/data.json");
global.layout = json_load("Data/Layouts/default.json");
global.question = 0;
global.creationCode = [function(){return 0}];
global.options = {
    "nextQuestionDelay": 3
}

scribble_font_set_default("fMain");
scribble_font_force_bilinear_filtering("fMain", false);
scribble_font_force_bilinear_filtering("fEditor", false);

#macro Quiz new _quizMethods()