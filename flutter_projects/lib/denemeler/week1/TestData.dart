import 'TestAppSorular.dart';

class TestData {
  int soruIndex = 0;

  List<Soru> sorular = [
    Soru(
        soruMetni: "Titanic gelmiş geçmiş en büyük gemidir.",
        soruYaniti: false),
    Soru(
        soruMetni: "Dünyadaki tavuk sayısı insan sayısından fazladır.",
        soruYaniti: true),
    Soru(
        soruMetni: "Kelebeklerin ömrü bir gündür.sdfsdfsdfsdfsdfsdfsdfsdf",
        soruYaniti: false),
    Soru(
        soruMetni: "Dünya düzdür.sdfsdfsdfsdfsdfsdfsdfdadasdasdasdasdasdasd",
        soruYaniti: false),
    Soru(
        soruMetni: "Kaju fıstığı aslında bir meyvenin sapıdır.",
        soruYaniti: true),
    Soru(
        soruMetni: "Fatih Sultan Mehmet hiç patates yememiştir.",
        soruYaniti: true),
  ];

  String getSoruMetni() {
    return sorular[soruIndex].soruMetni;
  }

  bool getSoruYaniti() {
    return sorular[soruIndex].soruYaniti;
  }

  void sonrakiSoru() {
    if (soruIndex + 1 < sorular.length) {
      soruIndex++;
    }
  }

  bool testBittiMi() {
    if (soruIndex + 1 >= sorular.length) {
      return true;
    } else {
      return false;
    }
  }

  void testiSifirla() {
    soruIndex = 0;
  }
}
