/// @desc Converts array-like string (something like "[0, 1, 2]") in a array with real, string, int64, bool or ptr
/// @param {String} str Array-like string (something like "[0, 1, 2]")
/// @param {Function} data_type Desired elements data type (e.g. real, string, bool etc.)
/// @param {Boolean} remove_empty Whether should emptines (like spaces between value and comma etc.) be removed or not
/// @returns {Array<Any>}
function string_to_array(str, data_type, remove_empty = true){
    var String = string_copy(str, 2, string_length(str) - 1);
    var splitedString = string_split(String, ",", remove_empty);
    var Array = array_create(array_length(splitedString), data_type(0));
    for (var i = 0; i < array_length(splitedString); i++){
        Array[i] = data_type(splitedString[i]);
    }
    return Array;
}