var p = new UIPanel("main-menu", 0, 0, display_get_gui_width(), display_get_gui_height(), undefined, UI_RELATIVE_TO.TOP_LEFT);

//Start button
var b = new UIButton("main-menu-button-start", 0, 128, 182, 64, "[#000000]Start", sButton);
b.setImageMouseover(1).setImageClick(2);
b.setCallback(UI_EVENT.LEFT_RELEASE, function() {
    Transition.Goto(rQuiz, function() {
        ui_get("main-menu").destroy();
    });
});
p.add(b);

//Options button
b = new UIButton("main-menu-button-options", -256, 128, 182, 64, "[#000000]Options", sButton);
b.setImageMouseover(1).setImageClick(2);
b.setCallback(UI_EVENT.LEFT_RELEASE, function() {
    //It'll be implemented later, when I'll do the options menu
    //room_goto(rOptions);
    //ui_get("main-menu").setVisible(false); 
});
p.add(b);

//Exit button
b = new UIButton("main-menu-button-exit", 256, 128, 182, 64, "[#000000]Exit", sButton);
b.setImageMouseover(1).setImageClick(2);
b.setCallback(UI_EVENT.LEFT_RELEASE, function() {
    game_end();
});
p.add(b);

//Logo sprite
var s = new UISprite("main-menu-logo", 0, -128, sLogo, sprite_get_width(sLogo), sprite_get_height(sLogo), 0);
p.add(s);