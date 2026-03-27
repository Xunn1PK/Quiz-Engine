layout = global.layout;
data = global.data;

question = data[global.question].Question;

var panel = ui_get("QuizPanel");
var text = new UIText("QuizQuestion", layout.Question.x, layout.Question.y, question);
text.setBinding(self, question);
panel.add(text);