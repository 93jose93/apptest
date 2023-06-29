import 'package:flutter/material.dart';
import 'package:testapp/src/models/news_models.dart';

class UsersDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //obtenemos los detalles del usario
    final Result result = ModalRoute.of(context)!.settings.arguments as Result;

    return Scaffold(
        body: CustomScrollView(
      slivers: [
        //encabezado de detalle del usuario
        _CustomAppBar(result: result),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              //foto y caracteristica del cliente
              _PosterTitle(result: result),
              //estos son los lorem de ejemplo
              _Overview(),
              _Overview(),
              _Overview(),
            ],
          ),
        ),
      ],
    ));
  }
}

class _CustomAppBar extends StatelessWidget {
  final Result result;

  const _CustomAppBar({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: const Color.fromRGBO(37, 119, 250, 1),
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: const EdgeInsets.all(0),
        title: Container(
          alignment: Alignment.bottomCenter,
          color: Colors.black45,
          width: double.infinity,
          padding: EdgeInsets.only(bottom: 10),
          child: Text(
            "${result.name!.title.toString()} ${result.name!.first.toString()} ${result.name!.last.toString()}",
            style: TextStyle(fontSize: 16),
          ),
        ),
        background: const FadeInImage(
          placeholder: AssetImage('assets/loading.gif'),
          image: AssetImage('assets/logo.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class _PosterTitle extends StatelessWidget {
  final Result result;

  const _PosterTitle({super.key, required this.result});

  @override
  Widget build(BuildContext context) {

    //tomar el tama;o de la pantalla actual
    final size = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: FadeInImage(
              placeholder: AssetImage('assets/no-image.jpg'),
              image: NetworkImage(result.picture!.large.toString()),
              height: 100,
            ),
          ),
          const SizedBox(width: 20),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: size.width - 190),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Email: ${ result.email.toString()}",
                  style: Theme.of(context).textTheme.titleMedium,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                ),
                  const SizedBox(height: 10),
                Text(
                  "Phone: ${ result.phone.toString()}",
                  style: Theme.of(context).textTheme.titleMedium,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                const SizedBox(height: 10),
                Text(
                  "Gender: ${ result.gender.toString()}",
                  style: Theme.of(context).textTheme.titleMedium,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _Overview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: const Text(
          'Duis magna id cillum incididunt deserunt id irure elit sit aliqua eiusmod ea ut eu. Veniam nostrud nisi sit labore enim eiusmod culpa nisi deserunt sit adipisicing. Irure et ex minim quis culpa irure dolore cupidatat excepteur pariatur. Nostrud fugiat sint sint id elit et est irure fugiat. Minim nisi adipisicing velit sit est qui tempor non pariatur aliqua cupidatat esse. Sint esse ea eiusmod nulla irure in ad do deserunt non fugiat labore. Sunt velit aliqua mollit nisi fugiat laboris aliquip sint.',
          textAlign: TextAlign.justify),
    );
  }
}
