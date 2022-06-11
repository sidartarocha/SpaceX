
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:localization/localization.dart';
import 'package:space_x_app/util/constants.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:expandable_text/expandable_text.dart';

class SpaceCardModel extends StatelessWidget {
  final String image;
  final String nameMission;
  final String description;
  final String date;
  final String link ;
  final Function? onPressed;

  const SpaceCardModel(
      {Key? key,
        required this.image,
        required this.nameMission,
        required this.description,
        required this.date,
        required this.link,
        this.onPressed
      }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(
        left: kDefaultPadding,
        top: kDefaultPadding / 2,
        bottom: kDefaultPadding * 1.5,
      ),
      width: screenSize.width ,
      child: Row(
        children: [
          InkWell(
            onTap: (){
              _launchUri(Uri.parse(link));
            },
            child: Ink.image(
              image: NetworkImage(image),
              width: 120,
              height: 120,
            ),
          ),
          Container(width: 180,
            padding: const EdgeInsets.all(kDefaultPadding / 2),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)
                ),
                boxShadow: [
                  BoxShadow(
                      offset: const Offset(0, 10),
                      blurRadius: 50,
                      color: kPrimaryColor.withOpacity(0.23)
                  )
                ]
            ),
            // child: Row(
            //   children: [
            //     RichText(
            //         text: TextSpan(
            //             children: [
            //               TextSpan(
            //                   text: "$nameMission\n".toUpperCase(),
            //                   style: Theme.of(context).textTheme.button
            //               ),
            //               TextSpan(
            //                   text: "$date\n".toUpperCase(),
            //                   style: TextStyle(
            //                       color: kPrimaryColor.withOpacity(0.5)
            //                   )
            //               ),
            //             ]
            //         ),
            //     ),
            //     Expanded(
            //         child: RichText(
            //             text: TextSpan (
            //               text: description
            //             )
            //
            //     ))
            //   ]
            //
            // ),
            child: Card(
              child: Column(
                children: [
                  ListTile(
                    title: Text(
                      "$nameMission".toUpperCase(),
                      style: TextStyle(fontWeight: FontWeight.w500),),
                    subtitle: Text("$date".toUpperCase()),
                    leading: Icon(
                      Icons.rocket,
                      color: Colors.blue[500],
                    ),
                  ),
                    ExpandableText(
                      description,
                      expandText: 'showMore'.i18n(),
                      collapseText: 'showLess'.i18n(),
                      maxLines: 3,
                      linkColor: Colors.blue,
                    ),

                ],
              ),
            ),

          )
        ],
      ),
    );
  }

  void _launchUri(Uri uri) async {
    if (!await launchUrl(uri)) throw 'Could not launch $uri';
  }
}

