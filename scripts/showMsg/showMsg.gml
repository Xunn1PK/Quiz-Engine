function showMsg(message){
    if (os_type == os_android){
        show_message_async(message);
    } else {
        show_message(message);
    }
}