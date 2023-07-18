import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_json_api/Models/get_api_services.dart';
import 'package:local_json_api/Models/posts_model.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Get Api Json',
      home: MyHomePage(),

    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Center(child: Text("Get Json Api")),
    ),
      body: FutureBuilder(
        future: getPost(),
        builder: (context,AsyncSnapshot snapshot)
        {
          if(!snapshot.hasData)
            {
              return Center(child: CircularProgressIndicator());
            }
          else
            {
             List<Product>products=snapshot.data;
              return ListView.builder(
                  itemCount:products.length,
                  itemBuilder: (BuildContext context,int index)
                  {
                    return Card(
                      child: ListTile(
                        leading: Image.network(
                          fit: BoxFit.fill,
                         products[index].thumbnail,
                          height: 100,
                          width: 100,
                        ),
                        title: Text(products[index].title),
                        subtitle: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(products[index].brand,
                              maxLines: 1,

                            ),
                            //
                            // Image.network(products[index].images[0],
                            //   height: 50,
                            //   width: 50,),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [

                                  Text(products[index].price.toString()),
                                  SizedBox(height: 4,),
                                  Row(
                                    children: [
                                      Icon(Icons.star,color: Colors.green,),
                                      Text(products[index].rating.toString()),
                                    ],
                                  ),

                                ],
                              ),
                            ),

                          ],
                        ),
                      ),

                    );
                  }

              );
            }
        },
      ),
          
    );
  }
}
