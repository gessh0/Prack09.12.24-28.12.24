import 'package:flex_color_picker/flex_color_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lec10/bloc/color_bloc.dart';
import 'package:lec10/main.dart';
class BlockPage extends StatelessWidget{
  const BlockPage({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: colorBloc,
      child: Scaffold(
        appBar: AppBar(),
        body: SafeArea(child: Center(
          child: BlocBuilder<ColorBloc, ColorState>(builder: ((context,state){
            return Column(
              children: [
                Container(
                  width: 200,
                  height: 200,
                  color: state.color,
                  child: Column(children: [
                    Text(state.color.toString()),
                    ElevatedButton(
                      onPressed: () {
                        context.read<ColorBloc>().add(NewRandomColorEvent());
                      },
                       child: const Text('Рандом цвет')),
                        ElevatedButton(
                      onPressed: () {
                        context.read<ColorBloc>().add(ResetColorEvent());
                      },
                       child: const Text('Сброс цвета')),
                    ElevatedButton(onPressed: (){
                      Navigator.of(context).pushNamed('/second');
                    }, child: const Text('Вторая страница'))
                  ],),
                ),
                ColorPicker(color:state.color, onColorChanged: (color){
                  context.read<ColorBloc>().add(NewColorEvent(color: color));
                })
              ],
            );
          }),
        )),
      ),
      ),
    );
  }
}