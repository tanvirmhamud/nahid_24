import 'package:flutter/material.dart';
import 'package:nahid_24/Http/Notification/notification.dart';

import '../../Model/notification.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notification"),
      ),
      body: FutureBuilder<NotificationDAta?>(
          future: HttpNotification().getnotification(),
          builder: ((context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.data!.length,
                  itemBuilder: ((context, index) {
                    var data = snapshot.data!.data![index];
                    return Container(
                      child: Column(
                        children: [
                          Text(
                            data.title ?? "",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            data.message ?? "",
                            style: TextStyle(fontSize: 14),
                          )
                        ],
                      ),
                    );
                  }));
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          })),
    );
  }
}
