import 'package:flutter/material.dart';

class WidgetWithState extends StatefulWidget {
  const WidgetWithState({super.key});

  @override
  State<WidgetWithState> createState() => _WidgetWithStateState();
}

class _WidgetWithStateState extends State<WidgetWithState> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.arrow_back_ios),
          centerTitle: true,
          title: const Text('Tarjeta de Presentación'),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.add),
            ),
          ],
        ),
        body: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                color: Colors.blue[100],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 300,
                      width: 200,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black, // Color del borde
                          width: 2.0, // Ancho del borde
                        ),
                      ),
                      child: Image.network(
                        'https://i.imgur.com/itmXsOI.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'DANIEL VARGAS',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 24),
                        ),
                        Text(
                          'Name',
                          style: TextStyle(
                              fontStyle: FontStyle.italic, fontSize: 20),
                        ),
                        Text(
                          '\nCOLOMBIANA',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 24),
                        ),
                        Text(
                          'Nationality',
                          style: TextStyle(
                              fontStyle: FontStyle.italic, fontSize: 20),
                        ),
                        Text(
                          '\n25th MARCH',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 24),
                        ),
                        Text(
                          'Date of Issue  ',
                          style: TextStyle(
                              fontStyle: FontStyle.italic, fontSize: 20),
                        ),
                        Text(
                          '\nCOLOMBIA',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 24),
                        ),
                        Text(
                          'Authority',
                          style: TextStyle(
                              fontStyle: FontStyle.italic, fontSize: 20),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
