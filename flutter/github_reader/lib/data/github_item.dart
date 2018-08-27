class GitHubItem {
  final int id;
  final String name;
  final String url;
  final String description;
  
  GitHubItem({this.id, this.name, this.url, this.description});

  factory GitHubItem.fromJson(Map<String, dynamic> json) => GitHubItem(
    id: json['id'] as int,
    name: json['name'] as String,
    url: json['html_url'] as String,
    description: json['description'] as String
  );
}