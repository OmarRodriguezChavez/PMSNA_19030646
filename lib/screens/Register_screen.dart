import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
//import 'package:cross_file/cross_file.dart';
import 'dart:io';

import '../firebase/email_auth.dart';
//import 'dart:html';



class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  EmailAuth? emailAuth;
  TextEditingController emailUser= TextEditingController();
  TextEditingController passwordUser= TextEditingController();
  final _formKey = GlobalKey<FormState>();
  void _onFormSubmit(){
    final form = _formKey.currentState;
    if (form!.validate()){
      showDialog(
        context: context,
         builder: (context) => const AlertDialog(
          title: Text('Confirmación de envio.'),
          content: Text('Registro enviado exitosamente :D'),
         )
      );
    }
  }

  File? image;
  final picker = ImagePicker();

  Future selectImage(option) async{
    var pickedFile;
    if(option==1){
      pickedFile=await picker.getImage(source: ImageSource.camera);
    }else{
      pickedFile=await picker.getImage(source: ImageSource.gallery);
    }
    setState(() {
      if(pickedFile != null){
        image=File(pickedFile.path);
      }else{
        print('No seleccionaste alguna fotografía');
      }
    });
  }

  void options(context){
    showDialog(
      context: context, 
      builder: (BuildContext context){
        return AlertDialog(
          contentPadding:const  EdgeInsets.all(0),
          content: SingleChildScrollView(
            child: Column(
              children: [
                InkWell(
                  onTap: (){
                    selectImage(1);
                  },
                  child: Container(
                    padding:const  EdgeInsets.all(20),
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          width: 1,
                          color: Colors.grey
                        )
                      )
                    ),
                    child: Row(
                      children:const [
                        Expanded(
                          child: Text('Tomar una fotografia', style: TextStyle(fontSize: 16),
                          ),
                        ),
                        Icon(
                          Icons.add_a_photo,
                          color: Color.fromARGB(255, 148, 218, 161),
                        ),
                      ]
                    ),
                  ),
                ),
                InkWell(
                  onTap: (){
                    selectImage(2);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      children:const [
                        Expanded(
                          child: Text('Escoge una imagen existente', style: TextStyle(fontSize: 16),
                          ),
                        ),
                        Icon(
                          Icons.add_photo_alternate_rounded,
                          color: Color.fromARGB(255, 148, 218, 161),
                        ),
                      ]
                    ),
                  ),
                ),
                InkWell(
                  onTap: (){
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration:const  BoxDecoration(
                      color: Colors.black
                    ),
                    child: Row(
                      children:const [
                        Expanded(
                          child: Text('Cancelar', style: TextStyle(fontSize: 16, color: Colors.white), textAlign: TextAlign.center,
                          ),
                        ),
                      ]
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }
    );
  }
  final username=TextFormField(
                decoration: const InputDecoration(
                  label: Text('Nombre del usuario'), 
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if(value!.isEmpty){
                    return ('Por favor ingresa algun nombre.');
                  }
                  return null;
                },
              );
              final email= TextFormField(
                decoration: const InputDecoration(
                  label: Text('Correo electronico'), 
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if(value!.isEmpty)
                      {
                        return 'Favor de ingresar tu correo';
                      }
                      if(!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)){
                        return 'Ingresa un correo valido';
                      }
                      return null;
                },
              );
  bool _showPassword=false;
  final spaceHorizont = const SizedBox(height: 20);
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Registro'),
      ),
      
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              
              //image==null ? Center(): Image.file(image!, width: 150, height: 220, alignment: Alignment.topCenter),
Padding(padding: const EdgeInsets.symmetric(horizontal: 100),
                child: CircleAvatar(
                  
                  radius: 80,
                  //Color.fromARGB(255, 148, 218, 161)
                  backgroundImage: image==null
                  ?  const AssetImage("assets/images/green.JPG")as ImageProvider
                  : FileImage(File(image!.path)),
                  //Image.file(image!, width: 150, height: 220, alignment: Alignment.topCenter) ,
                  child: IconButton(
                    color: Colors.black,
                    padding: const EdgeInsets.all(15),
                    iconSize: 30,
                    icon: const Icon(Icons.add_photo_alternate_sharp),
                    onPressed: (){
                      options(context);
                    },
                  ),
                ),),
              
              spaceHorizont,
              spaceHorizont,
              username,
              spaceHorizont,
             email,
              spaceHorizont,
              TextFormField(
                
                decoration: InputDecoration(
                  label: const Text('Contraseña'), 
                  border: const OutlineInputBorder(),
                  suffixIcon: GestureDetector(
                    child: Icon(_showPassword == false ? Icons.visibility_off : Icons.visibility, color: Color.fromARGB(255, 148, 218, 161),),
                    onTap: (){
                      setState(() {
                        _showPassword == !_showPassword;
                      });
                    },
                  ),
                ),
                obscureText: _showPassword == false ? true : false,
                validator: (value) {
                  if(value!.isEmpty){
                    return ('Por favor ingresa una contraseña.');
                  }
                  return null;
                },
              ),
              spaceHorizont,
              //symmetric(vertical: 16)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 100),//EdgeInsets.symmetric(horizontal: 100),
                child: ElevatedButton(
                  child: Text('Registrarme'),
                  onPressed: (){
                    emailAuth!.createUserWithEmailAndPassword(
                      email: emailUser.text,
                      password: passwordUser.text
                      );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
