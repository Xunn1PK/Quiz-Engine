#region Common
global.localization = json_load("Localizations/en-US.json");

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
global.creationCode = [];
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