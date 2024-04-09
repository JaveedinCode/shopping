import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shopping/models/model_class.dart';
import 'package:shopping/services/services.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late List<Products> products;
  @override
  void initState() {
    super.initState();
    products = [];
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.menu,
                color: Colors.deepOrangeAccent,
                size: 40,
              )),
          title: const Text(
            'tap.az',
            style: TextStyle(
                color: Colors.deepOrangeAccent,
                fontWeight: FontWeight.bold,
                fontSize: 30),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            products = await getProducts();
            setState(() {});
          },
          child: const Icon(Icons.refresh),
        ),
        body: ListView(physics: const BouncingScrollPhysics(), children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                SizedBox(
                  height: 50,
                  width: 340,
                  child: Row(children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 19, 18, 18),
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                                color: Color.fromARGB(255, 95, 95, 95),
                                width: BorderSide.strokeAlignOutside),
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                        child: Row(
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.search,
                                  color: Color.fromARGB(255, 95, 95, 95),
                                )),
                            const Text(
                              'Əşya və ya xidmət axtar',
                              style: TextStyle(
                                  color: Color.fromARGB(255, 95, 95, 95),
                                  fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ]),
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2),
              itemCount: products.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  margin: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Text(
                        products[index].id.toString(),
                      ),
                      Text(products[index].title),
                      Expanded(child: Image.network(products[index].thumbnail)),
                    ],
                  ),
                );
              },
            ),
          )
        ]
            // ListView(
            //   physics: const BouncingScrollPhysics(),
            //   children: [
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Row(
            //     children: [
            //       SizedBox(
            //         height: 50,
            //         width: 340,
            //         child: Row(children: [
            //           Expanded(
            //             child: ElevatedButton(
            //               onPressed: () {},
            //               style: ElevatedButton.styleFrom(
            //                 backgroundColor:
            //                     const Color.fromARGB(255, 19, 18, 18),
            //                 shape: RoundedRectangleBorder(
            //                   side: const BorderSide(
            //                       color: Color.fromARGB(255, 95, 95, 95),
            //                       width: BorderSide.strokeAlignOutside),
            //                   borderRadius: BorderRadius.circular(12.0),
            //                 ),
            //               ),
            //               child: Row(
            //                 children: [
            //                   IconButton(
            //                       onPressed: () {},
            //                       icon: const Icon(
            //                         Icons.search,
            //                         color: Color.fromARGB(255, 95, 95, 95),
            //                       )),
            //                   const Text(
            //                     'Əşya və ya xidmət axtar',
            //                     style: TextStyle(
            //                         color: Color.fromARGB(255, 95, 95, 95),
            //                         fontSize: 18),
            //                   ),
            //                 ],
            //               ),
            //             ),
            //           ),
            //         ]),
            //       ),
            //     ],
            //   ),
            // ),
            // SizedBox(
            //   child: GridView.builder(
            //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            //         crossAxisCount: 2),
            //     itemCount: products.length,
            //     itemBuilder: (BuildContext context, int index) {
            //       return Card(
            //         child: Column(
            //           children: [
            //             Text(products[index].brand),
            //             Image.network(products[index].brand)
            //           ],
            //         ),
            //       );
            //     },
            //   ),
            // ),
            ),
      ),
    );
  }
}
