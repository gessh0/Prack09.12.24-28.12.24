import 'package:flutter/material.dart';

class FocusForm extends StatefulWidget {
  const FocusForm({super.key});

  @override
  State<FocusForm> createState() => _FocusFormState();
}

class _FocusFormState extends State<FocusForm> {
  final FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(
      children: [
        Row(
          children: [
            Expanded(child: TextFormField()),
          ],
        ),
        Focus(
          canRequestFocus: false,
          onFocusChange: (value) {
            print('$value');
          },
          descendantsAreTraversable: false,
          descendantsAreFocusable: false,
          child: Row(
            children: [
              Expanded(
                  child: TextFormField(
                focusNode: focusNode,
              )),
            ],
          ),
        ),
        Row(
          children: [
            Expanded(child: TextFormField()),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                  child: ElevatedButton(
                onPressed: () {
                  focusNode.requestFocus();
                },
                child: const Text('Фокус второй'),
              )),
            ],
          ),
        ),
        FocusTraversalGroup(
          policy: OrderedTraversalPolicy(),
            child: Column(
          children: [
            FocusTraversalOrder(
              order: NumericFocusOrder(2),
              child: Row(
                children: [
                  Expanded(child: TextFormField()),
                ],
              ),
            ),
            FocusTraversalOrder(
              order: NumericFocusOrder(1),
              child: Row(
                children: [
                  Expanded(child: TextFormField()),
                ],
              ),
            ),
            FocusTraversalOrder(
              order: NumericFocusOrder(3),
              child: Row(
                children: [
                  Expanded(child: TextFormField()),
                ],
              ),
            ),
          ],
        ))
      ],
    )));
  }
}
