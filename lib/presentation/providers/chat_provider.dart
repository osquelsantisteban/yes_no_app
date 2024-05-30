import 'package:flutter/material.dart';
import 'package:yes_no_app/config/helpers/get_yes_no_answer.dart';
import 'package:yes_no_app/domain/entities/message.dart';

class ChatProvider extends ChangeNotifier{

  final chatScrollController = ScrollController();
  final getYesNoAnswer = GetYesNoAnswer();

  List<Message> messageList = [
    Message(text: 'Puedo ver tu futuro, y puedes preguntarme algo, pero solo te diré "Si" o "No".', fromWho: FromWho.me),
    Message(text: 'Es importante terminar en signo de interrogación, Ej: Seré en el futuro rico?', fromWho: FromWho.me),
  ];

  Future<void> sendMessage(String text) async {
    
    if(text.isEmpty) return;
    final newMessage = Message(text: text, fromWho: FromWho.me);

    messageList.add(newMessage);

    notifyListeners();
    moveScrollToBottom();

    if(text.endsWith('?')){
      await herReply();
    }

    notifyListeners();
    moveScrollToBottom();
  }

  void moveScrollToBottom(){
    chatScrollController.animateTo(
      chatScrollController.position.maxScrollExtent, 
      duration: const Duration(milliseconds: 300), 
      curve: Curves.easeOut
      );
  }

  Future<void> herReply() async {
    final herMessage = await getYesNoAnswer.getAnswer(); 
    messageList.add(herMessage);
    notifyListeners();
    moveScrollToBottom();
  }

}