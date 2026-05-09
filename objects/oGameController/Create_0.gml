#region Common
global.version_num = "v0.2h";
global.version_name = "Beta 2 \"BREAK\" (Hotfix)";

scribble_font_set_default("fMain");
scribble_font_force_bilinear_filtering("fMain", false);
#endregion



#region Quiz
global.data = json_load("Data/data.json");
global.layout = {
    quiz: json_load("Data/Layouts/default-quiz.json"),
    results: json_load("Data/Layouts/default-results.json")
}
global.question = 0;
global.creationCode = [function(){return 0}];
global.timer = 0;
global.answersActive = false;
global.playerAnswers = [];
global.options = {
    nextQuestionDelay: 3,
    transitionFadeInLength: 0.25,
    transitionFadeOutLength: 0.25
}
#endregion



#region Editior
scribble_font_force_bilinear_filtering("fEditor", false);
#endregion


__transition = new _transition();