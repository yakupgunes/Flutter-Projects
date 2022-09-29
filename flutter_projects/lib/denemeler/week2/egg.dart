// ignore_for_file: sort_child_properties_last, prefer_final_fields, use_key_in_widget_constructors, must_be_immutable, prefer_const_literals_to_create_immutables, prefer_const_constructors, unnecessary_brace_in_string_interps, duplicate_ignore, unnecessary_new, prefer_typing_uninitialized_variables, unnecessary_string_interpolations, unrelated_type_equality_checks, list_remove_unrelated_type

import 'package:flutter/material.dart';
import 'package:flutter_projects/denemeler/week2/egg.Variables.dart';
import 'egg.Add.dart';

class EggSeller extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: EggSellerList(),
    );
  }
}

class EggSellerList extends StatefulWidget {
  const EggSellerList({super.key});

  @override
  State<EggSellerList> createState() => _EggSellerListState();
}

class _EggSellerListState extends State<EggSellerList>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.animateTo(2);
  }

  List<Tab> _tabs = [
    const Tab(
      icon: Icon(Icons.add),
      text: ("Küçük"),
    ),
    const Tab(
      icon: Icon(Icons.add_circle),
      text: ("Orta"),
    ),
    const Tab(
      icon: Icon(Icons.add_comment),
      text: ("Büyük"),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              labelColor: Colors.black,
              tabs: _tabs,
            ),
            title: const Text(
              "Yumurta Listesi",
              style: TextStyle(fontSize: 25, color: Colors.black),
            ),
            centerTitle: true,
            backgroundColor: Colors.amber,
          ),
          body: TabBarView(
            children: [
              ListView.builder(
                  itemCount: views["sm"]!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      trailing: IconButton(
                        onPressed: () {
                          setState(() {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    backgroundColor: Colors.amber,
                                    title: Text(
                                      "Sil",
                                    ),
                                    content: Text(
                                      "Silinsin mi?",
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    actions: [
                                      InkWell(
                                        child: Text(
                                          "Hayır",
                                          style: TextStyle(fontSize: 20),
                                        ),
                                        onTap: () {
                                          return Navigator.pop(context);
                                        },
                                      ),
                                      SizedBox(height: 10.0),
                                      InkWell(
                                        child: Text(
                                          "Evet",
                                          style: TextStyle(fontSize: 20),
                                        ),
                                        onTap: () {
                                          setState(() {
                                            views["sm"]!.removeAt(index);
                                            return Navigator.pop(context);
                                          });
                                        },
                                      ),
                                    ],
                                  );
                                });
                          });
                        },
                        icon: Icon(
                          Icons.delete,
                          color: Colors.black,
                        ),
                      ),
                      title: Text(
                        textAlign: TextAlign.center,
                        "İsim:"
                        "${views["sm"]![index].isim}\n"
                        "Ağırlık:"
                        "${views["sm"]![index].agirlik} GR\n"
                        "Tür:"
                        "${views["sm"]![index].tur}",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    );
                  }),
              ListView.builder(
                  itemCount: views["md"]!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                        trailing: IconButton(
                          onPressed: () {
                            setState(() {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      backgroundColor: Colors.amber,
                                      title: Text("Sil"),
                                      content: Text(
                                        "Silinsin mi?",
                                        style: TextStyle(fontSize: 20),
                                      ),
                                      actions: [
                                        InkWell(
                                          child: Text(
                                            "Hayır",
                                            style: TextStyle(fontSize: 20),
                                          ),
                                          onTap: () {
                                            return Navigator.pop(context);
                                          },
                                        ),
                                        SizedBox(height: 10),
                                        InkWell(
                                          child: Text(
                                            "Evet",
                                            style: TextStyle(fontSize: 20),
                                          ),
                                          onTap: () {
                                            setState(() {
                                              views["md"]!.removeAt(index);
                                              return Navigator.pop(context);
                                            });
                                          },
                                        ),
                                      ],
                                    );
                                  });
                            });
                          },
                          icon: Icon(
                            Icons.delete,
                            color: Colors.black,
                          ),
                        ),
                        title: Text(
                          textAlign: TextAlign.center,
                          "İsim:"
                          "${views["md"]![index].isim}\n"
                          "Ağırlık:"
                          "${views["md"]![index].agirlik} GR\n"
                          "Tür:"
                          "${views["md"]![index].tur}",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ));
                  }),
              ListView.builder(
                  itemCount: views["lr"]!.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      trailing: IconButton(
                        icon: Icon(
                          Icons.delete,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          setState(
                            () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      backgroundColor: Colors.amber,
                                      title: Text("Sil"),
                                      content: Text(
                                        "Silinsin mi?",
                                        style: TextStyle(fontSize: 20),
                                      ),
                                      actions: [
                                        InkWell(
                                          child: Text(
                                            "Hayır",
                                            style: TextStyle(fontSize: 20),
                                          ),
                                          onTap: () {
                                            return Navigator.pop(context);
                                          },
                                        ),
                                        SizedBox(height: 10.0),
                                        InkWell(
                                          child: Text(
                                            "Evet",
                                            style: TextStyle(fontSize: 20),
                                          ),
                                          onTap: () {
                                            setState(() {
                                              views["lr"]!.removeAt(index);
                                              return Navigator.pop(context);
                                            });
                                          },
                                        ),
                                      ],
                                    );
                                  });
                            },
                          );
                        },
                      ),
                      title: Text(
                        textAlign: TextAlign.center,
                        "İsim:"
                        "${views["lr"]![index].isim}\n"
                        "Ağırlık:"
                        "${views["lr"]![index].agirlik} GR\n"
                        "Tür:"
                        "${views["lr"]![index].tur}",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                    );
                  }),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const YumurtaSayfasi(),
                ),
              );
              setState(() {});
            },
            tooltip: "Yumurta ekle",
            child: const Icon(
              Icons.add,
              color: Colors.black,
            ),
            backgroundColor: Colors.amber,
          ),
        ),
      ),
    );
  }
}
