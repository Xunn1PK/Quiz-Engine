function showMsg(message){
    if (os_type == os_windows){
        show_message(message);
    } else {
        show_message_async(message);
    }
}