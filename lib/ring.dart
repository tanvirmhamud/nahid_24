import 'package:flutter/material.dart';

class RingScreen extends StatefulWidget {
  const RingScreen({ Key? key }) : super(key: key);

  @override
  State<RingScreen> createState() => _RingScreenState();
}

class _RingScreenState extends State<RingScreen> {
   int selectedCard = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ring Screen"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              color:  Color(0xffE5E5E5),
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: GridView.builder(
                itemCount: 10,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(

                mainAxisExtent:30 ,
                crossAxisCount:2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 5,
                
                ), 
                itemBuilder:  (BuildContext,  index){
                return GestureDetector(
                  onTap: (){
                   setState(() {
                     selectedCard=index;
                   }); 
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 2.0,
                            spreadRadius: 0.0,
                            offset: Offset(2.0, 2.0), // shadow direction: bottom right
                        )
                    ],
                    ),
                    child: Card(
                      
                      
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)
                      ),
                      child: Container(
                        height: 5,
                        child: Column(
                          children: [
                            
                            Text("data")
                           
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }
              ),
            ),
          )
        ],
      ),
      
    );
  }
}