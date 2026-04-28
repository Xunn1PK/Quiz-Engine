function wrapValue(value, min_val, max_val) {
    if (value < min_val) return max_val; 
    else if (value > max_val) return min_val; 
    else return value;
}