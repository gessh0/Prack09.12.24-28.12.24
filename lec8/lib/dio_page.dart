

import 'package:flutter/material.dart';
import 'package:lec8/album_model.dart';
import 'package:dio/dio.dart';
import 'package:lec8/rest_album_provider.dart';

class AlbumDioProvider{
  final Dio dio = Dio();


  Future<List<AlbumModel>> fetchAlbums(CancelToken cancelToken) async{
   final response = await  dio
   .get('https://jsonplaceholder.typicode.com/albums', cancelToken: cancelToken);
      
  return (response.data as List).map((e)=>AlbumModel.fromJson(e)).toList();
  }

  Future<int> createAlbum(AlbumModel model) async {
    final response= await dio.post(
      'https://jsonplaceholder.typicode.com/albums',data: model);

    return response.statusCode??0;
  }
}

class DioPage extends StatefulWidget{
  const DioPage({super.key});

  @override
  State<DioPage> createState() => _DioPageState();
}
class _DioPageState extends State<DioPage>{
  late final AlbumDioProvider albumDioProvider;
  late final RestAlbumProvider restAlbumProvider;
  Future<List<AlbumModel>>? future;

  @override
  void initState(){
      super.initState();
      albumDioProvider=AlbumDioProvider();
      restAlbumProvider=RestAlbumProvider(Dio());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  ElevatedButton(onPressed: () {
                    setState(() {
                      // final cancelToken=CancelToken();
                      // future=albumDioProvider.fetchAlbums(cancelToken);
                      // cancelToken.cancel();
                      future = restAlbumProvider.fetchAlbums();
                    });
                  }, child: const Text('Альбомчики хихихи')),
                   ElevatedButton(onPressed: () async {
                  
                      // final result = await albumDioProvider.createAlbum(
                      //   const AlbumModel(userId: 1, id: 3, title: 'Myahahaha'));
                      final result = await restAlbumProvider.createAlbum(const AlbumModel(userId: 1, id: 3, title: 'Myahahaha'));
                    if (mounted){
                       showDialog(
                        context: context,
                        builder: (context){
                          return AlertDialog(
                            title: Text('Запрос сделан с кодом ${result.response.statusCode}'),
                      );
                    });
                    }
                  },
                   child: const Text('Создать альбом хиххихи')),
                ],
              ),
            
                FutureBuilder(future: future, builder: ((context, snapshot){
                  
                  if(snapshot.data !=null && snapshot.hasData){
                    return Column(
                      children: [
                        ...snapshot.data?.map((e) => Row(
                          children: [
                            Text('ID: ${e.id}'),
                            Expanded(child: Text(' Title: ${e.title }'))
                          ],
                          )) ?? []
                      ],
                    );
                  }

                  return const Text('Нет данных');
                }))
            ],
          ),
        ),
      ),
    );
  }
}