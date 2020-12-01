
import 'package:burc2/utilis/stringler.dart';
import 'package:flutter/material.dart';
import 'models/burc.dart';

class BurcListesi extends StatelessWidget {
   static List<Burc> tumBurclar;

  @override
  Widget build(BuildContext context) {
    tumBurclar = veriKaynaginiHazirla();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Burç Rehberi",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: listeyiHazirla(),
    );
  }

  List<Burc> veriKaynaginiHazirla() {
    List<Burc> burclar = [];

    for (int i = 0; i < 12; i++) {
      String kucukResim = Strings.BURC_ADLARI[i].toLowerCase() + "${i + 1}.jpg";
      String buyukResim =
          Strings.BURC_ADLARI[i].toLowerCase() + "_uzun" + "${i + 1}.jpg";
      Burc eklenecek = Burc(Strings.BURC_ADLARI[i], Strings.BURC_TARIHLERI[i],
          Strings.BURC_GENEL_OZELLIKLERI[i], kucukResim, buyukResim);
      burclar.add(eklenecek);
    }
    return burclar;
  }

  Widget listeyiHazirla() {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return tekSatirBurc(context, index);
      },
      itemCount: 12,
    );
  }

  Widget tekSatirBurc(BuildContext context, int index) {
    Burc oanListeyeEklenenBurc = tumBurclar[index];
    return Card(
      elevation: 5,
      child: ListTile(
        onTap: ()=> Navigator.pushNamed(context, "/burcDetay/$index "),
        leading: Image.asset(
          "images/" + oanListeyeEklenenBurc.burcKucukResim,
          width: 64,
          height: 64,
        ),
        title: Text(
          oanListeyeEklenenBurc.burcAdi,
          style: TextStyle(
              fontSize: 24,
              fontFamily: "Quattrocento",
              color: Colors.pink.shade200),
        ),
        subtitle: Text(
          oanListeyeEklenenBurc.burcTarihi,
          style: TextStyle(fontFamily: "Quattrocento"  ,fontSize: 18,color: Colors.pink.shade700),
        ),
        trailing: Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}
