import 'package:flutter/material.dart';
import 'package:testapp/src/models/news_models.dart';

import 'borde_box.dart';

class CardList extends StatelessWidget {
  final List<Result> results;

  const CardList({super.key, required this.results});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Simula una espera de 4 segundos
      future: Future.delayed(const Duration(seconds: 4)),
      builder: (context, snapshot) {
        // Mientras se espera, muestra el CircularProgressIndicator
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else {
          // Después de la espera, verifica si los resultados están vacíos
          if (results.length == 0) {
            // Si los resultados están vacíos, muestra un mensaje de error
            return const Center(
              child: FadeInImage(
                placeholder: AssetImage('assets/internet-no-connection.png'),
                image: AssetImage('assets/internet-no-connection.png'),
                fit: BoxFit.cover,
              ),
            );
          } else {
            // Si los resultados no están vacíos, muestra la lista
            return ListView.builder(
              itemCount: results.length,
              itemBuilder: (_, int index) {
                final result = results[index];
                return _Card(result: result);
              },
            );
          }
        }
      },
    );
  }
}

class _Card extends StatelessWidget {
  final Result result; // Agregar un parámetro para aceptar un objeto Result

  _Card(
      {required this.result}); // Inicializar el objeto Result en el constructor

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          Navigator.pushNamed(context, 'users_detail', arguments: result),
      child: Container(
        margin: const EdgeInsets.only(left: 10, bottom: 5, right: 10, top: 5),
        child: BorderBox(
          child: Container(
            // color: Colors.red,
            margin: const EdgeInsets.symmetric(),
            child: Row(
              children: [
                // Hero(
                //   tag: 1,
                //   child:
                ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: FadeInImage(
                      placeholder: const AssetImage('assets/no-image.jpg'),
                      image: NetworkImage(result.picture!.large.toString()),
                      width: 70,
                      height: 70,
                      fit: BoxFit.cover,
                    )),
                // ),
                Container(
                  //height: 180,
                  width: 200,
                  margin: const EdgeInsets.symmetric(horizontal: 30),

                  // color: Colors.red,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "${result.name!.title.toString()} ${result.name!.first.toString()} ${result.name!.last.toString()}",
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(color: Colors.black),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        result.email.toString(),
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
