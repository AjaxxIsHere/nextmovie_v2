// ignore_for_file: camel_case_types, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:nextmovie_v2/utilities/text_styles.dart';

class descriptionPage extends StatelessWidget {
  final String name, description, bannerUrl, posterUrl, votes, release_date;

  const descriptionPage(
      {super.key,
      required this.name,
      required this.description,
      required this.bannerUrl,
      required this.posterUrl,
      required this.votes,
      required this.release_date});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: ListView(children: [
          Container(
            height: 250,
            child: Stack(
              children: [
                Positioned(
                    child: Container(
                  height: 250,
                  width: MediaQuery.of(context).size.width,
                  child: Image.network(
                    bannerUrl,
                    fit: BoxFit.cover,
                  ),
                )),
                Positioned(
                    bottom: 10,
                    child: textModified(
                        text: '  ⭐ Rating - $votes',
                        color: Colors.white,
                        size: 20))
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: textModified(
              text: name != null ? name : "Not Loading...",
              color: Colors.white,
              size: 25,
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 10),
            child: textModified(
                text: 'Release On - $release_date',
                color: Colors.white,
                size: 14),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              /*Container(
                height: 200,
                width: 100,
                child: Image.network(posterUrl),
              ),*/
              Flexible(
                child: Container(
                  child: textModified(
                    text: description,
                    color: Colors.white,
                    size: 18,
                  ),
                ),
              )
            ],
          )
        ]),
      ),
    );
  }
}
