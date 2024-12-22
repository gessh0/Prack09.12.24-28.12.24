import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CommaTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String truncated = newValue.text;
    final TextSelection newSelection = newValue.selection;

    if (newValue.text.contains(',')) {
      truncated = newValue.text.replaceFirst(',', '.');
    }
    return TextEditingValue(text: truncated, selection: newSelection);
  }
}

class FormPage extends StatefulWidget{
  const FormPage({super.key});

  @override  
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage>{
  final GlobalKey<FormState> formKey= GlobalKey<FormState>();

  final loginTextFieldController=TextEditingController();
  final passwordTextFieldController=TextEditingController();

  String? selectedValue;
  
  bool? checkBoxValue;

  String radioValue='Radio 1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(child: TextFormField(
                      autofocus: true,
                      controller: loginTextFieldController,
                      inputFormatters: [
                       CommaTextInputFormatter(),
                      ],
                      decoration: const InputDecoration(
                        hintText:'Логин'),
                      validator: (value) {
                        if (value == null || value.isEmpty){
                          return 'Введите логин';
                        }
                        return null;
                      },
                    )),
                ],
                ),
              ),
               Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: passwordTextFieldController,
                        obscureText: true,
                      decoration: const InputDecoration(
                        hintText:'Пароль'),
                      validator: (value) {
                        if (value == null || value.isEmpty){
                          return 'Введите пароль';
                        }
                        return null;
                      },
                    )),
                ],
                ),
              ),
              Row(
                children: [
                  Expanded(child: DropdownButtonFormField(
                    value: selectedValue,
                    items: const [
                        DropdownMenuItem(child: Text("USA",style: TextStyle(color: Colors.deepPurple)),value: "USA" ),
                        DropdownMenuItem(child: Text("Canada",style: TextStyle(color: Color.fromARGB(255, 58, 183, 106))),value: "Canada"),
                        DropdownMenuItem(child: Text("Brazil",style: TextStyle(color: Color.fromARGB(255, 183, 98, 58))),value: "Brazil"),
                        DropdownMenuItem(child: Text("England",style: TextStyle(color: Color.fromARGB(255, 183, 58, 110))),value: "England"),
                    ],
                    onChanged: (value){
                      setState(() {
                        selectedValue=value;
                      });
                    }
                  ))
                ],
              ),
              Padding(padding: const EdgeInsets.all(8.0),
              child: Checkbox(
                value:checkBoxValue,
                tristate: true,
                onChanged: (value){
                  setState(() {
                    checkBoxValue=value;
                  });
                }
              ),
              ),
              Padding(padding: const EdgeInsets.all(8.0),
              child: Radio(
                groupValue: radioValue,
                value:'Radio1',
                onChanged: (value){
                  setState(() {
                    radioValue=value ?? '';
                  });
                }
              ),
              ),
              Padding(padding: const EdgeInsets.all(8.0),
              child: Radio(
                groupValue: radioValue,
                value:'Radio2',
                onChanged: (value){
                  setState(() {
                    radioValue=value ?? '';
                  });
                }
              ),
              ),
              Padding(padding: const EdgeInsets.all(8.0),
              child: Radio(
                groupValue: radioValue,
                value:'Radio3',
                onChanged: (value){
                  setState(() {
                    radioValue=value ?? '';
                  });
                }
              ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    ElevatedButton(onPressed: submitForm, child: const Text('Войти'))
                ],),
              )
            ],
          ),
        )),
    );
  }

  Future<void> submitForm() async {
    if (formKey.currentState?.validate()?? false) {
      /*final result = await showDialog(
        context: context, builder: (context) {
        return AlertDialog(
          title: const Text('Данные формы'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Логин: ${loginTextFieldController.text}'),
              Text('Пароль: ${passwordTextFieldController.text}'),
            ],
            ),
            actions: [
              ElevatedButton(onPressed: () {
                Navigator.of(context).pop(true);
              }, child: Text('OK')),
              ElevatedButton(onPressed: () {
                  Navigator.of(context).pop(null);
              }, child: Text('Отмена')),
            ],
        );
      });
          print(result);*/
        final snackBar= SnackBar(
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Логин: ${loginTextFieldController.text}'),
              Text('Пароль: ${passwordTextFieldController.text}'),
            ],
            ),
            action: SnackBarAction(label: 'OK', onPressed: () {}),
            );

            ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}