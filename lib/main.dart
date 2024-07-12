import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/cat_provider.dart';
import 'models/cat.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CatProvider()),
      ],
      child: MaterialApp(
        title: 'Flutter CATAPI Demo',
        home: CatFactListScreen(),
      ),
    );
  }
}

class CatFactListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CATS Facts'),
      ),
      body: Consumer<CatProvider>(
        builder: (context, provider, child) {
          if (provider.isLoading) {
            return Center(child: CircularProgressIndicator());
          }

          if (provider.catsList.isEmpty) {
            return Center(child: Text('No cat facts available.'));
          }

          return ListView.builder(
            itemCount: provider.catsList.length,
            itemBuilder: (context, index) {
              CatF catfact = provider.catsList[index];
              return ListTile(
                title: Text(catfact.text), // Mostrar el texto del hecho de gato
                onTap: () {
                  // Puedes agregar una navegación a un detalle de gato aquí
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Provider.of<CatProvider>(context, listen: false).fetchCATS();
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}
