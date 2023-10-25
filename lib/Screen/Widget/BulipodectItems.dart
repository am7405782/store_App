import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled19/Bloc/Cubit/MyCubit.dart';
import 'package:untitled19/Bloc/Cubit/ShopStates.dart';

class BulipodectItems extends StatelessWidget {
  PageController? pageController;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShopCubit(),
      child: BlocConsumer<ShopCubit, ShopState>(
        listener: (context, state) {},
        builder: (context, state) =>
            Scaffold(body: ShowPrdectDeatels(pageController, context)),
      ),
    );
  }
}

Widget ShowPrdectDeatels(PageController? controller, context) =>
    SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Container(
              // width: MediaQuery.of(context).size.width*0.5,

              height: MediaQuery.of(context).size.height * 0.5,
              padding: EdgeInsets.only(top: 50),

              child: PageView.builder(
                itemBuilder: (context, index) => Image(
                  image: NetworkImage(
                      "https://student.valuxapps.com/storage/uploads/products/1638738160hkG50.1.jpg"),
                ),
              ),
            ),
            Text(
              "NAME:\nM-33 Live Stream 360 Degree Rotated LED Ring Light 33 cm With "
              "Mobile Phone Holder And 2.1 Meter Stand - Black & White",
              style: GoogleFonts.abhayaLibre(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "Brand:Other\r\nColor:Black White\r\nModel Number:M33\r\nSize:33cm\r\nlight Mode:3 Mode of Light (White,Yellow,Warm)\r\nPlug Type:USB Power\r\nPackage Includes:LED Ring Light ,Mobile Phone Holder , 2.1 Meter Stand\r\n360 Degree Rotated\r\nMulti Porpuse Using\r\nSiutable For Selfie Photos, Photographers, Bloggers, Makeup Artists, etc",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 18,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Text(
                  " price: 160",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Spacer(),
                Container(
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    " BYNOW",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
