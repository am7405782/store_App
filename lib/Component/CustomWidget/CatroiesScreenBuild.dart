import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Model/Catroies.dart';

Widget CatroiesScreenBuild(context, DataModel model) => Card(
      elevation: 5,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Opacity(
            opacity: 0.9,
            child: Image(
              image: NetworkImage(
                "${model.image}",
              ),
              height: 200,
            ),
          ),
          Positioned(
            child: Text(
              "${model.name}",
              style: GoogleFonts.aboreto(
                color: Colors.black.withOpacity(0.5),
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
