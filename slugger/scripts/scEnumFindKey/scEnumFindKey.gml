function enum_find_key(enum_type, key_string) {
    var keys = variable_struct_get_names(enum_type); // Get all enum keys
    for (var i = 0; i < array_length(keys); i++) {
        if (keys[i] == key_string) {
            return enum_type[$keys[i]]; // Return the value of the matched key
        }
    }
    return undefined; // If key is not found
}