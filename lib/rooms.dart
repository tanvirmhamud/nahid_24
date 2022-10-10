import 'package:flutter/material.dart';

class RoomScreen extends StatefulWidget {
  const RoomScreen({ Key? key }) : super(key: key);

  @override
  State<RoomScreen> createState() => _RoomScreenState();
}

class _RoomScreenState extends State<RoomScreen> {
   List<Widget>image=[
    Image.asset("assets/accounting_logo.jpg",scale: 6,),
    Image.asset("assets/camera_logo.jpg",scale: 4,),
    Image.asset("assets/book.png",scale: 5,),
    Image.asset("assets/marketing_logo.png",scale: 4.5,),
    Image.asset("assets/marketing_logo.png",scale: 4.5,),
    Image.asset("assets/marketing_logo.png",scale: 4.5,),
    
  ];
   List<String>title=[
    "Living Room",
    "Bedroom",
    "Kitchen",
    "Bathroom",
    "Studio",
    "Washing Room"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffE5E5E5),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xffE5E5E5),
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "All Rooms",
              style: TextStyle(
                fontSize: 20,
                color: Color(0xff181725)
                ),
            ),
            IconButton(
              onPressed: (){}, 
              icon: Icon(Icons.arrow_forward_ios,color: Colors.blue,)
            )
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              color:  Color(0xffE5E5E5),
              child: GridView.builder(
                itemCount: title.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount:2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 10,
                childAspectRatio: 1
                ), 
                itemBuilder:  (BuildContext,  index){
                return GestureDetector(
                  onTap: (){
                    
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
                      color: Colors.blueAccent.withOpacity(0.3),
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // AspectRatio(
                            // aspectRatio: 2,
                            // child: Image.asset("assets")),
                            
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 8),
                              child: Column(
                                children: [
                                   Column(
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      image[index],
                                       Padding(
                                         padding: const EdgeInsets.only(top: 30),
                                         child: Text("${title[index]}",
                                      style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700),),
                                       ),
                                    ],
                                  ),
                                  
                                 
                                ],
                              ),
                            ),
                          ],
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