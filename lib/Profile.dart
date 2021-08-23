import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  DateTime? _selectedDate;
  DateTime _initialDate=DateTime.now();
  TextEditingController date = TextEditingController(text: '16/10/1996');
  TextEditingController name = TextEditingController(text: 'saeed abdullah');
  TextEditingController email = TextEditingController(text: 'saeedabdullah17@gmail.com');
  TextEditingController phone = TextEditingController(text: '0096771666');
  File? path;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.indigoAccent,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Stack(

                  children: [
                    Image(image: AssetImage('assest/images/imgprofile.png')),
                    Container(

                      child: Center(
                        child: Stack(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 50),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(100),
                                child: Container(
                                  width: 200.0,
                                  height: 200.0,
                                  decoration: new BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: (path != null) ? Image.file(path ?? File('')) : Image.asset('assest/images/main.png'),
                                ),
                              ),
                            ),
                            Container(
                              width: 200,
                              height: 250,
                              alignment: Alignment.bottomRight,
                              child: InkWell(

                                child: Icon(Icons.camera_alt,color: Colors.indigoAccent, size: 50,),
                                onTap: ()async{
                                  await showDialog(context: context, builder: (context)=>AlertDialog(
                                    content: Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        IconButton(onPressed: ()async{
                                          await openCamera();
                                          Navigator.pop(context);
                                        },
                                            icon: Icon(Icons.camera_alt)),
                                        IconButton(onPressed: ()async{
                                          await openGallery();
                                          Navigator.pop(context);
                                        }, icon: Icon(Icons.image)),
                                      ],
                                    ),
                                  ));
                                },
                              ),
                            ),

                          ],

                        ),
                      ),
                    ),

/*
                    Center(

                      child: InkWell(
                        onTap: ()async{
                          await showDialog(context: context, builder: (context)=>AlertDialog(
                            content: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                IconButton(onPressed: ()async{
                                  await openCamera();
                                  Navigator.pop(context);
                                  },
                                    icon: Icon(Icons.camera_alt)),
                                IconButton(onPressed: ()async{
                                  await openGallery();
                                  Navigator.pop(context);
                                }, icon: Icon(Icons.image)),
                              ],
                            ),
                          ));
                        },
                        child: Container(
                          margin: EdgeInsets.only(top: 50),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(100),
                            child: Container(
                                width: 200.0,
                                height: 200.0,
                                decoration: new BoxDecoration(
                                    shape: BoxShape.circle,
                                ),
                              child: (path != null) ? Image.file(path ?? File('')) : Image.asset('assest/images/main.png'),
                            ),
                          ),
                        ),
                      ),
                    ),
*/

                  ],
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(name.text,
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold
                        ),),
                      IconButton(
                        onPressed: ()async{
                          await showDialog(context: context, builder: (_)=> AlertDialog(
                            title: Text('Name'),
                            content: TextField(
                              controller: name,
                            ),
                            actions: [
                              InkWell(
                                child: Text('Save'),
                                onTap: ()=> Navigator.pop(context,),
                              )
                            ],
                          ));
                          setState(() {
                            
                          });
                        },
                        icon: Icon(Icons.edit),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10, right: 10),
                  child: Column(
                    children: [
                      SizedBox(height: 50,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Icon(Icons.phone,),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Number',
                                  style: TextStyle(
                                    fontSize: 22,

                                  ),
                                ),
                                Text(phone.text,

                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black12
                                  ),
                                )
                              ],
                            ),
                          ),
                          IconButton(
                            onPressed: () async{
                              await showDialog(context: context, builder: (_)=> AlertDialog(
                                title: Text('Number'),
                                content: TextField(
                                  keyboardType: TextInputType.number,
                                  controller: phone,
                                ),
                                actions: [
                                  InkWell(
                                    child: Text('Save'),
                                    onTap: ()=> Navigator.pop(context,),
                                  )
                                ],
                              ));
                              setState(() {

                              });
                            },
                            icon: Icon(Icons.edit),
                          )
                        ],
                      ),
                      Divider(),
                      SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Icon(Icons.email,),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Email',
                                  style: TextStyle(
                                    fontSize: 22,

                                  ),
                                ),
                                Text(
                                  email.text,
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black12
                                  ),
                                )
                              ],
                            ),
                          ),
                          IconButton(
                            onPressed: () async{
                              await showDialog(context: context, builder: (_)=> AlertDialog(
                                title: Text('Email'),
                                content: TextField(
                                  controller: email,
                                ),
                                actions: [
                                  InkWell(
                                    child: Text('Save'),
                                    onTap: ()=> Navigator.pop(context,),
                                  )
                                ],
                              ));
                              setState(() {

                              });
                            },
                            icon: Icon(Icons.edit),
                          )
                        ],
                      ),
                      Divider(),

                      SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Icon(Icons.date_range,),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Date of birth',
                                  style: TextStyle(
                                    fontSize: 22,

                                  ),
                                ),
                                Text(
                                  date.text,
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black12
                                  ),
                                )
                              ],
                            ),
                          ),
                          IconButton(
                            onPressed: () async{
                              var _dateController;
                              await showDialog(context: context, builder: (_)=>DatePickerDialog(
                                firstDate: DateTime(1940),
                                lastDate: DateTime(2025),
                                initialDate: _initialDate,
                                errorFormatText: 'Enter valid date',
                                helpText: 'Select date',
                                errorInvalidText: 'Enter date in valid range',
                              ),);
                              setState(() {

                              });
                            },
                            icon: Icon(Icons.edit),
                          )
                        ],
                      ),
                      Divider(),

                    ],
                  ),
                )



              ],
            ),
          ),
        ),

      );
  }
  openCamera() async {

    var image = await ImagePicker().pickImage(source: ImageSource.camera);
    path = File(image?.path ?? '');
    setState(() {

    });
  }

  openGallery() async {
    var image = await ImagePicker().pickImage(source: ImageSource.gallery);
    path = File(image?.path ?? '');
    setState(() {

    });
  }


}
