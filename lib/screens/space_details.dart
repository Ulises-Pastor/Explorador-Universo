import 'package:explorador_universo/models/objeto.dart';
import 'package:flutter/material.dart';

class SpaceDetails extends StatefulWidget {
  final Objeto recipesData;
  const SpaceDetails({super.key, required this.recipesData});
  @override
  SpaceDetailsState createState() => SpaceDetailsState();
}

class SpaceDetailsState extends State<SpaceDetails> {
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.recipesData.name),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 37, 0, 37),
        leading: IconButton(
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(5),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              child: SizedBox(
                height: 400,
                width: double.infinity,
                child: Image.network(
                  widget.recipesData.image,
                  fit: BoxFit.cover,
                  width: MediaQuery.of(context).size.width,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      widget.recipesData.description,
                      style: TextStyle(fontSize: 22),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
