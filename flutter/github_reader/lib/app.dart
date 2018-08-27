import 'package:flutter/material.dart';
import 'package:github_reader/ui/github_items.dart';

class GitHubReader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'App',
      home: GitHubItems()
    );
  }
}