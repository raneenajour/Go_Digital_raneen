import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:raneen_ajour_gd/data.dart';
import 'package:raneen_ajour_gd/dataModel.dart';
import 'package:raneen_ajour_gd/dataWidget.dart';

void main() {
  Map data={
    "ImageUrl":"https://media.istockphoto.com/id/537641744/photo/cosmos-flowe.webp?b=1&s=170667a&w=0&k=20&c=3c5ykUe31GV68JtZvsop_GCw0WXdL7kod7x-CEvpJPs="
    ,"name" :"Nusa Penida",
    "details":"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. "
        "Excepteur sint occaecat cupidatat non  proident,  sunt in culpa qui officia deserunt mollit anim id est laborum.",
    "picture":[
      "https://images.unsplash.com/photo-1663166722748-f896cfc682fb?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OXx8bGFrc3xlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60",
      "https://images.unsplash.com/photo-1645051049747-265f8c124875?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8bGFrc3xlbnwwfHwwfHx8MA%3D%3D&auto=format&fit=crop&w=500&q=60",
      "https://media.istockphoto.com/id/920377882/photo/beautiful-landscape-with-high-mountains-with-illuminated-peaks-stones-in-mountain-lake.webp?b=1&s=170667a&w=0&k=20&c=MC2f_T1Tioyi4gzm62JeohBuEMEiyM5UTgcQYMBrVjo=",
      "https://media.istockphoto.com/id/1300970146/photo/impressive-summer-sunrise-on-eibsee-lake-with-zugspitze-mountain-range-sunny-outdoor-scene-in.webp?b=1&s=170667a&w=0&k=20&c=2_E1qtYHC0YXHaEOGmsX3voiByYh4kOpwdPzQ2y8o0E="
    ]
  };
  Model model = Model(data);

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
      home:Screen(model: model,)));
}


class Screen extends StatelessWidget{
  late Model model;

  Screen({required this.model});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
  return Scaffold(
    extendBodyBehindAppBar: true,
    appBar: AppBar(leading: Icon(Icons.arrow_back_ios),
    elevation:0.0 ,
      backgroundColor: Colors.transparent,
      actions: [Icon(Icons.more_vert)],
    ),
      body:
         Column(
          children: [dataWidget(model: model),],
      )
  );
  }
}
class dataWidget extends StatelessWidget{
  Model model;
  dataWidget({required this.model});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network(model.ImageUrl!, fit: BoxFit.fitHeight,height: 480,),
        Padding(
          padding: const EdgeInsets.only(top: 25.0,right: 280),
          child: Text(model.name!,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15)),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 12,top: 15),
          child: Text(model.details!),
        ),
           Padding(
             padding: const EdgeInsets.only(top: 10.0,right: 310),
             child: Text("Picture",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15)),
           ),
           Row(children: [
             Row(
               children: model.picture!.map((imageUrl) {
                 return SizedBox(
                     // width: 70,
                     // height: 60,
                     child: Padding(
                       padding: const EdgeInsets.only(left: 10.0,top: 10),
                       child:ClipRRect(
                           borderRadius: BorderRadius.circular(10),
                           child: Container(
                             width: 60,
                             height: 60,
                             child: Image.network(imageUrl, fit: BoxFit.cover),
                           ),
                         )
                     ));
               }).toList(),
               // children: model.picture!.map((picture) {
               //   return Image.network(model.picture as String);
               // }).toList(),

             ),
             SizedBox(
               width: 70,
               height: 60,
               child: Padding(
                 padding: const EdgeInsets.only(left:10.0),
                 child: Container(
                   decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)),
                   color: Colors.black54),
                   child: Center(
                       child: 
                   Text("+20",style: TextStyle(color: Colors.white),
                   ))
                   ,
                  // color: Colors.grey,
                 ),
               ),
             )
           ],),
        Padding(
          padding: const EdgeInsets.only(top: 18.0,left: 10),
          child: Row(children: [Text("More in Bell",style: TextStyle(color: Colors.green[800],fontSize: 15,fontWeight: FontWeight.bold),),
            Icon(Icons.navigate_next_rounded,color: Colors.green[800],),],),
        )

      ],
    );
  }

}


