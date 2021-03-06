// Flutter
import 'package:audio_service/audio_service.dart';
import 'package:flutter/material.dart';
import 'package:songtube/internal/languages.dart';

// Internal
import 'package:songtube/provider/configurationProvider.dart';
import 'package:songtube/screens/libraryScreen/socialLinksRow.dart';
import 'package:songtube/screens/libraryScreen/watchHistory.dart';
import 'package:songtube/screens/libraryScreen/watchHistoryRow.dart';
import 'package:songtube/ui/settings/settings.dart';
import 'package:songtube/screens/libraryScreen/components/quickAcessTile.dart';

// Packages
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:songtube/screens/libraryScreen/components/songtubeBanner.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:provider/provider.dart';

class LibraryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ConfigurationProvider config = Provider.of<ConfigurationProvider>(context);
    return Scaffold(
      backgroundColor: Theme.of(context).cardColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).cardColor,
        title: Row(
          children: [
            Container(
              margin: EdgeInsets.only(right: 8),
              child: Icon(
                EvaIcons.folderOutline,
                color: Theme.of(context).accentColor,
              ),
            ),
            Text(
              Languages.of(context).labelLibrary,
              style: TextStyle(
                fontFamily: 'Product Sans',
                fontWeight: FontWeight.w700,
                fontSize: 20,
                color: Theme.of(context).textTheme.bodyText1.color
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 12),
            child: IconButton(
              icon: Icon(EvaIcons.settingsOutline),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute
                  (builder: (context) => SettingsTab()));
              }
            ),
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: ListView(
              children: [
                // Watch History Row (First 10 videos only)
                WatchHistoryRow(),
                SizedBox(height: 8),
                Divider(indent: 12, endIndent: 12),
                // Watch History (All videos)
                ListTile(
                  leading: Icon(EvaIcons.clockOutline),
                  title: Text(
                    "Watch History",
                    style: TextStyle(
                      fontFamily: 'Product Sans',
                    ),
                  ),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return WatchHistoryPage();
                    }));
                  },
                ),
                // Playlist History
                ListTile(
                  leading: Icon(MdiIcons.playlistCheck),
                  title: Text(
                    "Playlist History",
                    style: TextStyle(
                      fontFamily: 'Product Sans',
                    ),
                  ),
                  onTap: () {
                    // TODO: Push Playlist History Page
                  },
                ),
                // Channel History
                ListTile(
                  leading: Icon(EvaIcons.bookOpenOutline),
                  title: Text(
                    "Channel History",
                    style: TextStyle(
                      fontFamily: 'Product Sans',
                    ),
                  ),
                  onTap: () {
                    // TODO: Push Channel History Page
                  },
                ),
                Divider(indent: 12, endIndent: 12),
                // All Social Links
                Container(
                  margin: EdgeInsets.only(left: 16, top: 8),
                  child: Text(
                    "Social",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Product Sans',
                    )
                  ),
                ),
                SocialLinksRow(),
                SizedBox(height: 16),
                Divider(indent: 12, endIndent: 12),
                // Donate
                ListTile(
                  onTap: () {
                    launch("https://paypal.me/artixo");
                  },
                  leading: Icon(
                    EvaIcons.heart,
                    color: Colors.red,
                    size: 36,
                  ),
                  title: Text(
                    Languages.of(context).labelDonate,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Product Sans',
                    )
                  ),
                  subtitle: Text(
                    "Support Development!",
                    style: TextStyle(
                      fontFamily: 'Product Sans'
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 50,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: AudioService?.currentMediaItem != null
              ? BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20)
              ) : null,
              color: Theme.of(context).accentColor
                .withOpacity(0.4),
            ),
            child: Text(
              "About  •  Contact us",
              style: TextStyle(
                fontSize: 15,
                fontFamily: 'Product Sans',
                fontWeight: FontWeight.w600
              ),
            ),
          ),
          if (AudioService?.currentMediaItem != null)
          Container(
            height: kBottomNavigationBarHeight*1.4,
            decoration: BoxDecoration(
              color: Theme.of(context).accentColor.withOpacity(0.4),
            ),
          )
        ],
      )
    );
  }
}