import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import 'package:github_reader/ui/github_items.dart';
import 'package:github_reader/data/github_item.dart';
import 'package:github_reader/data/github_repository.dart';

class GitHubItemsState extends State<GitHubItems> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('GitHub Reader')),
      body: FutureBuilder(
        future: GitHubRepository(http.IOClient()).fetchItems(),
        builder: (context, snapshot) {
          if (snapshot.hasData) return _buildListView(snapshot.data);
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget _buildListView(List<GitHubItem> items) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, i) {
        if (i.isOdd) return Divider();
        return _buildRow(items[i ~/ 2]);
      },
    );
  }

  Widget _buildRow(GitHubItem item) {
    return GestureDetector(
      onTap: () {
        // launch(item.url);
        _launchURL(item.url);
      },
      child: Container(
        padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 2.0, bottom: 2.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(item.name ?? '', style: TextStyle(fontWeight: FontWeight.bold)),
            Text(item.description ?? '', style: TextStyle(color: Colors.grey[500], fontSize: 12.0))
          ],
        ),
      )
    );
  }

  _launchURL(String url) async => await launch(url);
}