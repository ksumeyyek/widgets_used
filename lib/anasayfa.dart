import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({Key? key}) : super(key: key);

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  String alinanVeri = "";
  var tfController = TextEditingController();
  String resimAdi = "kofte.png";
  bool switchKontrol = false;
  bool checkboxKontrol = false;
  int radioDeger = 0;
  bool progressKontrol = false;
  double ilerleme = 30.0;
  var tfSaat = TextEditingController();
  var tfTarih = TextEditingController();

  String secilenulke = "Türkiye";
  var ulkelerListesi = <String>[];

  void initState() {
    super.initState();
    ulkelerListesi.add("Türkiye");
    ulkelerListesi.add("Almanya");
    ulkelerListesi.add("Fransa");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Widgets kullanımı"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Text(alinanVeri),
              Padding(
                padding: const EdgeInsets.only(left: 50, right: 50),
                child: TextField(
                  controller: tfController,
                  decoration: const InputDecoration(hintText: "Veri"),
                  keyboardType: TextInputType.number,
                  obscureText: true,
                ),
              ),
              TextButton(
                  onPressed: () {
                    setState(() {
                      alinanVeri = tfController.text;
                    });
                  },
                  child: const Text("veriyi al")),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          resimAdi = "ayran.png";
                        });
                      },
                      child: const Text("resim 1")),
                  SizedBox(
                      width: 100,
                      height: 100,
                      child: Image.network(
                          "http://kasimadalan.pe.hu/yemekler/resimler/$resimAdi")),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          resimAdi = "fanta.png";
                        });
                      },
                      child: const Text("resim 2")),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 200,
                    child: SwitchListTile(
                        title: const Text("switch"),
                        controlAffinity: ListTileControlAffinity.leading,
                        value: switchKontrol,
                        onChanged: (bool? veri) {
                          setState(() {
                            switchKontrol = veri!;
                          });
                          print("Switch seçildi: $veri");
                        }),
                  ),
                  SizedBox(
                    width: 200,
                    child: CheckboxListTile(
                        title: const Text("checkbox"),
                        controlAffinity: ListTileControlAffinity.leading,
                        value: checkboxKontrol,
                        onChanged: (bool? veri) {
                          setState(() {
                            checkboxKontrol = veri!;
                          });
                          print("checkbox seçildi: $veri");
                        }),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 200,
                    child: RadioListTile(
                        title: const Text("Barcelona"),
                        value: 1,
                        groupValue: radioDeger,
                        onChanged: (int? veri) {
                          setState(() {
                            radioDeger = veri!;
                          });
                        }),
                  ),
                  SizedBox(
                    width: 200,
                    child: RadioListTile(
                        title: const Text("Real Madrid"),
                        value: 2,
                        groupValue: radioDeger,
                        onChanged: (int? veri) {
                          setState(() {
                            radioDeger = veri!;
                          });
                        }),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          progressKontrol = true;
                        });
                      },
                      child: const Text("başla")),
                  Visibility(
                      visible: progressKontrol,
                      child: const CircularProgressIndicator()),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          progressKontrol = false;
                        });
                      },
                      child: const Text("dur")),
                ],
              ),
              Text(ilerleme.toInt().toString()),
              //inte dönüştürmessen aşırı hassas oluyo
              Slider(
                  min: 0.0,
                  max: 100.0,
                  value: ilerleme,
                  onChanged: (veri) {
                    setState(() {
                      ilerleme = veri;
                    });
                  }),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    width: 120,
                    child: TextField(
                      controller: tfSaat,
                      decoration: const InputDecoration(hintText: "saat"),
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        showTimePicker(
                                context: context,
                                initialTime:
                                    TimeOfDay.fromDateTime(DateTime.now()))
                            .then((value) => {
                                  tfSaat.text = "${value!.hour} : ${value.minute}"
                                });
                      },
                      icon: const Icon(Icons.access_time_outlined)),
                  SizedBox(
                    width: 120,
                    child: TextField(
                      controller: tfTarih,
                      decoration: const InputDecoration(hintText: "tarih"),
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2020),
                                lastDate: DateTime(2025))
                            .then((value) => {
                                  tfTarih.text =
                                      "${value!.day} / ${value.month} / ${value.year}"
                                });
                      },
                      icon: const Icon(Icons.calendar_today)),
                ],
              ),
              DropdownButton(
                  value: secilenulke,
                  icon: const Icon(Icons.arrow_drop_down_outlined),
                  items: ulkelerListesi.map((e) {
                    return DropdownMenuItem(
                      value: e,
                      child: Text(e),
                    );
                  }).toList(),
                  onChanged: (String? veri) {
                    setState(() {
                      secilenulke = veri!;
                    });
                  }),
              GestureDetector(
                onTap: () {
                  print("container tıklanı");
                },
                onDoubleTap:(){
                  print("container çift tıklanı");
                },
                onLongPress: (){
                  print("container uzun tıklanı");
                },
                child: Container(
                  width: 200,
                  height: 50,
                  color: Colors.red,
                ),
              ),
              CupertinoButton.filled(
                  child: const Text("göster"),
                  onPressed: () {
                    print("switch durum:$switchKontrol");
                    print("checkbox durum:$checkboxKontrol");
                    print("radio: $radioDeger");
                    print("slider: $ilerleme");
                    print("slider: $secilenulke");
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
