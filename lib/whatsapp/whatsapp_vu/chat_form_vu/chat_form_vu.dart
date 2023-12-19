// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:my_app/whatsapp/whatsapp_vu/chat_form_vu/chat_form_vm.dart';
import 'package:my_app/whatsapp/whatsapp_vu/chat_vu/chat_model.dart';
import 'package:stacked/stacked.dart';

class ChatFormVU extends StackedView<ChatFormVM> {
  ChatFormVU({this.chatModel, super.key});
  ChatModel? chatModel;

  @override
  Widget builder(BuildContext context, ChatFormVM viewModel, Widget? child) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 36, 138, 59),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
            )),
        title: const Text(
          'Chat',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Form(
        key: viewModel.formKey,
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              TextFormField(
                initialValue: chatModel?.chatName,
                onSaved: viewModel.onChatNameSave,
                validator: viewModel.onValidator,
                decoration: InputDecoration(
                  labelText: 'Chat Name',
                  contentPadding: const EdgeInsets.all(8),
                  filled: true,
                  fillColor: Colors.grey[300],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              TextFormField(
                initialValue: chatModel?.message,
                onSaved: viewModel.onMessageSaved,
                validator: viewModel.onValidator,
                decoration: InputDecoration(
                  labelText: 'Message',
                  contentPadding: const EdgeInsets.all(8),
                  filled: true,
                  fillColor: Colors.grey[300],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () {
                    viewModel.onSaveChat(context);
                  },
                  child: const Text('Save'))
            ],
          ),
        ),
      ),
    );
  }

  @override
  ChatFormVM viewModelBuilder(BuildContext context) {
    return ChatFormVM();
  }
}
