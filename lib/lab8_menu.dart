import 'package:flutter/material.dart';
// ignore: implementation_imports
import 'package:flutter/src/foundation/key.dart' show Key;
import 'package:flutter/src/widgets/framework.dart';

class LAB8 extends StatefulWidget {
  const LAB8({Key key}) : super(key: key);

  @override
  State<LAB8> createState() => _MenuState();
}

class _MenuState extends State<LAB8> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  void _incrementCounter1() {
    setState(() {
      if (_counter > 0) {
        _counter--;
      } else {
        _counter = 0;
      }
    });
  }

  List<int> total = const [97, 98, 99, 100];

  List<List<dynamic>> foodList = [
    [
      "https://cdn.pixabay.com/photo/2015/08/26/10/58/the-pork-fried-rice-made-908333_960_720.jpg",
      "ผัดกระเพราหมูสับ ไข่ดาว",
      50
    ],
    [
      "https://cdn.pixabay.com/photo/2015/04/07/07/51/papaya-salad-710613_960_720.jpg",
      "ส้มตำปูปลาร้า",
      60
    ],
    [
      "https://cdn.pixabay.com/photo/2014/11/05/15/57/salmon-518032_960_720.jpg",
      "สเต็กแซลม่อน",
      300
    ],
    [
      "https://cdn.pixabay.com/photo/2016/09/15/19/24/salad-1672505_960_720.jpg",
      "สลัดผัก ผลไม้",
      150
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: foodList.length,
      itemBuilder: (_, index) {
        return Card(
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
          child: Container(
            height: 120,
            width: double.infinity,
            child: Stack(
              children: [
                Row(
                  children: [
                    Image.network(foodList[index][0]),
                    Expanded(
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${foodList[index][1]}",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              " ${foodList[index][2]} B",
                              style: TextStyle(
                                color: Colors.green,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 0,
                            ),
                            FloatingActionButton(
                              onPressed: _incrementCounter,
                              backgroundColor: Colors.green,
                              tooltip: ' + ',
                              child: const Icon(Icons.add),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [],
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  alignment: Alignment.bottomRight,
                  child: Chip(
                    backgroundColor: Color.fromARGB(255, 202, 202, 202),
                    label: Text('Total of Food  $_counter',
                        style: Theme.of(context).textTheme.headline4),
                    shadowColor: Colors.black,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  alignment: Alignment.bottomRight,
                  child: Chip(
                    backgroundColor: Color.fromARGB(209, 247, 234, 57),
                    label: Text('$_counter',
                        style: Theme.of(context).textTheme.headline4),
                    shadowColor: Colors.black,
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  alignment: Alignment.bottomCenter,
                  child: FloatingActionButton(
                    backgroundColor: Colors.red,
                    onPressed: _incrementCounter1,
                    tooltip: ' - ',
                    child: const Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
