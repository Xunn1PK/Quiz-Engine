var p = ui_get("main-menu");
var rel = UI_RELATIVE_TO.MIDDLE_LEFT;

var b = new UIButton("main-menu-button-start", 16, -96, 182, 64, "[#000000]Start", sButton, rel);
b.setImageMouseover(1).setImageClick(2);
b.setCallback(UI_EVENT.LEFT_RELEASE, function() {
    room_goto(rQuiz);    
    ui_get("main-menu").setVisible(false);
});
p.add(b);

b = new UIButton("main-menu-button-options", 16, 0, 182, 64, "[#000000]Options", sButton, rel);
b.setImageMouseover(1).setImageClick(2);
b.setCallback(UI_EVENT.LEFT_RELEASE, function() {
    //It'll be implemented later, when I'll do the options menu
    //room_goto(rOptions);
    //ui_get("main-menu").setVisible(false); 
});
p.add(b);

b = new UIButton("main-menu-button-exit", 16, 96, 182, 64, "[#000000]Exit", sButton, rel);
b.setImageMouseover(1).setImageClick(2);
b.setCallback(UI_EVENT.LEFT_RELEASE, function() {
    game_end();
});
p.add(b);