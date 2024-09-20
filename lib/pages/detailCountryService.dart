import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:country_work/models/countryModel.dart';


class DetailCountryPage extends StatefulWidget {
  final CountryModel country;
  DetailCountryPage({
    Key? key,                   //?
    required this.country,
  }) : super (key: key);

  @override
  State<DetailCountryPage> createState() => _DetailCountryPageState();
}

class _DetailCountryPageState extends State<DetailCountryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.country.name, //pega lá da models
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.green.shade800,
      ),
      body: SingleChildScrollView( 
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 10,),
              Image.network(widget.country.flag), // puxa a imagem da bandeira através do 'flag' da models
              
              SizedBox(height: 10,),
              Text(widget.country.region,
              style: TextStyle(fontSize: 17),
              ),

              SizedBox(height: 10,),
              Text('Population: ${widget.country.population}',
              style: TextStyle(fontSize: 17),        
              ),

              SizedBox(height: 10,),
              TextButton(onPressed: () {
                _launchUrl(widget.country.map); //launchUrl??
              },
               child: Text('Ver pais no Google Maps'),
              ),
              SizedBox(height: 10,),

              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green.shade800,
                  foregroundColor: Colors.white,
                  fixedSize: Size(240, 40),
                ),
                onPressed: (){
                },
                label: Text('Adicionar aos Favoritos'),
                icon: Icon(Icons.favorite),
              ),
              SizedBox(height: 10,), 
            ],
            ),
        
        ),
      ),
    );
  }
}
Future<void> _launchUrl(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Não foi possível abrir o link: $url';
  }
}