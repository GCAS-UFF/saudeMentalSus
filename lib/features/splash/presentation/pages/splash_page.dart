import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
import 'package:saudeMentalSus/features/maps/presentation/maps_page.dart';
import 'package:saudeMentalSus/features/splash/presentation/mobx/splash_store.dart';

class SplashPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SplashPageState();
  }
}

class _SplashPageState extends State<SplashPage> {
  SplashStore _splashStore;
  List<ReactionDisposer> _disposers;
  GlobalKey<ScaffoldState> _sacaffoldKey = GlobalKey();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _splashStore ??= Provider.of<SplashStore>(context);
    _disposers ??= [
      reaction(
        (_) => _splashStore.errorMessage,
        (String message) => {
          _sacaffoldKey.currentState.showSnackBar(SnackBar(
            content: Text(message),
          ))
        },
      ),
      reaction(
        (_) => _splashStore.isDataLoaded,
        (bool sucess) => {
          if (sucess != null && sucess)
            {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => MapsPage(),
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
          switch (_splashStore.state) {
            case StoreState.initial:
              return Center(
                child: Text("Initial"),
              );
            case StoreState.loading:
              return Center(
                child: Text("Loading"),
              );
            case StoreState.loaded:
              return Center(
                child: Text("Loaded"),
              );
          }
        },
      ),
    );
  }
}
