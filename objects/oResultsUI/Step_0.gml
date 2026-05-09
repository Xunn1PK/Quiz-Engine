if (keyboard_check_pressed(vk_left)) {
    updateQuestion(-1);
}
if (keyboard_check_pressed(vk_right)) {
    updateQuestion(1);
}
if (keyboard_check_pressed(vk_escape)) {
    Transition.Goto(rMainMenu, function () {
        panel.destroy();
        topBar.destroy();
    });
}