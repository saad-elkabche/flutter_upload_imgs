

import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:test_upload_img/components/button.dart';
import 'package:http/http.dart' as http;







class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<PlatformFile>? files;
  @override
  Widget build(BuildContext context) {

    double h=MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text("Saadev"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            files==null
                ?
                Container()
                :
                SizedBox(
                    height:h*0.3,
                    child: ListView.builder(
                      itemCount: files?.length ?? 0 ,
                      scrollDirection: Axis.horizontal,
                        itemBuilder: (contex,index){
                        //print(files!.elementAt(index).bytes!);
                          return kIsWeb
                            ?
                            Image.memory( files!.elementAt(index).bytes!,height: h*0.3,)
                              :
                              Image.file(File(files!.elementAt(index).path!));
                        }
                    )
                ),
            MyButton(label: 'pick', onclick:_pickFile),
            const SizedBox(height: 20,),
            files!=null
            ?
              MyButton(label: 'Send to sever', onclick:_sendFile)
            :
              Container(),
           // MyButton(label: 'test sever', onclick:_sendFile)

          ],
        ),
      ),
    );
  }

  void _pickFile() async{
    var result=await FilePicker.platform.pickFiles(allowMultiple: true,
        type: FileType.custom,
        allowedExtensions:['jpg','png','jpeg'],
        //withReadStream: true
        );

    print(result);
    if(result!=null){
      setState(() {
        files=result.files;
      });
    }

  }

  void _sendFile() async{

    //emulator    :  10.0.2.2
    //

   var uri=Uri.parse("http://192.168.1.114:8000/api/image");

     var request=http.MultipartRequest('POST', uri);

    for(PlatformFile file in files!){
     // print(file.path);
      //var multiPartFile=http.MultipartFile('images[]',file.readStream!,file.size,filename: file.name);
      var multiPartFile;
      if(kIsWeb){
        multiPartFile=http.MultipartFile.fromBytes('images[]',file.bytes!,filename: file.name);
      }else{
         multiPartFile=http.MultipartFile.fromPath('images[]',file.path!,filename: file.name);
      }
      request.files.add(await multiPartFile);
    }
    var result=await request.send();

    print("======================${result.statusCode}");


    /*var request=await http.post(uri,body: {
      "title":"title from web",
      "body":"test body 33333"
    });

    print("===========================${request.statusCode}");
*/



  }
}
