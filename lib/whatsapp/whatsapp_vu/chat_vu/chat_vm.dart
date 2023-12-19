import 'package:stacked/stacked.dart';

import 'chat_model.dart';

class ChatVM extends BaseViewModel {
  List<ChatModel> chatList = [
    ChatModel(chatName: 'Mudassir', message: 'Available'),
    ChatModel(chatName: 'Sayad', message: ' Not Available'),
    ChatModel(chatName: 'Hassan', message: 'Not Available'),
    ChatModel(chatName: 'Qamar', message: 'Available'),
    ChatModel(chatName: 'Haider', message: 'Available'),
    ChatModel(chatName: 'Hamza', message: 'Available'),
  ];

  onDeleteChat(int value) {
    chatList.removeAt(value);
    notifyListeners();
  }

  onAddChat(value) {
    chatList.add(value);
    notifyListeners();
  }

  onUpdateChat(value, int index) {
    chatList[index] = value;
    notifyListeners();
  }
}
