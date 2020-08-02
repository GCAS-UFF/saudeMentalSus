import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:saudeMentalSus/features/google/services/generate_list_cards.dart';
import 'package:saudeMentalSus/features/maps/data/models/city_model.dart';

class ShowListCards extends StatefulWidget {
  final LatLng currentPosition;
  final List<CityModel> cities;

  const ShowListCards(
      {Key key, @required this.currentPosition, @required this.cities})
      : super(key: key);

  @override
  _ShowListCardsState createState() => _ShowListCardsState();
}

class _ShowListCardsState extends State<ShowListCards> {
  final generateListCards = new GenerateListCards();
  List<Widget> cards;
  load(BuildContext context) async {
    var data = await generateListCards.generate(
        context, widget.cities, widget.currentPosition);
    setState((){
      cards = data;
    });
  }
  
  @override
  void initState(){
    load(context);
    super.initState();
  }
  
  @override
  Widget build(BuildContext context){
    return (cards == null)? Center(child: CircularProgressIndicator()) : ListView.builder(
      itemCount: cards.length,
      itemBuilder: (context, index) => cards[index],
    );
  }
}
