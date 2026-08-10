import 'package:flutter/material.dart';
import 'package:responsive_app/model/massege_model.dart';
import 'package:responsive_app/widgets/bubble_massege.dart';
import 'package:responsive_app/widgets/custem_button.dart';
import 'package:responsive_app/widgets/custem_textfield.dart';

class ChatScree extends StatefulWidget {
  const ChatScree({super.key});

  @override
  State<ChatScree> createState() => _ChatScreeState();
}

class _ChatScreeState extends State<ChatScree> {
  final TextEditingController _textEditingController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    _textEditingController.dispose();
    super.dispose();
  }

  List<MassegeModel> masseges = [
    MassegeModel(massege: 'Hello, how are you?', isMe: true),
    MassegeModel(massege: 'I am good, thanks! How about you?', isMe: false),
    MassegeModel(massege: 'I am doing well too.', isMe: true),
    MassegeModel(massege: 'That\'s great to hear!', isMe: false),
    MassegeModel(massege: 'Yes, indeed!', isMe: true),
    MassegeModel(massege: 'Yes, indeed!', isMe: true),
    MassegeModel(massege: 'That\'s great to hear!', isMe: false),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 17, 18, 25),

      body: LayoutBuilder(
        builder: (context, constraints) {
          return SafeArea(
            child: Column(
              children: [
                SizedBox(
                  height: constraints.maxHeight * 0.1,
                  child: Row(
                    mainAxisAlignment: .spaceBetween,
                    children: [
                      Expanded(
                        child: FractionallySizedBox(
                          alignment: .topLeft,
                          widthFactor: constraints.maxWidth > 600 ? 0.2 : 0.5,
                          child: Row(
                            mainAxisAlignment: .spaceEvenly,
                            children: [
                              Container(
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  gradient: LinearGradient(
                                    colors: [
                                      Color(0xFF2F80ED),
                                      Color(0xFF00C6FF),
                                    ],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                  ),
                                ),
                                child: const CircleAvatar(
                                  radius: 27,
                                  backgroundColor: Colors.transparent,
                                  child: Text(
                                    'SC',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text(
                                    'Sarah Connor',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    '. Online',
                                    style: TextStyle(
                                      fontSize: 17,
                                      color: Color.fromARGB(255, 32, 210, 38),
                                      fontWeight: .w700,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Icon(Icons.more_vert, color: Colors.white, size: 30),
                    ],
                  ),
                ),
                Divider(thickness: 0.5, color: Colors.grey.withOpacity(0.5)),
                SizedBox(height: constraints.maxHeight * 0.02),
                Flexible(
                  flex: 12,
                  child: ListView.builder(
                    controller: _scrollController,
                    itemCount: masseges.length,
                    itemBuilder: (context, index) {
                      final message = masseges[index];
                      return Padding(
                        padding: EdgeInsets.all(constraints.maxHeight * 0.01),
                        child: Align(
                          alignment: message.isMe
                              ? Alignment.centerRight
                              : Alignment.centerLeft,
                          child: BubbleMassege(message: message),
                        ),
                      );
                    },
                  ),
                ),
                Flexible(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustemTextfield(
                        hintText: 'Type a message',
                        widthFactor: constraints.maxWidth > 600
                            ? constraints.maxWidth * 0.7
                            : constraints.maxWidth * 0.8,
                        controller: _textEditingController,
                      ),
                      SizedBox(width: 10),
                      CustemButton(
                        onTap: () {
                          setState(() {
                            if (_textEditingController.text == 'clear') {
                              masseges.clear();
                            } else {
                              masseges.add(
                                MassegeModel(
                                  massege: _textEditingController.text,
                                  isMe: true,
                                ),
                              );
                            }
                            _textEditingController.clear();
                            WidgetsBinding.instance.addPostFrameCallback((_) {
                              if (_scrollController.hasClients) {
                                _scrollController.animateTo(
                                  _scrollController
                                      .position
                                      .maxScrollExtent, // أقصى نقطة في الأسفل
                                  duration: const Duration(
                                    milliseconds: 300,
                                  ), // مدة الحركة (نصف ثانية تقريباً)
                                  curve: Curves.easeOut, // انسيابية الحركة
                                );
                              }
                            });
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
