// ignore_for_file: prefer_const_constructors

import 'package:delivery/models/order_model.dart';
import 'package:flutter/material.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("Commendes"), backgroundColor: Colors.black),
        body: FutureBuilder(
            future: fetchOrder(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return Center(child: const CircularProgressIndicator());
              } else {
                return Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                  child: ListView.builder(
                      itemCount: snapshot
                          .data.length, //productController.products.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Row(children: [
                              CircleAvatar(
                                radius: 48,
                                backgroundImage: NetworkImage(
                                  snapshot.data[index].imageOrder,
                                ),
                              ),
                              /*Image.network(
                                snapshot.data[index].imageOrder,
                                width: 100,
                                height: 80,
                                fit: BoxFit.cover,
                              ),*/
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      snapshot.data[index].nameOrder,
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      snapshot.data[index].nameClient,
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      snapshot.data[index].priceOrder,
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Row(children: [
                                ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.black,
                                      shape: RoundedRectangleBorder(),
                                      elevation: 0),
                                  child: Text(
                                    "Accepter",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ]),
                            ]));
                      }),
                );
              }
            }),
      ),
    );
  }
}
