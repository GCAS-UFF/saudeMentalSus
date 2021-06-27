import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobx/mobx.dart';
import 'package:saudeMentalSus/pages/maps_page/maps_page.dart';
import 'package:saudeMentalSus/pages/splash_page/controller/splash_controller.dart';

import '../../injection_container.dart';

class SplashPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SplashPageState();
  }
}

class _SplashPageState extends State<SplashPage> {
  late SplashController _controller;
  List<ReactionDisposer> _disposers = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _controller = sl.get<SplashController>();
    _disposers = [
      reaction(
        (_) => _controller.errorMessage,
        (String message) => {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(message),
          ))
        },
      ),
      reaction(
        (_) => _controller.state == StoreState.loaded,
        (bool sucess) => {
          if (sucess)
            {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => MapsPage(
                    currentPosition: LatLng(
                        _controller.currentPosition!.latitude,
                        _controller.currentPosition!.longitude),
                  ),
                ),
              )
            }
        },
      )
    ];
  }

  @override
  void dispose() {
    _disposers.forEach((d) => d());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(
        builder: (_) {
          switch (_controller.state) {
            case StoreState.initial:
              return LoadingDots();
            case StoreState.loading:
              return LoadingDots();
            case StoreState.loaded:
              return LoadingDots();
          }
        },
      ),
    );
  }
}

class LoadingDots extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SpinKitThreeBounce(
        color: Color(0xff5E9B9E),
      ),
    );
  }
}
