import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:async/async.dart';


class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String _search;
  int _offset = 0;

 Future<Map>  _getGifs() async {
    http.Response response;
    if(_search == null)
      response = await http.get(Uri.parse("https://api.giphy.com/v1/gifs/trending?api_key=ZNvYEAFGLjlI3GapN8fVUllxN1g97FXC&limit=25&rating=g"));
      else
        response = await http.get(Uri.parse("https://api.giphy.com/v1/gifs/search?api_key=ZNvYEAFGLjlI3GapN8fVUllxN1g97FXC&q=$_search&limit=20&offset=$_offset&rating=g&lang=pt"));

      return json.decode(response.body);
    }

    @override
    void initState(){
   super.initState();

   _getGifs().then((map){
     print(map);

   });
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Image.network("https://developers.giphy.com/branch/master/static/header-logo-0fec0225d189bc0eae27dac3e3770582.gif"),
        centerTitle: true,
      )
          backgroundColor: Colors.black,
      body: Column(
        children: <Widget>[
          Pedding(
            padding: EdgeInsets.all(10.0),
            child: TextField(
              decoration: InputDecoration(
                  labelText: "Pesquise aqui!",
                  labelStyle: TextStyle(color: Colors.white),
                  border:  OutlinedBorder()
              ),
              style: TextStyle(color: Colors.white, frontSize: 18.0),
              textAlign: TextAlign.center,
            )
          )
        ],
      )
    );
  }
}
