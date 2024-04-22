import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_2/screens/home_screen.dart';

class ResponsiveScreen extends StatelessWidget {
  const ResponsiveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size; //tamaño de la pantalla

    return Scaffold(
      appBar: AppBar(
        leading: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                width: 1,
                color: Colors.black26,
              )),
          child: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_rounded),
            onPressed: () {
              Navigator.pop(context,
              MaterialPageRoute(builder: (context) => const HomeScreen()));
            },
          ),
        ),
        actions: <Widget>[
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  width: 1,
                  color: Colors.black26,
                )),
            child: IconButton(
              icon: const Icon(Icons.ios_share_rounded),
              onPressed: () {
                print('Botón share presionado');
              },
            ),
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(
                  width: 1,
                  color: Colors.black26,
                )),
            child: IconButton(
              icon: const Icon(Icons.bookmark_outline_rounded),
              onPressed: () {
                print('Otro botón presionado');
              },
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Lorem ipsum',
                  style: TextStyle(
                    fontSize: 35.0.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  'Lorem ipsum',
                  style: TextStyle(
                    fontSize: 20.0.sp,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                SizedBox(
                  height: 385.h,
                  child: ListView(
                    padding: const EdgeInsets.all(10),
                    children: [
                      CarouselSlider(
                        items: [
                          Container(
                            margin: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              image: const DecorationImage(
                                image: NetworkImage(
                                    "https://picsum.photos/id/49/500"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              image: const DecorationImage(
                                image: NetworkImage(
                                    "https://picsum.photos/id/16/500"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                        options: CarouselOptions(
                          height: 365.0.h,
                          enlargeCenterPage: true,
                          autoPlay: true,
                          aspectRatio: 16 / 9,
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enableInfiniteScroll: true,
                          autoPlayAnimationDuration:
                              const Duration(milliseconds: 800),
                          viewportFraction: 0.8,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Spacer(),
                  Details(
                      title: 'title1', subtitle: 'subtitle1', text: 'text1'),
                  Spacer(),
                  Details(
                      title: 'title2', subtitle: 'subtitle2', text: 'text2'),
                  Spacer(),
                  Details(
                      title: 'title3', subtitle: 'subtitle3', text: 'text3'),
                  Spacer(),
                ]),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Column(children: [
                Container(
                  padding: const EdgeInsets.only(top: 10),
                  alignment: Alignment.topLeft,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(30)),
                  ),
                  child: Text(
                    'Specifications',
                    style: TextStyle(fontSize: 30.sp),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius:
                        const BorderRadius.vertical(bottom: Radius.circular(30)),
                  ),
                  child: const Row(
                    children: [
                      Spacer(),
                      Specifications(title: 'Color', subtitle: 'white'),
                      Spacer(),
                      Specifications(title: 'Year', subtitle: '2024'),
                      Spacer(),
                      Specifications(title: 'Price', subtitle: "200"),
                      Spacer(),
                    ],
                  ),
                )
              ]),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(27),
              child: FloatingActionButton.extended(
                onPressed: () {},
                label: const Text('Buy'),
                icon: const Icon(Icons.add_shopping_cart),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Details extends StatefulWidget {
  final String title, subtitle, text;

  const Details(
      {super.key,
      required this.title,
      required this.subtitle,
      required this.text});

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isSelected = !_isSelected;
        });
      },
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: _isSelected ? Colors.blue : Colors.blueGrey,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.grey.shade300,
            width: 2.0,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Text(
                widget.title,
                style: TextStyle(
                  fontSize: 15.0.sp,
                  fontWeight: FontWeight.w300,
                  color: _isSelected ? Colors.black : Colors.white,
                ),
              ),
              Text(
                widget.subtitle,
                style: TextStyle(
                  fontSize: 25.0.sp,
                  fontWeight: FontWeight.w400,
                  color: _isSelected ? Colors.black : Colors.white,
                ),
              ),
              Text(
                widget.text,
                style: TextStyle(
                  fontSize: 15.0.sp,
                  fontWeight: FontWeight.w300,
                  color: _isSelected ? Colors.black : Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Specifications extends StatelessWidget {
  final String title, subtitle;

  const Specifications(
      {super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.blueGrey, width: 2.0),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(children: [
          Text(title,
              style: TextStyle(
                fontSize: 15.0.sp,
                fontWeight: FontWeight.w300,
                color: Colors.black,
              )),
          Text(subtitle,
              style: TextStyle(
                fontSize: 20.0.sp,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              )),
        ]),
      ),
    );
  }
}
