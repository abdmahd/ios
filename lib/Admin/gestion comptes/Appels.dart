import 'package:final_project/Admin/gestion%20comptes/delateaccount.dart';
import 'package:final_project/Client/core/service/firestore_user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class Appels extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // ignore: missing_required_param
    return GetBuilder<FireStoreUsers>(
      init : FireStoreUsers(),
          builder:(controller)=> Scaffold(
         appBar: AppBar(
           title: Container(
              
             //  alignment: Alignment.center,
               child: Table(
                // columnWidths: {
                  // 1: FlexColumnWidth(.10),
                 // },
                border: TableBorder.all(),
                children : [
                  TableRow(children: [
                    Text('User_ID',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                    Text('User_Name', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                    Text('Full_Name',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                    Text('Email',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                    Text('Wilaya',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                    Text('Phone-number',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                    Text('Age', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                    Text('SUPPRIMER / \n BLOQUER ', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                  ],
                  ),
                  
                ],
        ),
             ),
          ),
          body:
          ListView.builder(
            itemCount: controller.userModel.length,
            itemBuilder: (context, index ){
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 1.0 , horizontal : 4.0),
                child: Card(
                  
                  child:Table(
                   
                // columnWidths: {
                  // 1: FlexColumnWidth(.10),
                 // },
                border: TableBorder.all(),
                children : [
                  TableRow(children: [
                    Text(controller.userModel[index].userId),
                    Text(controller.userModel[index].username),
                    Text(controller.userModel[index].fullname),
                    Text(controller.userModel[index].email),
                    Text(controller.userModel[index].wilaya),
                    Text(controller.userModel[index].phonenumber),
                    Text(controller.userModel[index].age),
                    
                      Column(children: [  new FlatButton.icon(onPressed: (){
                      Get.to(delateaccount(),);
                     
                        }, label: Text('SUPPRIMER')
                        ,icon:Icon(Icons.delete)) ,
                      new FlatButton.icon(onPressed: (){}, label: Text('BLOQUER'),icon:Icon(Icons.lock) ),],),
                  ],
                  ),
                ],
        ),
                  )
                
              );

            }

          )
          

        
      
      ),
    );
  }
}

  