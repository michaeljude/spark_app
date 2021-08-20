import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spark_app/theme/app_theme.dart';
import 'package:flutter_icons/flutter_icons.dart';

class PaymentScreen extends StatefulWidget {
  static final String routeName = "/payment";

  final String text;

  PaymentScreen({this.text}) : super();

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  final String sparkLogo = 'assets/images/S-logo.svg';
  final String noData = 'assets/images/no-data.svg';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: HexColor('#ffffff'),
        elevation: 0.0,
        title: Text("Payment",
          style: TextStyle(

              color: HexColor('#525252'),
              fontSize: 18,
              fontFamily: 'Montserrat',
              fontWeight: FontWeight.w500),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 10),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: <Widget>[
                  // _buildHeader(),
                  SizedBox(height: 16),
                  _buildGradientBalanceCard(),
                  SizedBox(height: 24.0),
                  _buildCategories(),
                ],
              ),
            ),
            SizedBox(height: 32),
            _buildTransactionList(),
          ],
        ),
      ),
    );
  }

  Container _buildTransactionList() {
    return Container(
      height: 400,
      padding: const EdgeInsets.only(top: 30),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: 5,
            color: Colors.grey.withOpacity(0.1),
            offset: Offset(0, -10),
          ),
        ],
      ),
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),

        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 11.0 * 3),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(

                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "Recent transactions",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Montserrat'
                      ),
                    ),
                    Text(
                      "See All",
                      style: TextStyle(
                        color: HexColor('#117E96'),
                        fontSize: 16,
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Montserrat'

                      ),
                    )
                  ],
                ),
                SizedBox(height: 30),
                SvgPicture.asset(
                  noData,
                  semanticsLabel: 'Spark Logo',
                  height: 200,
                  width: 200,

                ),
                Text(
                  'No Transaction found',
                  style: TextStyle(fontFamily: 'Montserrat', fontSize: 16, fontWeight: FontWeight.w500),
                ),
                // SizedBox(height: 16.0 * 2),
                // _buildTransactionItem(
                //   color: Colors.deepPurpleAccent,
                //   iconData: Icons.photo_size_select_actual,
                //   title: "Electric Bill",
                //   date: "Today",
                //   amount: 11.5,
                // ),
                // SizedBox(height: 24),
                // _buildTransactionItem(
                //   color: Colors.green,
                //   iconData: Icons.branding_watermark,
                //   title: "Water Bill",
                //   date: "Today",
                //   amount: 15.8,
                // ),
                // SizedBox(height: 24),
                // _buildTransactionItem(
                //   color: Colors.orange,
                //   iconData: Icons.music_video,
                //   title: "Spotify",
                //   date: "Yesterday",
                //   amount: 05.5,
                // ),
                // SizedBox(height: 24),
                // _buildTransactionItem(
                //   color: Colors.red,
                //   iconData: Icons.wifi,
                //   title: "Internet",
                //   date: "Yesterday",
                //   amount: 10.0,
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Row _buildCategories() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        _buildCategoryCard(
          bgColor: HexColor("#ffffff"),
          iconColor: HexColor('#19BA19'),
          iconData: MaterialCommunityIcons.wallet_plus_outline,
          text: "Cash In",
        ),
        _buildCategoryCard(
          bgColor: HexColor("#ffffff"),
          iconColor: HexColor('#19BA19'),
          iconData: MaterialCommunityIcons.qrcode_scan,
          text: "Scan",
        ),
        _buildCategoryCard(
          bgColor: HexColor("#ffffff"),
          iconColor: HexColor('#19BA19'),
          iconData: MaterialCommunityIcons.bank_outline,
          text: "Transfer",
        ),
        _buildCategoryCard(
          bgColor: HexColor("#ffffff"),
          iconColor: HexColor('#19BA19'),
          iconData: MaterialCommunityIcons.arrow_top_right,
          text: "Send",
        ),
      ],
    );
  }

  Container _buildGradientBalanceCard() {
    return Container(
      height: 140,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            HexColor('#7EB100').withOpacity(0.9),
            HexColor('#19BA19'),
          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 0, left: 0, right: 30),
                    child: Container(

                      child: SvgPicture.asset(
                        sparkLogo,
                        semanticsLabel: 'Spark Logo',
                        height: 80,
                        width: 80,
                      ),
                    ),
                  ),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "SPARK CREDITS",
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.9),
                            fontSize: 18,
                            fontFamily: 'Montserrat'
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          "PHP 3,500.00",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontFamily: 'Montserrat',
                            fontSize: 26,
                          ),
                        ),
                      ],
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

  // Row _buildHeader() {
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //     children: <Widget>[
  //       Column(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: <Widget>[
  //           Text(
  //             "Hello,",
  //             style: TextStyle(
  //               fontSize: 16,
  //               color: Colors.grey,
  //               fontWeight: FontWeight.w500,
  //             ),
  //           ),
  //           SizedBox(height: 8),
  //           Text(
  //             "Bemia Johnson",
  //             style: TextStyle(
  //               fontSize: 20,
  //               color: Colors.black,
  //               fontWeight: FontWeight.w500,
  //             ),
  //           ),
  //         ],
  //       ),
  //       Container(
  //         height: 56,
  //         width: 56,
  //         decoration: BoxDecoration(
  //           borderRadius: BorderRadius.circular(10.0),
  //           image: DecorationImage(
  //             image: AssetImage("assets/avatar.jpg"),
  //             colorFilter: ColorFilter.mode(
  //               Colors.deepPurple[100],
  //               BlendMode.darken,
  //             ),
  //           ),
  //         ),
  //       ),
  //     ],
  //   );
  // }

  Row _buildTransactionItem(
      {Color color,
        IconData iconData,
        String date,
        String title,
        double amount}) {
    return Row(
      children: <Widget>[
        Container(
          height: 52,
          width: 52,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Icon(
            iconData,
            color: Colors.white,
          ),
        ),
        SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              date,
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
            Text(
              title,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
            )
          ],
        ),
        Spacer(),
        Text(
          "-\$ $amount",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ],
    );
  }

  Column _buildCategoryCard(
      {Color bgColor, Color iconColor, IconData iconData, String text}) {
    return Column(
      children: <Widget>[
        Container(
          height: 75,
          width: 75,
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(5),
          ),
          child: Icon(
            iconData,
            color: iconColor,
            size: 36,
          ),
        ),
        SizedBox(height: 8),
        Text(text),
      ],
    );
  }
}