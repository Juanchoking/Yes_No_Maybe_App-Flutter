import 'package:flutter/material.dart';
import 'package:yes_no_app/presentation/widgets/chat/her_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_app/presentation/widgets/chat/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});


  //Siempre que sea un Screen, retornamos un Scaffold()
  //Scaffold: implementa un diseño de material, da bases para
  // menu lateral, snack-bars, appbars, bottom sheets y más.

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQs51p6HIoccqghVeEh4l4nJv1hNRs84Yc5FA&s') ,
          ),
        ),
        title: const Text('Scarlett ║ Black widow'),
        centerTitle: false,
      ),
      //ESTE _ChatView se crea con la misma palabra como metodo, luego ctrl .
      //y extraer widget... para que no quede como el appbar de linea  16
      // se hace un widget aparte
      body: _ChatView(),
    );
  }
}

class _ChatView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric( horizontal: 10 ),
        child: Column(
          children: [

            //Todo el espacio disponible que el padre le de con expanded
            Expanded(
              child:ListView.builder(
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return ( index % 2 == 0 )
                  ? const HerMessageBubble()
                  : const MyMessageBubble();
                },
              ),
            ),
            //Caja de texto Shared/message_field_box
            const MessageFieldBox()
        
          ],
        ),
      ),
    );
  }
}