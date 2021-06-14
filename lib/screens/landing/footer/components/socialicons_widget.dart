import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio_website/utils/colors.dart';
import 'package:portfolio_website/utils/images.dart';
import 'package:portfolio_website/utils/strings.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialIcons extends StatelessWidget {
  const SocialIcons({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: kdefaultPadding * 1.5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Tooltip(message: Strings.githuburl,
                      child: MouseRegion(cursor: SystemMouseCursors.click,

                        child: GestureDetector(
                          
                  onTap: _launchGithub,
                  child: SvgPicture.asset(Images.github,
                      color: kSecondaryColor, height: 30, width: 30)),
            ),
          ),
          SizedBox(width: kdefaultPadding * 1.5),
         Tooltip(message: Strings.instagramurl,
                    child: MouseRegion(cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                onTap: _launchInstagram,
                child: SvgPicture.asset(Images.instagram,
                    color: kSecondaryColor, height: 30, width: 30))),
         ),
          SizedBox(width: kdefaultPadding * 1.5),
         Tooltip(message: Strings.linkedinurl,
                    child: MouseRegion(cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                  onTap: _launchLinkedIn,
                  child: SvgPicture.asset(Images.linkedin,
                      color: kSecondaryColor, height: 30, width: 30)),
            ),
         ),
        ],
      ),
    );
  }

  _launchGithub() async {
    const url = Strings.githuburl;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }_launchInstagram() async {
    const url = Strings.instagramurl;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }_launchLinkedIn() async {
     const url = Strings.linkedinurl;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

class SocialIconsVertical extends StatelessWidget {
  const SocialIconsVertical({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.5,
          child: Padding(
        padding: const EdgeInsets.only(top: kdefaultPadding * 1.5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Tooltip(message: Strings.githuburl,
                        child: MouseRegion(cursor: SystemMouseCursors.click,

                          child: GestureDetector(
                            
                    onTap: _launchGithub,
                    child: SvgPicture.asset(Images.github,
                        color: kSecondaryColor, height: 20, width: 20)),
              ),
            ),
            SizedBox(height: kdefaultPadding * 1.2),
           Tooltip(message: Strings.instagramurl,
                      child: MouseRegion(cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                  onTap: _launchInstagram,
                  child: SvgPicture.asset(Images.instagram,
                      color: kSecondaryColor, height: 20, width: 20))),
           ),
            SizedBox(height: kdefaultPadding * 1.2),
           Tooltip(message: Strings.linkedinurl,
                      child: MouseRegion(cursor: SystemMouseCursors.click,
                          child: GestureDetector(
                    onTap: _launchLinkedIn,
                    child: SvgPicture.asset(Images.linkedin,
                        color: kSecondaryColor, height: 20, width: 20)),
              ),
           ),
          ],
        ),
      ),
    );
  }

  _launchGithub() async {
    const url = Strings.githuburl;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }_launchInstagram() async {
    const url = Strings.instagramurl;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }_launchLinkedIn() async {
     const url = Strings.linkedinurl;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
