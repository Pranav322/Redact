import "package:flutter/material.dart";

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          leading: Icon(Icons.lock_outline),
          title: Text("Privacy Policy"),
          onTap: () {
            // TODO: Implement privacy policy action
          },
        ),
        ListTile(
          leading: Icon(Icons.help_outline),
          title: Text("Help"),
          onTap: () {
            // TODO: Implement help action
          },
        ),
        ListTile(
          leading: Icon(Icons.notifications_none),
          title: Text("Notifications"),
          onTap: () {
            // TODO: Implement notifications settings
          },
        ),
        ListTile(
          leading: Icon(Icons.language),
          title: Text("Language"),
          onTap: () {
            // TODO: Implement language settings
          },
        ),
        ListTile(
          leading: Icon(Icons.info_outline),
          title: Text("About"),
          onTap: () {
            // TODO: Implement about page
          },
        ),
        SizedBox(height: 20),
        Center(
          child: Text(
            "Version 1.0.0",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 14,
            ),
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
