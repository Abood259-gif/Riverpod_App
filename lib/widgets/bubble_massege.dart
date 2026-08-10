import 'package:flutter/material.dart';
import 'package:responsive_app/model/massege_model.dart';

class BubbleMassege extends StatelessWidget {
  const BubbleMassege({super.key, required this.message , 

  });
  final MassegeModel message;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: message.isMe ? Color(0xFF2F80ED) : Color(0xFF1E202B),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        message.massege,
        style: TextStyle(color: Colors.white, fontSize: 16),
      ),
    );
    ;
  }
}
