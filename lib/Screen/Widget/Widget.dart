import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled19/Model/Catroies.dart';

Widget CatroisBuilder(DataModel data) => Container(
      width: 130,
      height: 150,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.bottomCenter,
        children: [
          Positioned(
            top: 10,
            child: Image(
              image: NetworkImage(
                "${data.image}",
              ),
              width: 130,
              height: 130,
            ),
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.brown, borderRadius: BorderRadius.circular(12)),
            child: Text(
              "${data.name}",
              style: GoogleFonts.aboreto(
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
