import 'package:flutter/material.dart';

class Artwork extends StatefulWidget{
  Artwork() : super(key: GlobalKey());

  @override
  State<Artwork> createState() => _ArtworkState();
}

class _ArtworkState extends State<Artwork> {
  bool _isFavorite = false;
  bool _showDescription = false;

  void _toggleIsFavorite() {
    setState(() {
      _isFavorite = !_isFavorite;

      if(_isFavorite) {
        ScaffoldMessenger
            .of(context)
            .showSnackBar(
              const SnackBar(
                content: Text(
                    'Oeuvre ajoutée à vos favoris',
                    style: TextStyle(
                      color: Colors.white
                    )
                ),
                backgroundColor: Colors.red,
              )
            );
      }
    });
  }

  void _toggleShowDescription() {
    setState(() {
      _showDescription = !_showDescription;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Museum'),
        backgroundColor: Colors.brown,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  const Image(image: AssetImage('images/Mona_Lisa.jpg')),
                  _showDescription ?
                    Container(
                      alignment: Alignment.center,
                      child: const SizedBox(
                        height: 300,
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: EdgeInsets.all(64.0),
                            child:  Text(
                                "La Joconde, ou Portrait de Mona Lisa, est un tableau de l'artiste Léonard de Vinci, réalisé entre 1503 et 1506 ou entre 1513 et 15161,2, et peut-être jusqu'à 1517 (l'artiste étant mort le 2 mai 1519), qui représente un portrait mi-corps, probablement celui de la Florentine Lisa Gherardini, épouse de Francesco del Giocondo. Acquise par François Ier, cette peinture à l'huile sur panneau de bois de peuplier de 77 × 53 cm est exposée au musée du Louvre à Paris. La Joconde est l'un des rares tableaux attribués de façon certaine à Léonard de Vinci. La Joconde est devenue un tableau éminemment célèbre car, depuis sa réalisation, nombre d'artistes l'ont pris comme référence. À l'époque romantique, les artistes ont été fascinés par ce tableau et ont contribué à développer le mythe qui l'entoure, en faisant de ce tableau l’une des œuvres d'art les plus célèbres du monde, si ce n'est la plus célèbre : elle est en tout cas considérée comme l'une des représentations d'un visage féminin les plus célèbres au monde. Au xxie siècle, elle est devenue l'objet d'art le plus visité au monde, devant le diamant Hope, avec 20 000 visiteurs qui viennent l'admirer et la photographier quotidiennement.",
                                style: TextStyle(
                                  color: Colors.white
                                )
                            )
                          ),
                        ),
                      )
                    ) :
                    Icon(
                      Icons.favorite,
                      size: 100.0,
                      color: _isFavorite ?
                        Colors.red.withOpacity(1) :
                        Colors.white.withOpacity(0.75),
                    )
                ]
            ),
            const Text(
              'Mona Lisa',
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.brown,
                  fontFamily: 'Merriweather',
                  fontWeight: FontWeight.w700,
              ),
            ),
            const Text(
              'Léonard De Vinci',
              style: TextStyle(
                fontSize: 15,
                color: Colors.brown,
                fontFamily: 'Merriweather',
              ),
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  IconButton(
                    icon: const Icon(
                        Icons.article,
                        color: Colors.brown
                    ),
                    onPressed: () {
                      _toggleShowDescription();
                    },
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.favorite,
                      color: _isFavorite ?
                        Colors.red :
                        Colors.brown,
                    ),
                    onPressed: () {
                      _toggleIsFavorite();
                    },
                  ),
                ]
            ),
          ],
        ),
      ),
    );
  }
}