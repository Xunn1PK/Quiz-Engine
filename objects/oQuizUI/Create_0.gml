var answer = global.layout.Answer;
var objects = global.layout.Object;
var data = global.data[global.question];
for (var i = 0; i < array_length(data.Answer); i++) {
    instance_create_depth(answer.pos[i].x, answer.pos[i].y, 0, oQuizButton, {
        "image_xscale": answer.xscale,
        "image_yscale": answer.yscale,
        "image_blend": make_colour_rgb(answer.color[i][0], answer.color[i][1], answer.color[i][2]),
        "ButtonID": i
    });
}
for (var i = 0; i < array_length(objects); i++) {
    var obj = objects[i];
    var inst = instance_create_depth(obj.x, obj.y, obj.depth, asset_get_index(obj.object), {
        "image_xscale": obj.xscale,
        "image_yscale": obj.yscale,
        "image_blend": make_colour_rgb(obj.blend[0], obj.blend[1], obj.blend[2]),
        "image_alpha": obj.alpha,
        "image_index": obj.image_index,
        "image_speed": obj.image_speed
    });
    if (obj.creation_code != -1) {
    }
}