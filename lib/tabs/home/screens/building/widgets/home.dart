import 'package:flutter/material.dart';

class BuildingHome extends StatefulWidget {
  final String _building;
  final Map<String, dynamic> _details;

  const BuildingHome(this._building, this._details, {Key? key})
      : super(key: key);

  @override
  _BuildingHomeState createState() => _BuildingHomeState();
}

class _BuildingHomeState extends State<BuildingHome> {
  bool _tipVisible = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      Future.delayed(const Duration(milliseconds: 3000), () {
        setState(() {
          _tipVisible = true;
        });
      });
      Future.delayed(const Duration(milliseconds: 10000), () {
        setState(() {
          _tipVisible = false;
        });
      });
    });
  }

  @override
  void setState(VoidCallback fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                'images/buildings/' + widget._building + '.jpg',
                width: double.infinity,
                height: 300.0,
                fit: BoxFit.cover,
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                    vertical: 15.0, horizontal: 10.0),
                child: Text(
                  widget._details['description'],
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 16,
                      color: Colors.black),
                ),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: AnimatedOpacity(
                opacity: _tipVisible ? 1.0 : 0.0,
                duration: const Duration(milliseconds: 1000),
                child: Container(
                  width: 250.0,
                  height: 50.0,
                  decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      border: Border.all(color: Colors.transparent),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10.0))),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Text(
                        'Tap  ',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.0,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      Icon(Icons.menu, color: Colors.white),
                      Text(
                        ' to view the list of rooms',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.0,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ),
              )),
        ),
      ],
    );
  }
}
