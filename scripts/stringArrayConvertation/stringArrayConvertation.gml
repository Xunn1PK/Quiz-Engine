function string_to_array(str, data_type, remove_empty = true){
    var String = string_copy(str, 2, string_length(str) - 1);
    var splitedString = string_split(String, ",", remove_empty);
    var Array = array_create(array_length(splitedString), data_type(0));
    for (var i = 0; i < array_length(splitedString); i++){
        Array[i] = data_type(splitedString[i]);
    }
    return Array;
}

function array_to_string(array, spaces = true){
    var String = "[";
    for (var i = 0; i < array_length(array); i++){
        var elementStr = string(array[i]);
        var space = spaces ? " " : "";
        var stringToAdd;
        if (i < array_length(array) - 1){
            stringToAdd = $"{elementStr},{space}";
        } else {
            stringToAdd = elementStr;
        }
        String += stringToAdd;
    }
    return String;
}