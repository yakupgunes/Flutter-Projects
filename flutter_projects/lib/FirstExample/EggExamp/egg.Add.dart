// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_final_fields, unused_field, unused_local_variable, no_leading_underscores_for_local_identifiers, prefer_is_empty, prefer_typing_uninitialized_variables, avoid_print, camel_case_types, unnecessary_brace_in_string_interps, non_constant_identifier_names, unnecessary_string_interpolations
import 'package:flutter/material.dart';
import 'package:flutter_projects/FirstExample/EggExamp/egg.Class.dart';
import 'package:flutter_projects/FirstExample/EggExamp/egg.Variables.dart';
import 'package:uuid/uuid.dart';

class YumurtaSayfasi extends StatefulWidget {
  final int? id;
  const YumurtaSayfasi({Key? key, this.id}) : super(key: key);
  @override
  State<YumurtaSayfasi> createState() => _YumurtaSayfasiState();
}

class _YumurtaSayfasiState extends State<YumurtaSayfasi> {
  late String isim, tur;
  late int agirlik;
  var id;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Eklenecek Yumurtaları Girin",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.amber,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.always,
            child: Column(
              children: [
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "İsim",
                      hintText: "İsim Giriniz"),
                  onSaved: (deger) {
                    isim = deger!;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Ağırlık",
                      hintText: "Ağırlık Giriniz"),
                  onSaved: (deger) {
                    agirlik = int.parse(deger ?? "");
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: "Tür",
                      hintText: "Tür Giriniz"),
                  onSaved: (deger) {
                    tur = deger!;
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      const uuid = Uuid();
                      id = uuid.v1();
                    });
                    bool _validate = _formKey.currentState!.validate();
                    if (_validate) {
                      _formKey.currentState!.save();
                    }
                    String result =
                        "ID:$id\nİsim:$isim\nAğırlık:$agirlik\nTür:$tur";

                    if (agirlik <= 40) {
                      views["sm"]!.add(
                        SavedEggs(
                            isim: "${isim}", agirlik: agirlik, tur: "${tur}"),
                      );
                    } else if (agirlik > 40 && agirlik < 60) {
                      views["md"]!.add(
                        SavedEggs(
                            isim: "${isim}", agirlik: agirlik, tur: "${tur}"),
                      );
                    } else {
                      views["lr"]!.add(
                        SavedEggs(
                            isim: "${isim}", agirlik: agirlik, tur: "${tur}"),
                      );
                    }
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: Colors.amber,
                        content: Text(
                          result,
                          style: TextStyle(fontSize: 24),
                        ),
                      ),
                    );
                    _formKey.currentState!.reset();
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.amber,
                  ),
                  child: Text("Kaydet"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
