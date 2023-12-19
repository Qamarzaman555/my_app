import 'package:flutter/material.dart';
import 'package:my_app/whatsapp/whatsapp_vu/whatsapp_vm.dart';
import 'package:stacked/stacked.dart';

import 'chat_vu/chat_vu.dart';

class WhatsappVU extends StackedView<WhatsappVM> {
  const WhatsappVU({super.key});

  @override
  Widget builder(BuildContext context, WhatsappVM viewModel, Widget? child) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color.fromARGB(255, 36, 138, 59),
            title: const Text(
              'WhatsApp',
              style: TextStyle(color: Colors.white),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon:
                    const Icon(Icons.camera_alt_outlined, color: Colors.white),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.search, color: Colors.white),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.more_vert, color: Colors.white),
              ),
            ],
            bottom: TabBar(
              indicatorWeight: 4,
              indicatorSize: TabBarIndicatorSize.tab,
              unselectedLabelColor: Colors.white54,
              indicatorColor: Colors.white,
              labelColor: Colors.white,
              tabs: [
                Tab(icon: Icon(Icons.groups)),
                Tab(text: 'Chats'),
                Tab(text: 'Updates'),
                Tab(text: 'Calls'),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              Center(child: Text('Community')),
              ChatVU(),
              Center(child: Text('Updates')),
              Center(child: Text('Calls')),
            ],
          )),
    );
  }

  @override
  WhatsappVM viewModelBuilder(BuildContext context) {
    return WhatsappVM();
  }
}
