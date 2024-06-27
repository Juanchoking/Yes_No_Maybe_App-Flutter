import "package:flutter/material.dart";

class MessageFieldBox extends StatelessWidget {
  const MessageFieldBox({super.key});

  @override
  Widget build(BuildContext context) {

    // TextEditing... es el campo de texto editable
    final textController = TextEditingController();

    //Se coloca para cuando un elemento necesita un foco
    final focusNode = FocusNode();

    final colors = Theme.of(context).colorScheme;

    final outlineInputBorder = UnderlineInputBorder(
                                borderSide: const BorderSide( color: Colors.transparent),
                                borderRadius: BorderRadius.circular(40)
                                );

    final inputDecoration = InputDecoration(
      hintText: 'End your message with a "?"',
        enabledBorder: outlineInputBorder ,
        focusedBorder: outlineInputBorder,
        filled: true,
        suffixIcon: IconButton(
                    icon: Icon(Icons.send_outlined),
                    onPressed: () {
                      final textValue = textController.value.text;
                      print('Button $textValue');
                      textController.clear();
                    },
        )
      );

    return TextFormField(
      //onTapOutside = cuando se toque fuera del campo de texto haga ...
      onTapOutside: (event) {
        //quita el foco del campo de texto
        focusNode.unfocus();
      },
      focusNode: focusNode,
      controller: textController,
      decoration: inputDecoration,
      onFieldSubmitted: (value) {
        print('Submit value $value');
        textController.clear();
        //Para despues de que se limpie, siempre, se mantiene el foco ahi
        focusNode.requestFocus();
      },
      // onChanged: (value) {
      //   print('Changed: $value');
      // },
    );
    
  }
}