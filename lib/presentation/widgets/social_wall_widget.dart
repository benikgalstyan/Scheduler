import 'package:flutter/material.dart';

class SocialWallWidget extends StatefulWidget {
  const SocialWallWidget({super.key});

  @override
  State<SocialWallWidget> createState() => _SocialWallWidgetState();
}

class _SocialWallWidgetState extends State<SocialWallWidget> {
  var _bluesky = false;
  var _twitter = false;
  var _linkedIn = false;
  var _mastodon = false;

  static const fontSize = 16.0;
  static const paddingHorizontal = EdgeInsets.only(left: 12.0);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: paddingHorizontal,
          child: Text(
            "Socials",
            style: TextStyle(fontSize: fontSize),
          ),
        ),
        Row(
          children: [
            Checkbox(
              value: _twitter,
              onChanged: (bool? value) {
                setState(() {
                  _twitter = value!;
                });
              },
            ),
            const Text("Twitter/x"),
          ],
        ),
        Row(
          children: [
            Checkbox(
              value: _linkedIn,
              onChanged: (bool? value) {
                setState(() {
                  _linkedIn = value!;
                });
              },
            ),
            const Text("LinkedIn"),
          ],
        ),
        Row(
          children: [
            Checkbox(
              value: _bluesky,
              onChanged: (bool? value) {
                setState(() {
                  _bluesky = value!;
                });
              },
            ),
            const Text("Bluesky"),
          ],
        ),
        Row(
          children: [
            Checkbox(
              value: _mastodon,
              onChanged: (bool? value) {
                setState(() {
                  _mastodon = value!;
                });
              },
            ),
            const Text("Mastodon"),
          ],
        ),
      ],
    );
  }
}
