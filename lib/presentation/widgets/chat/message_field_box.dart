import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  const MessageFieldBox({super.key});

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;
    final textController=TextEditingController();
    final focusNode=FocusNode();

    final outlinedInputBorder = UnderlineInputBorder(
      borderSide: const BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.circular(20),
    );

    final inputDecoration= InputDecoration(
        hintText: 'Ingresa tu mensaje',
        focusedBorder: outlinedInputBorder,
        enabledBorder: outlinedInputBorder,
        filled: true,

        suffixIcon: IconButton(onPressed: () {
          final textValue=textController.value.text;
          textController.clear();
        },icon: const Icon(Icons.send_outlined))
    );

    return TextFormField(
      onTapOutside: (event) {
        focusNode.unfocus();
      },
      focusNode: focusNode,
      controller: textController,
      keyboardAppearance: Brightness.dark,
      decoration: inputDecoration,
      onFieldSubmitted: (value) {
        textController.clear();
        focusNode.requestFocus();
      },
    );
  }
}
