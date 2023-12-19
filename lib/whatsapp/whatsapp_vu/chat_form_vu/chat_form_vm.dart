import 'package:flutter/material.dart';
import 'package:my_app/whatsapp/whatsapp_vu/chat_vu/chat_model.dart';
import 'package:stacked/stacked.dart';

class ChatFormVM extends BaseViewModel {
  ChatModel? chatModel;
  String? chatName;
  String? message;
  final formKey = GlobalKey<FormState>();
  String? onValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'This Field is required';
    }
    return null;
  }

  onSaveChat(BuildContext context) {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      chatModel = ChatModel(chatName: chatName, message: message);
      Navigator.pop(context, chatModel);
    }
  }

  onChatNameSave(String? value) {
    chatName = value;
  }

  onMessageSaved(String? value) {
    message = value;
  }
}
