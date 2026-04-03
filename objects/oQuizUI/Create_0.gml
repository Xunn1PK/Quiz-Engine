for (var i = 0; i < array_length(global.data[global.question].Answer); i++) {
    Quiz._layoutCreateAnswer(i);
}
for (var i = 0; i < array_length(global.layout.Object); i++) {
    Quiz._layoutCreateObject(i);
}