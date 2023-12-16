import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:tp70/services/classeservice.dart';
import 'package:tp70/entities/matier.dart';
import 'package:tp70/template/dialog/classedialog.dart';
import 'package:tp70/template/dialog/matierdialog.dart';
import 'package:tp70/template/navbar.dart';

import '../entities/classe.dart';

class MatiereScreen extends StatefulWidget {
  @override
  _MatiereScreenState createState() => _MatiereScreenState();
}

class _MatiereScreenState extends State<MatiereScreen> {
  refresh() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NavBar('Matiers'),
      body: FutureBuilder(
        future: getAllMatiers(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                print(index);
                print(snapshot.data[index]);
                return Slidable(
                  key: Key(((snapshot.data[index] as Matier)
                      .matiereName
                      .toString())),
                  startActionPane: ActionPane(
                    motion: const ScrollMotion(),
                    children: [
                      SlidableAction(
                        onPressed: (context) async {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return MatierDialog(
                                  notifyParent: refresh,
                                  matier: Matier(
                                    (snapshot.data[index] as Matier)
                                        .matiereName,
                                    (snapshot.data[index] as Matier)
                                        .matiereCoef,
                                    (snapshot.data[index] as Matier).matiereId,
                                  ),
                                );
                              });
                          //print("test");
                        },
                        backgroundColor: const Color(0xFF21B7CA),
                        foregroundColor: Colors.white,
                        icon: Icons.edit,
                        label: 'Edit',
                      ),
                    ],
                  ),
                  endActionPane: ActionPane(
                    motion: const ScrollMotion(),
                    dismissible: DismissiblePane(onDismissed: () async {
                      await deleteMatier(snapshot.data[index]['matiereId']);
                      setState(() {
                        snapshot.data.removeAt(index);
                      });
                    }),
                    children: [Container()],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(bottom: 30.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                const Text("Matier : "),
                                Text(
                                  (snapshot.data[index] as Matier).matiereName,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  width: 2.0,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                const Text("Coef : "),
                                Text(
                                  (snapshot.data[index] as Matier)
                                      .matiereCoef
                                      .toString(),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  width: 2.0,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.purpleAccent,
        onPressed: () async {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return MatierDialog(
                  notifyParent: refresh,
                );
              });
          //print("test");
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
