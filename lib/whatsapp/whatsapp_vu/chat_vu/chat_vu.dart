import 'package:flutter/material.dart';
import 'package:my_app/whatsapp/whatsapp_vu/chat_form_vu/chat_form_vu.dart';
import 'package:my_app/whatsapp/whatsapp_vu/chat_vu/chat_vm.dart';
import 'package:stacked/stacked.dart';

class ChatVU extends StackedView<ChatVM> {
  const ChatVU({super.key});

  @override
  Widget builder(BuildContext context, ChatVM viewModel, Widget? child) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: viewModel.chatList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(12),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return ChatFormVU(
                          chatModel: viewModel.chatList[index],
                        );
                      })).then((value) {
                        if (value != null) {
                          viewModel.onUpdateChat(value, index);
                        }
                      });
                    },
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 24,
                          backgroundColor: Colors.grey[350],
                          child: const Icon(
                            Icons.group,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                viewModel.chatList[index].chatName.toString(),
                                style: const TextStyle(
                                    fontWeight: FontWeight.w700),
                              ),
                              Text(
                                viewModel.chatList[index].message.toString(),
                                style: const TextStyle(
                                  color: Colors.grey,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Text(
                              'Date',
                              style: TextStyle(color: Colors.grey),
                            ),
                            InkWell(
                                onTap: () {
                                  viewModel.onDeleteChat(index);
                                },
                                child: const Icon(Icons.delete_outline,
                                    color: Colors.red)),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 36, 138, 59),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return ChatFormVU();
          })).then((value) {
            if (value != null) {
              viewModel.onAddChat(value);
            }
          });
        },
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  @override
  ChatVM viewModelBuilder(BuildContext context) {
    return ChatVM();
  }
}
