var panel = new UIPanel("main-menu", 0, 0, display_get_gui_width(), display_get_gui_height(), undefined, UI_RELATIVE_TO.TOP_LEFT);

//Start button
var button = new UIButton("main-menu-button-start", 0, 128, 182, 64, "[#000000]Start", sButton);
button.setImageMouseover(1).setImageClick(2);
button.setCallback(UI_EVENT.LEFT_RELEASE, function() {
    if (array_length(global.playerAnswers) == 0) {
        Transition.Goto(rQuiz, function() {
            ui_get("main-menu").destroy();
        });
    } else {
        var modal = new UIPanel("main-menu-play-again", 0, 0, 640, 280, sPanel).setModal(true).setResizable(false);
        var button = new UIButton("main-menu-play-again-yes", 32, -32, 182, 64, "[#000000]Yes", sButton, UI_RELATIVE_TO.BOTTOM_LEFT);
        button.setCallback(UI_EVENT.LEFT_RELEASE, function() {
            ui_get("main-menu-play-again").destroy();
            Transition.Goto(rQuiz, function() {
                ui_get("main-menu").destroy();
            });
        });
        button.setImageMouseover(1).setImageClick(2);
        modal.add(button);
        
        button = new UIButton("main-menu-play-again-yes", -32, -32, 182, 64, "[#000000]No", sButton, UI_RELATIVE_TO.BOTTOM_RIGHT);
        button.setCallback(UI_EVENT.LEFT_RELEASE, function() {
            array_delete(global.playerAnswers, 0, array_length(global.playerAnswers));
            ui_get("main-menu-play-again").destroy();
        });
        button.setImageMouseover(1).setImageClick(2);
        modal.add(button);
        
        var text = new UIText("main-menu-play-again-text", 0, 32, "[fa_top]Are you sure want to play again?\n\n[scale, 0.8][#FF0000]This will overwrite your current results!", UI_RELATIVE_TO.TOP_CENTER);
        modal.add(text);
    }
});
panel.add(button);

//Options button
button = new UIButton("main-menu-button-options", -256, 128, 182, 64, "[#000000]Options", sButton);
button.setImageMouseover(1).setImageClick(2);
button.setCallback(UI_EVENT.LEFT_RELEASE, function() {
    //It'll be implemented later, when I'll do the options menu
    //room_goto(rOptions);
    //ui_get("main-menu").setVisible(false); 
});
panel.add(button);

//Exit button
button = new UIButton("main-menu-button-exit", 256, 128, 182, 64, "[#000000]Exit", sButton);
button.setImageMouseover(1).setImageClick(2);
button.setCallback(UI_EVENT.LEFT_RELEASE, function() {
    Transition.Goto(room, game_end);
});
panel.add(button);

//Logo sprite
var sprite = new UISprite("main-menu-logo", 0, -128, sLogo, sprite_get_width(sLogo), sprite_get_height(sLogo), 0);
panel.add(sprite);