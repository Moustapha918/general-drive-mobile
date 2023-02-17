import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VehiculeData extends StatefulWidget {
  const VehiculeData({Key? key}) : super(key: key);

  @override
  State<VehiculeData> createState() => _VehiculeDataState();
}

class _VehiculeDataState extends State<VehiculeData> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
            body: SingleChildScrollView(
                child: Column(children: [
      SizedBox(
        width: size.width,
        height: size.height * .3,
        child: Stack(
          fit: StackFit.expand,
          children: [
            CarouselSlider(
                options: CarouselOptions(
                    onPageChanged: (index, reason) {
                      setState(() {
                        _index = index;
                      });
                    },
                    viewportFraction: 1.1,
                    disableCenter: true),
                items: [0, 1, 2]
                    .map((e) => Image.asset('assets/images/skoda.jpg',
                        fit: BoxFit.cover))
                    .toList()),
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [0, 1, 2]
                          .map((e) => Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              child: CircleAvatar(
                                  backgroundColor: _index == e
                                      ? Colors.yellowAccent
                                      : Colors.white,
                                  maxRadius: 4)))
                          .toList())),
            ),
            _ActionButton(
                icon: Icons.close,
                onPressed: () {
                  print('---------close window');
                  Navigator.of(context).pop(context);
                },
                position: Alignment.topLeft),
            _ActionButton(
                icon: CupertinoIcons.share,
                onPressed: () {},
                position: Alignment.topRight)
          ],
        ),
      ),
      Padding(
          padding: const EdgeInsets.only(top: 15, left: 20, right: 20),
          child: Row(children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text('Skoda Fabia',
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              Row(children: [
                ...List.generate(
                    5,
                    (index) => const Icon(CupertinoIcons.star_fill,
                        color: Color(0xFFF7C973), size: 20)),
                const SizedBox(width: 5),
                const Text(
                  '103',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                )
              ]),
              const SizedBox(height: 10),
              Row(
                children: const [
                  SizedBox(width: 1),
                  Icon(CupertinoIcons.location_solid,
                      color: Color(0xFF450857), size: 20),
                  Text('1,28 Km · 2016 · 5 places',
                      style: TextStyle(
                          color: Colors.grey, fontWeight: FontWeight.w600))
                ],
              )
            ]),
            const Spacer(),
            Stack(
              children: [
                Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 30, horizontal: 15),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(color: Colors.black.withOpacity(0.1))
                        ]),
                    child: Column(children: const [
                      Text('83€',
                          style: TextStyle(
                              fontSize: 26, fontWeight: FontWeight.bold)),
                      SizedBox(height: 5),
                      Text(
                        'Pour 3 jours',
                        style: TextStyle(color: Colors.grey, fontSize: 16),
                      )
                    ])),
                const Positioned(
                    right: 0,
                    top: -1,
                    child: Icon(Icons.info, color: Color(0xFFA020A1))),
              ],
            )
          ])),
      const SizedBox(height: 5),
      SizedBox(width: size.width * .94, child: const Divider()),
      const SizedBox(height: 15),
      Container(
        width: size.width,
        margin: const EdgeInsets.symmetric(horizontal: 15),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 22),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border:
                Border.all(color: Colors.grey.withOpacity(0.5), width: 0.6)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('assets/icons/key_icon.png',
                width: 30, color: const Color(0xFF553163)),
            const SizedBox(width: 10),
            const Flexible(
              child: Text.rich(TextSpan(children: [
                TextSpan(
                    text: 'Sur rendez-vous\n',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        height: 1.3)),
                TextSpan(
                    text:
                        'Apres avoir accepte votre demande de reservation, le proprietaire vous remettra les cles en main propre au debut de la location.\n',
                    style: TextStyle(color: Colors.grey, height: 1.3)),
                TextSpan(style: TextStyle(color: Color(0xFF5C9B47)), children: [
                  WidgetSpan(
                      alignment: PlaceholderAlignment.middle,
                      child: Icon(Icons.circle,
                          size: 10, color: Color(0xFF5C9B47))),
                  TextSpan(
                      text: " Taux d'acceptation: bon",
                      style: TextStyle(height: 1.6, fontSize: 15))
                ])
              ])),
            ),
          ],
        ),
      ),
      const SizedBox(height: 18),
      const Divider(),
      const SizedBox(height: 35),
      const Padding(
          padding: EdgeInsets.only(left: 15),
          child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Distance incluse',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
              ))),
      const SizedBox(height: 8),
      const Divider(),
      const ListTile(
        leading: Icon(Icons.check_circle, color: Color(0xFF5CD796)),
        minVerticalPadding: 0,
        contentPadding: EdgeInsets.only(left: 10),
        horizontalTitleGap: 0,
        title: Text('600 km incluse'),
      ),
      const Divider(),
      const SizedBox(height: 8),
      SizedBox(
        width: size.width * .8,
        height: 50,
        child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                backgroundColor: const Color(0xFFA12BA2)),
            child: const Text(
              'Envoyer une demande',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            )),
      ),
      const SizedBox(height: 15)
    ]))));
  }
}

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final AlignmentGeometry position;
  const _ActionButton(
      {Key? key,
      required this.icon,
      required this.onPressed,
      required this.position})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: position,
        child: TextButton(
            style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
                alignment: Alignment.center,
                shape: const CircleBorder(),
                backgroundColor: Colors.black.withOpacity(0.65)),
            onPressed: () {},
            child: Icon(icon, color: Colors.white, size: 26)));
  }
}
