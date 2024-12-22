

void main() {
  baseExample();
}

const count=5;
void baseExample(){
  print('count = $count');

  var countVar=5;
  countVar++;
  print('countVar=${countVar.runtimeType}');
  print('countVar=$countVar');

  final List<int> list=[];
  list.add(1);
  print(list);
}

void nullSafetyExample(){
  
}