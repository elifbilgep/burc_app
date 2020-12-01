import 'package:burc2/burc_liste.dart';
import "package:flutter/material.dart";
import 'package:palette_generator/palette_generator.dart';

import 'models/burc.dart';

class BurcDetay extends StatefulWidget {
  int gelenIndex;

  BurcDetay(this.gelenIndex);

  @override
  _BurcDetayState createState() => _BurcDetayState();
}

class _BurcDetayState extends State<BurcDetay> {
  Burc secilenBurc;
  PaletteGenerator paletteGenerator;
  Color baskinRenk;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    secilenBurc = BurcListesi.tumBurclar[widget.gelenIndex];

    baskinRengiBul();
  }

  void baskinRengiBul(){
    Future<PaletteGenerator> fPaletGenerator= PaletteGenerator.fromImageProvider(AssetImage("images/" + secilenBurc.burcBuyukResim));

    fPaletGenerator.then((value) {
      paletteGenerator = value;

      setState(() {
        baskinRenk=paletteGenerator.dominantColor.color;
      });


    });
  }




  @override
  Widget build(BuildContext context) {



    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 250,
            floating: true,
            pinned: true,
            primary: true,
            backgroundColor:baskinRenk != null? baskinRenk : Colors.pink.shade50 ,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              background: Image.asset("images/" + secilenBurc.burcBuyukResim,fit: BoxFit.cover,),
            ),
          ),
          SliverToBoxAdapter(
            child: SingleChildScrollView(

              child: Container(
                color: Colors.grey.shade200,
                margin: EdgeInsets.all(8.0),
                child: Text(
                  secilenBurc.burcDetayi,
                  style: TextStyle(fontSize: 18, color: Colors.grey.shade700),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
